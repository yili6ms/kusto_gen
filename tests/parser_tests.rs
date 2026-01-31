use kusto_gen::parse_kql;
use kusto_gen::analyze_ast;

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
