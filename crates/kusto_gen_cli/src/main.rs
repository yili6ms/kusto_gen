use std::fs;
use std::io::{self, Read};
use std::path::PathBuf;

use clap::{Parser, ValueEnum};
use kusto_gen_core::{analyze_ast, execute_plan, parse_kql, plan_kql};

#[derive(Parser)]
#[command(name = "kusto_gen", about = "Convert KQL to AST")]
struct Args {
    /// Input KQL string. If omitted, reads from stdin.
    #[arg(short, long)]
    input: Option<String>,

    /// Path to a KQL file. Overrides --input if provided.
    #[arg(short, long)]
    file: Option<PathBuf>,

    /// Output format: debug or json.
    #[arg(short = 'm', long, value_enum, default_value = "debug")]
    format: OutputFormat,

    /// Include AST analysis in output.
    #[arg(long)]
    analyze: bool,

    /// Emit execution plan instead of AST.
    #[arg(long)]
    plan: bool,

    /// Execute the plan and emit execution results.
    #[arg(long)]
    execute: bool,
}

#[derive(Clone, ValueEnum)]
enum OutputFormat {
    Debug,
    Json,
}

fn main() {
    let args = Args::parse();
    let input = match args.file {
        Some(path) => match fs::read_to_string(&path) {
            Ok(contents) => contents,
            Err(err) => {
                eprintln!("failed to read {}: {err}", path.display());
                std::process::exit(1);
            }
        },
        None => {
            if let Some(value) = args.input {
                value
            } else {
                let mut buf = String::new();
                if let Err(err) = io::stdin().read_to_string(&mut buf) {
                    eprintln!("failed to read stdin: {err}");
                    std::process::exit(1);
                }
                buf
            }
        }
    };

    if args.execute {
        let plan = match plan_kql(&input) {
            Ok(plan) => plan,
            Err(err) => {
                eprintln!("{err}");
                std::process::exit(1);
            }
        };
        let exec = execute_plan(&plan);
        if args.analyze {
            let ast = match parse_kql(&input) {
                Ok(ast) => ast,
                Err(err) => {
                    eprintln!("{err}");
                    std::process::exit(1);
                }
            };
            let analysis = analyze_ast(&ast);
            match args.format {
                OutputFormat::Debug => {
                    println!("{exec:#?}");
                    println!("{analysis:#?}");
                }
                OutputFormat::Json => {
                    let combined = serde_json::json!({
                        "execution": exec,
                        "analysis": analysis,
                    });
                    match serde_json::to_string_pretty(&combined) {
                        Ok(json) => println!("{json}"),
                        Err(err) => {
                            eprintln!("failed to serialize execution+analysis: {err}");
                            std::process::exit(1);
                        }
                    }
                }
            }
        } else {
            match args.format {
                OutputFormat::Debug => println!("{exec:#?}"),
                OutputFormat::Json => match serde_json::to_string_pretty(&exec) {
                    Ok(json) => println!("{json}"),
                    Err(err) => {
                        eprintln!("failed to serialize execution: {err}");
                        std::process::exit(1);
                    }
                },
            }
        }
        return;
    }

    if args.plan {
        let plan = match plan_kql(&input) {
            Ok(plan) => plan,
            Err(err) => {
                eprintln!("{err}");
                std::process::exit(1);
            }
        };
        if args.analyze {
            let ast = match parse_kql(&input) {
                Ok(ast) => ast,
                Err(err) => {
                    eprintln!("{err}");
                    std::process::exit(1);
                }
            };
            let analysis = analyze_ast(&ast);
            match args.format {
                OutputFormat::Debug => {
                    println!("{plan:#?}");
                    println!("{analysis:#?}");
                }
                OutputFormat::Json => {
                    let combined = serde_json::json!({
                        "plan": plan,
                        "analysis": analysis,
                    });
                    match serde_json::to_string_pretty(&combined) {
                        Ok(json) => println!("{json}"),
                        Err(err) => {
                            eprintln!("failed to serialize plan+analysis: {err}");
                            std::process::exit(1);
                        }
                    }
                }
            }
        } else {
            match args.format {
                OutputFormat::Debug => println!("{plan:#?}"),
                OutputFormat::Json => match serde_json::to_string_pretty(&plan) {
                    Ok(json) => println!("{json}"),
                    Err(err) => {
                        eprintln!("failed to serialize plan: {err}");
                        std::process::exit(1);
                    }
                },
            }
        }
        return;
    }

    match parse_kql(&input) {
        Ok(ast) => {
            if args.analyze {
                let analysis = analyze_ast(&ast);
                match args.format {
                    OutputFormat::Debug => {
                        println!("{ast:#?}");
                        println!("{analysis:#?}");
                    }
                    OutputFormat::Json => {
                        let combined = serde_json::json!({
                            "ast": ast,
                            "analysis": analysis,
                        });
                        match serde_json::to_string_pretty(&combined) {
                            Ok(json) => println!("{json}"),
                            Err(err) => {
                                eprintln!("failed to serialize AST+analysis: {err}");
                                std::process::exit(1);
                            }
                        }
                    }
                }
            } else {
                match args.format {
                    OutputFormat::Debug => println!("{ast:#?}"),
                    OutputFormat::Json => match serde_json::to_string_pretty(&ast) {
                        Ok(json) => println!("{json}"),
                        Err(err) => {
                            eprintln!("failed to serialize AST: {err}");
                            std::process::exit(1);
                        }
                    },
                }
            }
        }
        Err(err) => {
            eprintln!("{err}");
            std::process::exit(1);
        }
    }
}
