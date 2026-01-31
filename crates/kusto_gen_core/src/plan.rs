use serde::Serialize;

use crate::kql::{lex_tokens_with_text, parse_kql, AstNode, TokenInfo};

#[derive(Debug, Serialize)]
pub struct Plan {
    pub steps: Vec<PlanStep>,
}

#[derive(Debug, Clone, Serialize)]
pub enum PlanStep {
    Source { expression: String },
    Pipe { operator: String, arguments: String },
    Where { predicate: String },
    Summarize { aggregations: String, by: Vec<String> },
    Join { right: String, on: Vec<String> },
}

pub fn plan_kql(input: &str) -> Result<Plan, String> {
    let _ast = parse_kql(input)?;
    let tokens = lex_tokens_with_text(input)?;
    Ok(build_plan_from_tokens(&tokens))
}

fn build_plan_from_tokens(tokens: &[TokenInfo]) -> Plan {
    let mut segments: Vec<Vec<TokenInfo>> = Vec::new();
    let mut current = Vec::new();
    for tok in tokens {
        if tok.kind == "BAR" {
            segments.push(current);
            current = Vec::new();
        } else {
            current.push(tok.clone());
        }
    }
    if !current.is_empty() {
        segments.push(current);
    }

    let mut steps = Vec::new();
    if let Some(first) = segments.first() {
        let expr = segment_text(first);
        if !expr.is_empty() {
            steps.push(PlanStep::Source { expression: expr });
        }
    }

    for seg in segments.iter().skip(1) {
        if seg.is_empty() {
            continue;
        }
        steps.push(build_pipe_step(seg));
    }

    Plan { steps }
}

fn segment_text(segment: &[TokenInfo]) -> String {
    join_tokens(segment)
}

fn operator_and_args(segment: &[TokenInfo]) -> (String, Vec<TokenInfo>) {
    let mut op_idx = 0;
    for (i, tok) in segment.iter().enumerate() {
        if tok.kind != "OPENPAREN" && tok.kind != "CLOSEPAREN" {
            op_idx = i;
            break;
        }
    }
    let operator = segment
        .get(op_idx)
        .map(|t| t.kind.clone())
        .unwrap_or_else(|| "UNKNOWN".to_string());
    let args = if op_idx + 1 < segment.len() {
        segment[op_idx + 1..].to_vec()
    } else {
        Vec::new()
    };
    (operator, args)
}

fn build_pipe_step(segment: &[TokenInfo]) -> PlanStep {
    let (op, args) = operator_and_args(segment);
    match op.as_str() {
        "WHERE" | "FILTER" => PlanStep::Where {
            predicate: join_tokens(&args),
        },
        "SUMMARIZE" => {
            let (agg_tokens, by_tokens) = split_by_token(&args, "BY");
            let aggregations = join_tokens(&agg_tokens);
            let by = split_top_level(&by_tokens, "COMMA")
                .into_iter()
                .map(|group| join_tokens(&group))
                .filter(|s| !s.is_empty())
                .collect();
            PlanStep::Summarize { aggregations, by }
        }
        "JOIN" => {
            let (right_tokens, on_tokens) = split_by_token(&args, "ON");
            let right = join_tokens(&right_tokens);
            let on = split_top_level(&on_tokens, "COMMA")
                .into_iter()
                .map(|group| join_tokens(&group))
                .filter(|s| !s.is_empty())
                .collect();
            PlanStep::Join { right, on }
        }
        _ => PlanStep::Pipe {
            operator: op,
            arguments: join_tokens(&args),
        },
    }
}

fn split_by_token(tokens: &[TokenInfo], kind: &str) -> (Vec<TokenInfo>, Vec<TokenInfo>) {
    let mut depth: usize = 0;
    for (i, tok) in tokens.iter().enumerate() {
        match tok.kind.as_str() {
            "OPENPAREN" | "OPENBRACKET" | "OPENBRACE" | "IDENTIFIER_CALL" => depth += 1,
            "CLOSEPAREN" | "CLOSEBRACKET" | "CLOSEBRACE" => depth = depth.saturating_sub(1),
            _ => {}
        }
        if depth == 0 && tok.kind == kind {
            let left = tokens[..i].to_vec();
            let right = tokens[i + 1..].to_vec();
            return (left, right);
        }
    }
    (tokens.to_vec(), Vec::new())
}

fn split_top_level(tokens: &[TokenInfo], separator: &str) -> Vec<Vec<TokenInfo>> {
    let mut groups = Vec::new();
    let mut current = Vec::new();
    let mut depth: usize = 0;
    for tok in tokens {
        match tok.kind.as_str() {
            "OPENPAREN" | "OPENBRACKET" | "OPENBRACE" | "IDENTIFIER_CALL" => depth += 1,
            "CLOSEPAREN" | "CLOSEBRACKET" | "CLOSEBRACE" => depth = depth.saturating_sub(1),
            _ => {}
        }
        if depth == 0 && tok.kind == separator {
            groups.push(current);
            current = Vec::new();
        } else {
            current.push(tok.clone());
        }
    }
    if !current.is_empty() {
        groups.push(current);
    }
    groups
}

fn join_tokens(tokens: &[TokenInfo]) -> String {
    let mut out = String::new();
    for tok in tokens {
        let text = tok.text.trim();
        if text.is_empty() {
            continue;
        }
        let no_space_before = matches!(
            tok.kind.as_str(),
            "COMMA"
                | "DOT"
                | "CLOSEPAREN"
                | "CLOSEBRACKET"
                | "CLOSEBRACE"
                | "SEMICOLON"
        ) || text.starts_with(')') || text.starts_with(',') || text.starts_with('.');
        let no_space_after = out.ends_with('(') || out.ends_with('[') || out.ends_with('{') || out.ends_with('.');
        if out.is_empty() {
            out.push_str(text);
        } else if no_space_before || no_space_after {
            out.push_str(text);
        } else {
            out.push(' ');
            out.push_str(text);
        }
    }
    out
}

#[allow(dead_code)]
pub fn plan_from_ast(_ast: &AstNode, input: &str) -> Result<Plan, String> {
    let tokens = lex_tokens_with_text(input)?;
    Ok(build_plan_from_tokens(&tokens))
}
