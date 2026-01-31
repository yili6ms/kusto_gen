#!/usr/bin/env python3
import re
from pathlib import Path

root = Path(__file__).resolve().parent.parent
core_src = root / 'crates' / 'kusto_gen_core' / 'src'
kql_tokens = root / 'KqlTokens.g4'
kql = root / 'Kql.g4'

text = kql_tokens.read_text()
lines = text.splitlines()

rules = []
rule = None
buf = []
for line in lines:
    m = re.match(r'^([A-Z_][A-Z0-9_]*)\s*:\s*(.*)$', line)
    if m:
        if rule:
            body = ' '.join(buf)
            rules.append((rule, body))
        rule = m.group(1)
        buf = [m.group(2).strip()]
        if ';' in line:
            body = ' '.join(buf)
            rules.append((rule, body))
            rule = None
            buf = []
    elif rule:
        buf.append(line.strip())
        if ';' in line:
            body = ' '.join(buf)
            rules.append((rule, body))
            rule = None
            buf = []


def strip_comments(s: str) -> str:
    return re.sub(r'//.*', '', s)


def strip_trailing_semicolon(s: str) -> str:
    s = s.strip()
    if s.endswith(';'):
        return s[:-1].strip()
    return s

literal_rules = {}
complex_rules = {}
for name, body in rules:
    body = strip_comments(body)
    body = strip_trailing_semicolon(body)
    if not body:
        continue
    literals = re.findall(r"'([^'\\]*(?:\\.[^'\\]*)*)'", body)
    tmp = re.sub(r"'([^'\\]*(?:\\.[^'\\]*)*)'", '', body)
    tmp = re.sub(r'\s+','', tmp)
    tmp = tmp.replace('|','')
    tmp = tmp.replace('(', '').replace(')', '')
    if literals and tmp == '':
        literal_rules[name] = literals
    else:
        complex_rules[name] = body

literal_to_token = {}
for name, literals in literal_rules.items():
    for lit in literals:
        if lit not in literal_to_token:
            literal_to_token[lit] = name

lexer_lines = []
lexer_lines.append('%%')

for name, literals in literal_rules.items():
    escaped = []
    for lit in sorted(literals, key=len, reverse=True):
        regex = re.escape(lit)
        if regex.startswith('<'):
            regex = '\\' + regex
        escaped.append(regex)
    if len(escaped) == 1:
        pat = escaped[0]
    else:
        pat = '(?:' + '|'.join(escaped) + ')'
    lexer_lines.append(f"{pat} '{name}'")

custom = {
    'STRINGLITERAL': r"(?s)(?:[hH]?\"(?:\\.|[^\"\\\r\n])*\"|[hH]?'(?:\\.|[^'\\\r\n])*'|[hH]?@\"(?:\"\"|[^\"\r\n])*\"|[hH]?@'(?:''|[^'\r\n])*'|[hH]?```.*```|[hH]?~~~.*~~~)",
    'LONGLITERAL': r"(?:[0-9]+|long\([^)]*\)|int64\([^)]*\))",
    'INTLITERAL': r"(?:int\([^)]*\)|int32\([^)]*\))",
    'REALLITERAL': r"(?:[0-9]+\.[0-9]*([eE][+-]?[0-9]+)?|[0-9]+[eE][+-]?[0-9]+|real\([^)]*\)|double\([^)]*\))",
    'DECIMALLITERAL': r"decimal\([^)]*\)",
    'BOOLEANLITERAL': r"(?:true|false|TRUE|FALSE|True|False|bool\([^)]*\))",
    'DATETIMELITERAL': r"datetime\([^)]*\)",
    'TIMESPANLITERAL': r"(?:[0-9]+(\.[0-9]+)?[a-zA-Z]+|time\([^)]*\)|timespan\([^)]*\))",
    'TYPELITERAL': r"typeof\([^)]*\)",
    'RAWGUIDLITERAL': r"[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{12}",
    'GUIDLITERAL': r"(?:guid\([^)]*\)|uuid\([^)]*\)|uniqueid\([^)]*\))",
    'IDENTIFIER_CALL': r"(?:[$_A-Za-z][$_A-Za-z0-9]*|[0-9]+[_A-Za-z][$_A-Za-z0-9]*)\(",
    'IDENTIFIER': r"(?:[$_A-Za-z][$_A-Za-z0-9]*|[0-9]+[_A-Za-z][$_A-Za-z0-9]*)",
}

for name, body in complex_rules.items():
    if name in ('WHITESPACE', 'COMMENT'):
        continue
    if name == 'IDENTIFIER':
        lexer_lines.append(f"{custom['IDENTIFIER_CALL']} 'IDENTIFIER_CALL'")
    if name in custom:
        lexer_lines.append(f"{custom[name]} '{name}'")
    else:
        lexer_lines.append(f"{custom['IDENTIFIER']} '{name}'")

lexer_lines.append(r"[\t \r\n\f]+ ;")
lexer_lines.append(r"//[^\n\r\u2028\u2029]* ;")
lexer_lines.append('%%')

core_src.mkdir(parents=True, exist_ok=True)
(core_src / 'kql.l').write_text('\n'.join(lexer_lines) + '\n')

kql_text = kql.read_text().splitlines()

class Node:
    def __init__(self, kind, value=None, children=None):
        self.kind = kind
        self.value = value
        self.children = children or []


def tokenize(s):
    tokens = []
    i = 0
    while i < len(s):
        c = s[i]
        if c.isspace():
            i += 1
            continue
        if c in '()|?*+':
            tokens.append(c)
            i += 1
            continue
        m = re.match(r'[A-Za-z_][A-Za-z0-9_]*', s[i:])
        if m:
            tokens.append(m.group(0))
            i += len(m.group(0))
            continue
        raise ValueError(f"Unexpected character {c!r} in {s}")
    return tokens


class Parser:
    def __init__(self, tokens):
        self.tokens = tokens
        self.pos = 0

    def peek(self):
        if self.pos < len(self.tokens):
            return self.tokens[self.pos]
        return None

    def consume(self, expected=None):
        tok = self.peek()
        if expected is not None and tok != expected:
            raise ValueError(f"Expected {expected} got {tok}")
        self.pos += 1
        return tok

    def parse_alt(self):
        seq = self.parse_seq()
        alts = [seq]
        while self.peek() == '|':
            self.consume('|')
            alts.append(self.parse_seq())
        if len(alts) == 1:
            return alts[0]
        return Node('Alt', children=alts)

    def parse_seq(self):
        items = []
        while True:
            tok = self.peek()
            if tok is None or tok in (')', '|'):
                break
            items.append(self.parse_repeat())
        if not items:
            return Node('Empty')
        if len(items) == 1:
            return items[0]
        return Node('Seq', children=items)

    def parse_repeat(self):
        node = self.parse_primary()
        tok = self.peek()
        if tok in ('?', '*', '+'):
            self.consume()
            return Node({'?': 'Opt', '*': 'Star', '+': 'Plus'}[tok], children=[node])
        return node

    def parse_primary(self):
        tok = self.peek()
        if tok == '(':
            self.consume('(')
            node = self.parse_alt()
            self.consume(')')
            return node
        if tok is None:
            raise ValueError("Unexpected end")
        self.consume()
        return Node('Sym', value=tok)


def parse_ebnf(s):
    tokens = tokenize(s)
    p = Parser(tokens)
    node = p.parse_alt()
    if p.peek() is not None:
        raise ValueError(f"Unexpected token {p.peek()}")
    return node


counter = 0
new_rules = []


def new_name(base, suffix):
    global counter
    counter += 1
    return f"{base}__{suffix}{counter}"


def node_to_alts(node, base):
    if node.kind == 'Empty':
        return [[]]
    if node.kind == 'Sym':
        return [[node.value]]
    if node.kind == 'Seq':
        alts = [[]]
        for child in node.children:
            child_alts = node_to_alts(child, base)
            alts = [a + b for a in alts for b in child_alts]
        return alts
    if node.kind == 'Alt':
        alts = []
        for child in node.children:
            alts.extend(node_to_alts(child, base))
        return alts
    if node.kind in ('Opt', 'Star', 'Plus'):
        name = new_name(base, node.kind.lower())
        child_alts = node_to_alts(node.children[0], base)
        if node.kind == 'Opt':
            alts = [[]] + child_alts
        elif node.kind == 'Star':
            alts = [[]]
            for alt in child_alts:
                alts.append(alt + [name])
        else:  # Plus
            alts = []
            for alt in child_alts:
                alts.append(alt + [name])
                alts.append(alt)
        new_rules.append((name, alts))
        return [[name]]
    raise ValueError(f"Unknown node kind {node.kind}")


out_rules = []


def replace_literals(body: str) -> str:
    def repl(m):
        lit = m.group(1)
        token = literal_to_token.get(lit)
        if token:
            return token
        return lit
    return re.sub(r"'([^'\\]*(?:\\.[^'\\]*)*)'", repl, body)


rule = None
buf = []

def flush_rule(rule, buf):
    if not rule:
        return
    body = ' '.join(buf)
    body = strip_comments(body)
    body = strip_trailing_semicolon(body)
    if not body:
        return
    body = replace_literals(body)
    body = re.sub(r'\b\w+\s*\+=\s*', '', body)
    body = re.sub(r'\b\w+\s*=\s*', '', body)
    body = re.sub(r'\bEOF\b', '', body)
    node = parse_ebnf(body)
    alts = node_to_alts(node, rule)
    out_rules.append((rule, alts))

for line in kql_text:
    if line.strip().startswith('//'):
        continue
    m = re.match(r'^([a-z_][a-zA-Z0-9_]*)\s*:\s*(.*)$', line)
    if m:
        flush_rule(rule, buf)
        rule = m.group(1)
        buf = [m.group(2).strip()]
        if ';' in line:
            flush_rule(rule, buf)
            rule = None
            buf = []
    elif rule:
        buf.append(line.strip())
        if ';' in line:
            flush_rule(rule, buf)
            rule = None
            buf = []

flush_rule(rule, buf)

out_rules.extend(new_rules)

def rewrite_identifier_call(rules):
    has_call_rule = any(name == 'identifierCallName' for name, _ in rules)
    if not has_call_rule:
        rules.append(('identifierCallName', [['IDENTIFIER_CALL']]))
    for i, (name, alts) in enumerate(rules):
        if name == 'namedFunctionCallExpression':
            call_alt = ['identifierCallName', 'namedFunctionCallExpression__opt182', 'CLOSEPAREN']
            if call_alt not in alts:
                alts.append(call_alt)
            rules[i] = (name, alts)
            break
    return rules

out_rules = rewrite_identifier_call(out_rules)

def rewrite_function_call_or_path_expression(rules):
    idx = None
    for i, (name, _) in enumerate(rules):
        if name == 'functionCallOrPathExpression':
            idx = i
            break
    if idx is None:
        return rules
    name, alts = rules[idx]
    root_alt = ['functionCallOrPathRoot']
    path_alt = ['functionCallOrPathPathExpression']
    if root_alt not in alts or path_alt not in alts:
        return rules
    opt_name = 'functionCallOrPathExpression__opt_path'
    new_alts = []
    for alt in alts:
        if alt == root_alt or alt == path_alt:
            continue
        new_alts.append(alt)
    new_alts.insert(0, ['functionCallOrPathRoot', opt_name])
    rules[idx] = (name, new_alts)
    rules.append((opt_name, [[], ['functionCallOrPathPathExpression__plus178']]))
    return rules

out_rules = rewrite_function_call_or_path_expression(out_rules)

def rewrite_function_call_or_path_root(rules):
    for i, (name, alts) in enumerate(rules):
        if name == 'functionCallOrPathRoot':
            new_alts = [alt for alt in alts if alt != ['dotCompositeFunctionCallExpression']]
            if new_alts != alts:
                rules[i] = (name, new_alts)
            break
    return rules

out_rules = rewrite_function_call_or_path_root(out_rules)

def rewrite_before_pipe_expression(rules):
    for i, (name, alts) in enumerate(rules):
        if name == 'beforePipeExpression':
            new_alts = [alt for alt in alts if alt != ['scopedFunctionCallExpression']]
            if new_alts != alts:
                rules[i] = (name, new_alts)
            break
    return rules

out_rules = rewrite_before_pipe_expression(out_rules)

def rewrite_where_and_summarize_by(rules):
    for i, (name, alts) in enumerate(rules):
        if name == 'whereOperator':
            new_alts = []
            for alt in alts:
                if alt and alt[-1] == 'namedExpression':
                    alt = alt[:-1] + ['unnamedExpression']
                new_alts.append(alt)
            rules[i] = (name, new_alts)
        if name == 'summarizeOperatorByClause':
            new_alts = []
            for alt in alts:
                if alt and alt[0] == 'BY' and 'namedExpression' in alt:
                    alt = [sym if sym != 'namedExpression' else 'unnamedExpression' for sym in alt]
                new_alts.append(alt)
            rules[i] = (name, new_alts)
        if name == 'summarizeOperatorByClause__star156':
            new_alts = []
            for alt in alts:
                if 'namedExpression' in alt:
                    alt = [sym if sym != 'namedExpression' else 'unnamedExpression' for sym in alt]
                new_alts.append(alt)
            rules[i] = (name, new_alts)
    return rules

out_rules = rewrite_where_and_summarize_by(out_rules)

def rewrite_primary_expression(rules):
    for i, (name, alts) in enumerate(rules):
        if name == 'primaryExpression':
            if ['functionCallExpression'] not in alts:
                alts.insert(0, ['functionCallExpression'])
            rules[i] = (name, alts)
            break
    return rules

out_rules = rewrite_primary_expression(out_rules)

def rewrite_join_operator(rules):
    for i, (name, alts) in enumerate(rules):
        if name == 'joinOperator':
            new_alts = []
            for alt in alts:
                if alt and alt[0] == 'JOIN':
                    # Drop optional relaxed parameters to avoid ambiguity with table names.
                    alt = [sym for sym in alt if sym != 'joinOperator__star66']
                new_alts.append(alt)
            rules[i] = (name, new_alts)
            break
    return rules

out_rules = rewrite_join_operator(out_rules)

def rewrite_argument_expression(rules):
    has_opt = any(name == 'argumentExpression__opt_name' for name, _ in rules)
    if not has_opt:
        rules.append(('argumentExpression__opt_name', [[], ['EQUAL', 'unnamedExpression']]))
    for i, (name, alts) in enumerate(rules):
        if name == 'argumentExpression':
            new_alts = []
            for alt in alts:
                if alt == ['namedExpression']:
                    new_alts.append(['unnamedExpression', 'argumentExpression__opt_name'])
                elif alt == ['starExpression']:
                    new_alts.append(alt)
                else:
                    new_alts.append(alt)
            # Ensure unnamedExpression path exists even if namedExpression wasn't present.
            if ['unnamedExpression', 'argumentExpression__opt_name'] not in new_alts:
                new_alts.insert(0, ['unnamedExpression', 'argumentExpression__opt_name'])
            rules[i] = (name, new_alts)
            break
    return rules

out_rules = rewrite_argument_expression(out_rules)

rule_map = {name: alts for name, alts in out_rules}

reachable = set()
work = ['top']

while work:
    r = work.pop()
    if r in reachable or r not in rule_map:
        continue
    reachable.add(r)
    for alt in rule_map[r]:
        for sym in alt:
            if re.match(r'^[a-z_][a-zA-Z0-9_]*$', sym):
                work.append(sym)

filtered_rules = [(name, alts) for name, alts in out_rules if name in reachable]

used_tokens = set()
for _, alts in filtered_rules:
    for alt in alts:
        for sym in alt:
            if re.match(r'^[A-Z][A-Z0-9_]*$', sym):
                used_tokens.add(sym)
used_tokens.add('IDENTIFIER_CALL')

precedence_groups = [
    ['OR'],
    ['AND'],
    [
        'EQUALTILDE', 'EXCLAIMATIONPOINT_TILDE',
        'HAS', 'NOT_HAS', 'HAS_CS', 'NOT_HAS_CS',
        'HASPREFIX', 'NOT_HASPREFIX', 'HASPREFIX_CS', 'NOT_HASPREFIX_CS',
        'HASSUFFIX', 'NOT_HASSUFFIX', 'HASSUFFIX_CS', 'NOT_HASSUFFIX_CS',
        'LIKE', 'NOTLIKE', 'LIKECS', 'NOTLIKECS',
        'CONTAINS', 'NOTCONTAINS', 'CONTAINSCS', 'NOTCONTAINSCS',
        'NOT_CONTAINS', 'CONTAINS_CS', 'NOT_CONTAINS_CS',
        'STARTSWITH', 'NOT_STARTSWITH', 'STARTSWITH_CS', 'NOT_STARTSWITH_CS',
        'ENDSWITH', 'NOT_ENDSWITH', 'ENDSWITH_CS', 'NOT_ENDSWITH_CS',
        'MATCHES_REGEX',
    ],
    [
        'EQUALEQUAL', 'EXCLAIMATIONPOINT_EQUAL', 'LESSTHAN_GREATERTHAN',
        'IN', 'NOT_IN', 'IN_CI', 'NOT_IN_CI', 'HAS_ANY', 'HAS_ALL',
        'BETWEEN', 'NOT_BETWEEN',
    ],
    ['LESSTHAN', 'LESSTHAN_EQUAL', 'GREATERTHAN', 'GREATERTHAN_EQUAL'],
    ['PLUS', 'DASH'],
    ['ASTERISK', 'SLASH', 'PERCENTSIGN'],
]
for group in precedence_groups:
    for tok in group:
        used_tokens.add(tok)

out_lines = []
out_lines.append('%start top')
# Expect conflicts from the ANTLR grammar translation
out_lines.append('%expect 4746')
out_lines.append('%expect-rr 3')
extra_tokens = ['IDENTIFIER_CALL']
for name, _ in rules:
    if name in used_tokens:
        out_lines.append(f"%token {name}")
for name in extra_tokens:
    if name in used_tokens:
        out_lines.append(f"%token {name}")
for group in precedence_groups:
    toks = [tok for tok in group if tok in used_tokens]
    if toks:
        out_lines.append(f"%left {' '.join(toks)}")
out_lines.append('%%')

for name, alts in filtered_rules:
    out_lines.append(f"{name}:")
    for i, alt in enumerate(alts):
        rhs = ' '.join(alt)
        sep = '  | ' if i > 0 else '  '
        out_lines.append(f"{sep}{rhs}")
    out_lines.append('  ;')

out_lines.append('%%')

(core_src / 'kql.y').write_text('\n'.join(out_lines) + '\n')

print('Generated src/kql.l and src/kql.y')
