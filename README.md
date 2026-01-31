# kusto_gen
[![CI](https://github.com/yili6ms/kusto_gen/actions/workflows/ci.yml/badge.svg)](https://github.com/yili6ms/kusto_gen/actions/workflows/ci.yml)

Kusto Query Language (KQL) lexer + parser built with lrlex/lrpar, using the official Microsoft grammar as the source of truth.

## Features
- Lexer and LALR parser generated from `Kql.g4` and `KqlTokens.g4`.
- AST output via a generic parse tree (no hand-rolled parser).
- CLI to parse KQL to an AST (debug or JSON output).
- Grammar reference stored in repo for traceability.

## Layout
- `Kql.g4`, `KqlTokens.g4`: upstream grammar sources.
- `tools/gen_kql_lrpar.py`: grammar translation to lrlex/lrpar (`crates/kusto_gen_core/src/kql.l`, `crates/kusto_gen_core/src/kql.y`).
- `crates/kusto_gen_core/`: lexer, parser, AST, and analysis.
- `crates/kusto_gen_cli/`: CLI wrapper and golden tests.
- `crates/kusto_gen_web/`: Axum web UI.
- `examples/`: sample queries.
- `scripts/`: helper scripts for web UI.

## CLI
Parse KQL from stdin or a file (workspace):

```
cargo run -p kusto_gen -- --input "StormEvents | where State == 'WA'" --format json
cargo run -p kusto_gen -- --file examples/basic.kql --format debug
```

Options:
- `--input <kql>`: parse from a string.
- `--file <path>`: parse from a file.
- `--format <debug|json>`: output format.
- `--analyze`: include AST analysis (node counts, depth, kind histograms).
- `--plan`: emit execution plan instead of AST.
- `--execute`: execute the plan and emit execution results.

## Grammar generation
Regenerate lexer/parser after updating `Kql.g4` or `KqlTokens.g4`:

```
python3 tools/gen_kql_lrpar.py
```

`build.rs` will compile the generated `.l/.y` during normal builds.

## Notes on precedence
Operator precedence is declared in the generated `crates/kusto_gen_core/src/kql.y` using standard rules:
- `OR` (lowest)
- `AND`
- equality and set operators (`==`, `!=`, `in`, `between`, ...)
- relational (`<`, `<=`, `>`, `>=`)
- additive (`+`, `-`)
- multiplicative (`*`, `/`, `%`) (highest)

## Examples
See `examples/basic.kql` and `examples/join.kql`.

## Tests
Run the full test suite:

```
cargo test
```

## Caveats
This uses a LALR parser with targeted grammar rewrites to reduce ambiguity. If you update the grammar generator, re-run tests and validate the pipeline examples (pipe chains, `summarize`, `join`).

## Execution engine
The core crate includes a minimal execution engine that consumes a `Plan` and returns an
`ExecutionResult` with per-step status and details. This is a placeholder for integrating a real
runtime (e.g., query evaluation over in-memory data or a backend).

## Web UI
Start the Axum web UI:

```
./scripts/dev_web.sh
```

Then open `http://localhost:3000`.

Tailwind is built locally. If you want to build CSS manually:

```
./scripts/build_web_css.sh
```

If you don't have dependencies yet, run:

```
npm install
```
