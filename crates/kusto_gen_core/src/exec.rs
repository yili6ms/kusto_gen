use serde::Serialize;

use crate::plan::{Plan, PlanStep};

#[derive(Debug, Serialize)]
pub struct ExecutionResult {
    pub steps: Vec<ExecutionStepResult>,
}

#[derive(Debug, Serialize)]
pub struct ExecutionStepResult {
    pub step: PlanStep,
    pub status: StepStatus,
    pub details: String,
}

#[derive(Debug, Serialize)]
pub enum StepStatus {
    Ok,
    Skipped,
    Error,
}

pub fn execute_plan(plan: &Plan) -> ExecutionResult {
    let mut results = Vec::new();
    for (idx, step) in plan.steps.iter().cloned().enumerate() {
        let (status, details) = match &step {
            PlanStep::Source { expression } => (
                StepStatus::Ok,
                format!("source({expression})"),
            ),
            PlanStep::Where { predicate } => (
                StepStatus::Ok,
                format!("filter({predicate})"),
            ),
            PlanStep::Summarize { aggregations, by } => (
                StepStatus::Ok,
                format!("summarize(aggs={aggregations}, by={})", by.join(", ")),
            ),
            PlanStep::Join { right, on } => (
                StepStatus::Ok,
                format!("join(right={right}, on={})", on.join(", ")),
            ),
            PlanStep::Pipe { operator, arguments } => (
                StepStatus::Ok,
                format!("{operator}({arguments})"),
            ),
        };
        results.push(ExecutionStepResult {
            step,
            status,
            details: format!("step {idx}: {details}"),
        });
    }

    ExecutionResult { steps: results }
}
