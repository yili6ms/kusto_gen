use kusto_gen_core::{execute_plan, plan_kql, StepStatus};

#[test]
fn execute_plan_smoke() {
    let plan = plan_kql("T | where x == 1 | summarize count() by x").unwrap();
    let result = execute_plan(&plan);
    assert_eq!(result.steps.len(), plan.steps.len());
    assert!(result.steps.iter().all(|s| matches!(s.status, StepStatus::Ok)));
}

#[test]
fn execute_plan_join() {
    let plan = plan_kql("T1 | join T2 on Key").unwrap();
    let result = execute_plan(&plan);
    assert_eq!(result.steps.len(), 2);
    assert!(result.steps.iter().all(|s| matches!(s.status, StepStatus::Ok)));
}
