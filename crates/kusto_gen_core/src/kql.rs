use lrlex::lrlex_mod;
use lrpar::{lrpar_mod, Lexeme, Lexer};
use serde::Serialize;
use std::collections::BTreeMap;

lrlex_mod!("kql.l");
lrpar_mod!("kql.y");

#[derive(Debug, Serialize)]
pub struct AstNode {
    pub kind: String,
    pub text: Option<String>,
    pub children: Vec<AstNode>,
}

#[derive(Debug, Clone, Serialize)]
pub struct TokenInfo {
    pub kind: String,
    pub text: String,
}

#[derive(Debug, Serialize)]
pub struct AstAnalysis {
    pub total_nodes: usize,
    pub terminal_nodes: usize,
    pub nonterminal_nodes: usize,
    pub max_depth: usize,
    pub token_kinds: BTreeMap<String, usize>,
    pub rule_kinds: BTreeMap<String, usize>,
}

pub fn parse_kql(input: &str) -> Result<AstNode, String> {
    let lexerdef = kql_l::lexerdef();
    let lexer = lexerdef.lexer(input);
    let (res, errs) = kql_y::parse(&lexer);
    if !errs.is_empty() {
        let mut rendered = Vec::new();
        for err in errs {
            rendered.push(err.pp(&lexer, &kql_y::token_epp));
        }
        return Err(rendered.join("\n"));
    }
    let tree = res.ok_or_else(|| "parse failed with no result".to_string())?;
    Ok(to_ast(&tree, input))
}

pub fn lex_tokens(input: &str) -> Result<Vec<String>, String> {
    let lexerdef = kql_l::lexerdef();
    let lexer = lexerdef.lexer(input);
    let mut tokens = Vec::new();
    for item in lexer.iter() {
        match item {
            Ok(lexeme) => {
                let name = kql_y::token_epp(cfgrammar::TIdx(lexeme.tok_id()))
                    .unwrap_or("TOKEN")
                    .to_string();
                tokens.push(name);
            }
            Err(err) => {
                return Err(err.to_string());
            }
        }
    }
    Ok(tokens)
}

pub fn lex_tokens_with_text(input: &str) -> Result<Vec<TokenInfo>, String> {
    let lexerdef = kql_l::lexerdef();
    let lexer = lexerdef.lexer(input);
    let mut tokens = Vec::new();
    for item in lexer.iter() {
        match item {
            Ok(lexeme) => {
                let kind = kql_y::token_epp(cfgrammar::TIdx(lexeme.tok_id()))
                    .unwrap_or("TOKEN")
                    .to_string();
                let text = input
                    .get(lexeme.span().start()..lexeme.span().end())
                    .unwrap_or("")
                    .to_string();
                tokens.push(TokenInfo { kind, text });
            }
            Err(err) => {
                return Err(err.to_string());
            }
        }
    }
    Ok(tokens)
}

pub fn analyze_ast(ast: &AstNode) -> AstAnalysis {
    let mut analysis = AstAnalysis {
        total_nodes: 0,
        terminal_nodes: 0,
        nonterminal_nodes: 0,
        max_depth: 0,
        token_kinds: BTreeMap::new(),
        rule_kinds: BTreeMap::new(),
    };
    analyze_node(ast, 1, &mut analysis);
    analysis
}

fn analyze_node(node: &AstNode, depth: usize, analysis: &mut AstAnalysis) {
    analysis.total_nodes += 1;
    if depth > analysis.max_depth {
        analysis.max_depth = depth;
    }
    if node.text.is_some() {
        analysis.terminal_nodes += 1;
        *analysis.token_kinds.entry(node.kind.clone()).or_insert(0) += 1;
    } else {
        analysis.nonterminal_nodes += 1;
        *analysis.rule_kinds.entry(node.kind.clone()).or_insert(0) += 1;
    }
    for child in &node.children {
        analyze_node(child, depth + 1, analysis);
    }
}

fn to_ast(node: &lrpar::Node<lrlex::DefaultLexeme<u32>, u32>, input: &str) -> AstNode {
    match node {
        lrpar::Node::Term { lexeme } => {
            let kind = kql_y::token_epp(cfgrammar::TIdx(lexeme.tok_id()))
                .unwrap_or("TOKEN")
                .to_string();
            let text = input
                .get(lexeme.span().start()..lexeme.span().end())
                .map(|s| s.to_string());
            AstNode {
                kind,
                text,
                children: Vec::new(),
            }
        }
        lrpar::Node::Nonterm { ridx, nodes } => {
            let kind = format!("rule_{}", ridx.0);
            let children = nodes.iter().map(|child| to_ast(child, input)).collect();
            AstNode {
                kind,
                text: None,
                children,
            }
        }
    }
}
