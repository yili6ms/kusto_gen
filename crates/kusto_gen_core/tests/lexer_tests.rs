use kusto_gen_core::lex_tokens;

#[test]
fn lex_keywords_and_identifiers() {
    let tokens = lex_tokens("let foo = 1 | where bar == true").unwrap();
    assert!(tokens.contains(&"LET".to_string()));
    assert!(tokens.contains(&"WHERE".to_string()));
}

#[test]
fn lex_comments() {
    let tokens = lex_tokens("StormEvents // comment\n| take 5").unwrap();
    assert!(tokens.contains(&"TAKE".to_string()));
}

#[test]
fn lex_strings_and_escapes() {
    let tokens = lex_tokens("'a\\n\\t\\\\' \"b\\\"c\" @'raw\\n'").unwrap();
    assert!(tokens.contains(&"STRINGLITERAL".to_string()));
}

#[test]
fn lex_bracketed_identifier() {
    let tokens = lex_tokens("['weird name']").unwrap();
    assert!(tokens.contains(&"OPENBRACKET".to_string()));
    assert!(tokens.contains(&"CLOSEBRACKET".to_string()));
}

#[test]
fn lex_numbers() {
    let tokens = lex_tokens("1 2.5 .25 3e2 4.5E-1").unwrap();
    assert!(
        tokens.contains(&"LONGLITERAL".to_string())
            || tokens.contains(&"REALLITERAL".to_string())
    );
}

#[test]
fn lex_identifier_plain_vs_call() {
    let plain = lex_tokens("StormEvents").unwrap();
    assert_eq!(plain, vec!["IDENTIFIER".to_string()]);
    let call = lex_tokens("foo()").unwrap();
    assert!(call.contains(&"IDENTIFIER_CALL".to_string()));
}
