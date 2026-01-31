use cfgrammar::yacc::{YaccKind, YaccOriginalActionKind};
use lrlex::CTLexerBuilder;

fn main() {
    CTLexerBuilder::new()
        .lrpar_config(|ctp| {
            ctp.yacckind(YaccKind::Original(YaccOriginalActionKind::GenericParseTree))
                .grammar_in_src_dir("kql.y")
                .unwrap()
        })
        .lexer_in_src_dir("kql.l")
        .unwrap()
        .build()
        .unwrap();

    emit_rust_line_count();
}

fn emit_rust_line_count() {
    let root = std::path::Path::new(env!("CARGO_MANIFEST_DIR"));
    let mut total: usize = 0;
    for entry in walkdir::WalkDir::new(root)
        .into_iter()
        .filter_map(Result::ok)
    {
        if entry.file_type().is_file()
            && entry.path().extension().is_some_and(|ext| ext == "rs")
            && let Ok(contents) = std::fs::read_to_string(entry.path())
        {
            total += contents.lines().count();
        }
    }
    println!("cargo:warning=Rust LOC (kusto_gen_core): {total}");
}
