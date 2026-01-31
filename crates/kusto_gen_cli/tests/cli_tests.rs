use std::fs;
use std::path::Path;

use assert_cmd::Command;
use assert_cmd::cargo_bin;
use serde_json::Value;

fn fixture_path(name: &str) -> String {
    let root = Path::new(env!("CARGO_MANIFEST_DIR"));
    root.join("tests").join("fixtures").join(name)
        .to_string_lossy()
        .to_string()
}

#[test]
fn cli_parses_input_json() {
    let mut cmd = Command::new(cargo_bin!("kusto_gen"));
    cmd.args(["--input", "print 1", "--format", "json"])
        .assert()
        .success();
}

#[test]
fn cli_golden_print() {
    let mut cmd = Command::new(cargo_bin!("kusto_gen"));
    let output = cmd
        .args(["--file", &fixture_path("print.kql"), "--format", "json"])
        .assert()
        .success()
        .get_output()
        .stdout
        .clone();
    let actual: Value = serde_json::from_slice(&output).unwrap();
    let expected = fs::read_to_string(fixture_path("print.json")).unwrap();
    let expected: Value = serde_json::from_str(&expected).unwrap();
    assert_eq!(actual, expected);
}

#[test]
fn cli_golden_pipe_where_summarize() {
    let mut cmd = Command::new(cargo_bin!("kusto_gen"));
    let output = cmd
        .args([
            "--file",
            &fixture_path("pipe.kql"),
            "--format",
            "json",
        ])
        .assert()
        .success()
        .get_output()
        .stdout
        .clone();
    let actual: Value = serde_json::from_slice(&output).unwrap();
    let expected = fs::read_to_string(fixture_path("pipe.json")).unwrap();
    let expected: Value = serde_json::from_str(&expected).unwrap();
    assert_eq!(actual, expected);
}

#[test]
fn cli_execute_json() {
    let mut cmd = Command::new(cargo_bin!("kusto_gen"));
    cmd.args([
        "--input",
        "StormEvents | where State == 'WA'",
        "--execute",
        "--format",
        "json",
    ])
    .assert()
    .success();
}
