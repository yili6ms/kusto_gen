#!/usr/bin/env bash
set -euo pipefail

"$(dirname "$0")/build_web_css.sh"

cargo run -p kusto_gen_web
