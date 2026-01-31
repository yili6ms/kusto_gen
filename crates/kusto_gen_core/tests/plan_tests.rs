use kusto_gen_core::{plan_kql, PlanStep};

#[test]
fn plan_pipe_where_summarize() {
    let q = "StormEvents | where State == 'WA' | summarize count() by State";
    let plan = plan_kql(q).unwrap();
    assert_eq!(plan.steps.len(), 3);
    match &plan.steps[0] {
        PlanStep::Source { expression } => assert!(expression.contains("StormEvents")),
        _ => panic!("expected source"),
    }
    match &plan.steps[1] {
        PlanStep::Where { predicate } => assert!(predicate.contains("State")),
        _ => panic!("expected where"),
    }
    match &plan.steps[2] {
        PlanStep::Summarize { aggregations, by } => {
            assert!(aggregations.contains("count"));
            assert_eq!(by, &vec!["State".to_string()]);
        }
        _ => panic!("expected summarize"),
    }
}

#[test]
fn plan_pipe_join() {
    let q = "T1 | join T2 on Key";
    let plan = plan_kql(q).unwrap();
    assert_eq!(plan.steps.len(), 2);
    match &plan.steps[1] {
        PlanStep::Join { right, on } => {
            assert!(right.contains("T2"));
            assert_eq!(on, &vec!["Key".to_string()]);
        }
        _ => panic!("expected join"),
    }
}

#[test]
fn plan_summarize_with_bin() {
    let q = "SecurityEvent | summarize Failures = count() by Account, bin(TimeGenerated, 5m)";
    let plan = plan_kql(q).unwrap();
    assert_eq!(plan.steps.len(), 2);
    match &plan.steps[1] {
        PlanStep::Summarize { aggregations, by } => {
            assert!(aggregations.contains("Failures"));
            let normalized: Vec<String> = by
                .iter()
                .map(|s| s.replace(", ", ","))
                .collect();
            assert_eq!(
                normalized,
                vec!["Account".to_string(), "bin(TimeGenerated,5m)".to_string()]
            );
        }
        _ => panic!("expected summarize"),
    }
}
