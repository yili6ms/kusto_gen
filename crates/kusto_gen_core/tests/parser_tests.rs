use std::fs;
use std::path::Path;

use kusto_gen_core::{analyze_ast, parse_kql};

#[test]
fn parse_print_literal() {
    let q = "print 1";
    let parsed = parse_kql(q).unwrap();
    assert_eq!(parsed.kind, "rule_1");
}

#[test]
fn parse_multiple_prints() {
    let q = "print 1; print 2";
    let parsed = parse_kql(q).unwrap();
    assert_eq!(parsed.kind, "rule_1");
}

#[test]
fn parse_pipe_where() {
    let q = "StormEvents | where State == 'WA'";
    let parsed = parse_kql(q).unwrap();
    assert_eq!(parsed.kind, "rule_1");
}

#[test]
fn parse_pipe_summarize_by() {
    let q = "StormEvents | summarize count() by State";
    let parsed = parse_kql(q).unwrap();
    assert_eq!(parsed.kind, "rule_1");
}

#[test]
fn parse_pipe_join() {
    let q = "T1 | join T2 on Key";
    let parsed = parse_kql(q).unwrap();
    assert_eq!(parsed.kind, "rule_1");
}

#[test]
fn analyze_ast_counts() {
    let q = "print 1";
    let ast = parse_kql(q).unwrap();
    let analysis = analyze_ast(&ast);
    assert!(analysis.total_nodes > 0);
    assert!(analysis.terminal_nodes > 0);
    assert!(analysis.max_depth > 0);
    assert!(analysis.token_kinds.contains_key("PRINT"));
}

#[test]
fn parse_uc1_example() {
    let root = Path::new(env!("CARGO_MANIFEST_DIR"));
    let path = root.join("..").join("..").join("examples").join("uc1.kql");
    let input = fs::read_to_string(path).unwrap();
    let parsed = parse_kql(&input).unwrap();
    assert_eq!(parsed.kind, "rule_1");
}
