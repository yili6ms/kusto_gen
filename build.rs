use cfgrammar::yacc::{YaccKind, YaccOriginalActionKind};
use lrlex::CTLexerBuilder;

fn main() {
    CTLexerBuilder::new()
        .lrpar_config(|ctp| {
            ctp.yacckind(YaccKind::Original(
                YaccOriginalActionKind::GenericParseTree,
            ))
            .grammar_in_src_dir("kql.y")
            .unwrap()
        })
        .lexer_in_src_dir("kql.l")
        .unwrap()
        .build()
        .unwrap();
}
