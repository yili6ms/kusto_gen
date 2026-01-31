$ErrorActionPreference = "Stop"

& "$PSScriptRoot\build_web_css.ps1"

cargo run -p kusto_gen_web
