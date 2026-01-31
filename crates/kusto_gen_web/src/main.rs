use axum::{
    Router,
    extract::Json,
    http::StatusCode,
    response::{Html, IntoResponse},
    routing::{get, post},
};
use kusto_gen_core::{execute_plan, parse_kql, plan_kql};
use serde::{Deserialize, Serialize};
use tower_http::services::ServeDir;
use tracing_subscriber::{layer::SubscriberExt, util::SubscriberInitExt};

#[derive(Debug, Deserialize)]
struct ParseRequest {
    kql: String,
}

#[derive(Debug, Serialize)]
#[serde(tag = "kind", rename_all = "snake_case")]
enum ParseResponse {
    Ok {
        ast: kusto_gen_core::AstNode,
        plan: kusto_gen_core::Plan,
        execution: kusto_gen_core::ExecutionResult,
    },
    Error {
        message: String,
    },
}

#[tokio::main]
async fn main() {
    tracing_subscriber::registry()
        .with(tracing_subscriber::EnvFilter::from_default_env())
        .with(tracing_subscriber::fmt::layer())
        .init();

    let app = Router::new()
        .route("/", get(index))
        .route("/api/parse", post(parse))
        .nest_service("/static", ServeDir::new("crates/kusto_gen_web/static"));

    let listener = tokio::net::TcpListener::bind("0.0.0.0:3000")
        .await
        .expect("bind");
    tracing::info!("listening on http://localhost:3000");
    axum::serve(listener, app).await.expect("serve");
}

async fn index() -> Html<&'static str> {
    Html(INDEX_HTML)
}

async fn parse(Json(payload): Json<ParseRequest>) -> impl IntoResponse {
    let kql = payload.kql;
    match parse_kql(&kql) {
        Ok(ast) => {
            let plan = match plan_kql(&kql) {
                Ok(plan) => plan,
                Err(err) => {
                    let body = Json(ParseResponse::Error { message: err });
                    return (StatusCode::BAD_REQUEST, body).into_response();
                }
            };
            let execution = execute_plan(&plan);
            let body = Json(ParseResponse::Ok {
                ast,
                plan,
                execution,
            });
            (StatusCode::OK, body).into_response()
        }
        Err(err) => {
            let body = Json(ParseResponse::Error { message: err });
            (StatusCode::BAD_REQUEST, body).into_response()
        }
    }
}

const INDEX_HTML: &str = r#"<!doctype html>
<html lang=\"en\">
  <head>
    <meta charset=\"utf-8\" />
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />
    <title>Kusto Gen Web</title>
    <link rel=\"stylesheet\" href=\"/static/tailwind.css\" />
  </head>
  <body class=\"min-h-screen bg-slate-950 text-slate-100\">
    <div class=\"mx-auto max-w-7xl px-6 py-8\">
      <div class=\"flex items-center justify-between\">
        <h1 class=\"text-2xl font-semibold tracking-tight\">KQL Parser</h1>
        <div class=\"text-sm text-slate-400\">Axum + Tailwind</div>
      </div>
      <div id=\"fileWarning\" class=\"mt-4 hidden rounded-lg border border-amber-500/30 bg-amber-500/10 px-4 py-2 text-sm text-amber-200\">
        This page is opened from a file URL. Start the server and open http://localhost:3000 for parsing to work.
      </div>
      <div class=\"mt-6 grid gap-6 lg:grid-cols-2\">
        <div class=\"flex flex-col gap-2\">
          <label for=\"kql\" class=\"text-sm uppercase tracking-wide text-slate-400\">KQL</label>
          <textarea id=\"kql\" class=\"h-[500px] w-full resize-none rounded-xl border border-slate-800 bg-slate-900/60 p-4 font-mono text-sm text-slate-100 outline-none focus:border-cyan-500\">SecurityEvent
| where EventID == 4625
| summarize Failures = count() by Account, bin(TimeGenerated, 5m)
| where Failures > 10</textarea>
          <div class=\"flex items-center gap-3\">
            <button id=\"parseBtn\" type=\"button\" class=\"rounded-lg bg-cyan-500 px-4 py-2 text-sm font-semibold text-slate-950 hover:bg-cyan-400\">Parse</button>
            <span id=\"status\" class=\"text-sm text-slate-400\"></span>
          </div>
        </div>
        <div class=\"flex flex-col gap-2\">
          <label for=\"result\" class=\"text-sm uppercase tracking-wide text-slate-400\">Result</label>
          <pre id=\"result\" class=\"h-[500px] overflow-auto rounded-xl border border-slate-800 bg-slate-900/60 p-4 text-xs text-slate-100\">// Parse output will appear here</pre>
        </div>
      </div>
    </div>
    <script>
      const btn = document.getElementById('parseBtn');
      const status = document.getElementById('status');
      const result = document.getElementById('result');
      const kql = document.getElementById('kql');
      const fileWarning = document.getElementById('fileWarning');

      if (window.location.protocol === 'file:') {
        fileWarning.classList.remove('hidden');
      }

      async function parseKql() {
        status.textContent = 'Parsing...';
        result.textContent = '';
        try {
          const res = await fetch('/api/parse', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ kql: kql.value })
          });
          const text = await res.text();
          let payload = null;
          try {
            payload = JSON.parse(text);
          } catch (err) {
            payload = { kind: 'error', message: text || String(err) };
          }
          result.textContent = JSON.stringify(payload, null, 2);
          status.textContent = res.ok ? 'OK' : 'Error';
        } catch (err) {
          result.textContent = String(err);
          status.textContent = 'Error';
        }
      }

      btn.addEventListener('click', parseKql);
      kql.addEventListener('keydown', (event) => {
        if ((event.ctrlKey || event.metaKey) && event.key === 'Enter') {
          parseKql();
        }
      });
    </script>
  </body>
</html>
"#;
