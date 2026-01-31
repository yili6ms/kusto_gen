%start top
%expect 4746
%expect-rr 3
%token ASTERISK
%token ATSIGN
%token BAR
%token CLOSEBRACE
%token CLOSEBRACKET
%token CLOSEBRACKET_DASH
%token CLOSEBRACKET_DASH_GREATERTHAN
%token CLOSEPAREN
%token COMMA
%token COLON
%token DASH
%token DASHDASH
%token DASHDASH_GREATERTHAN
%token DASH_OPENBRACKET
%token DOT
%token DOTDOT
%token EQUAL
%token EQUALEQUAL
%token EQUALTILDE
%token EXCLAIMATIONPOINT_EQUAL
%token EXCLAIMATIONPOINT_TILDE
%token GREATERTHAN
%token GREATERTHAN_EQUAL
%token LESSTHAN
%token LESSTHAN_DASHDASH
%token LESSTHAN_DASH_OPENBRACKET
%token LESSTHAN_EQUAL
%token LESSTHAN_GREATERTHAN
%token OPENBRACE
%token OPENBRACKET
%token OPENPAREN
%token PERCENTSIGN
%token PLUS
%token SEMICOLON
%token SLASH
%token EQUAL_GREATERTHAN
%token CHART3D_
%token ACCESS
%token ACCUMULATE
%token AGGREGATIONS
%token ALIAS
%token ALL
%token AND
%token ANOMALYCHART
%token ANOMALYCOLUMNS
%token AREACHART
%token AS
%token ASC
%token ASSERTSCHEMA
%token AXES
%token BAGEXPANSION
%token BARCHART
%token BASE
%token BETWEEN
%token BIN
%token BIN_LEGACY
%token BY
%token CARD
%token CLUSTER
%token COLUMNCHART
%token CONSUME
%token CONTAINS
%token CONTAINSCS
%token CONTAINS_CS
%token CONTEXTUAL_DATATABLE
%token COUNT
%token CROSSCLUSTER__
%token CROSSDB__
%token DATABASE
%token DATASCOPE
%token DATATABLE
%token DECLARE
%token DECODEBLOCKS
%token DEFAULT
%token DELTA
%token DESC
%token DISTINCT
%token EDGES
%token ENDSWITH
%token ENDSWITH_CS
%token ENTITYGROUP
%token EVALUATE
%token EXECUTE
%token EXECUTE_AND_CACHE
%token EXPANDOUTPUT
%token EXTEND
%token EXTERNALDATA
%token EXTERNAL_DATA
%token FACET
%token FILTER
%token FIND
%token FIRST
%token FLAGS
%token FORK
%token FROM
%token GETSCHEMA
%token GRANNYASC
%token GRANNYDESC
%token GRAPHMARKCOMPONENTS
%token GRAPHMATCH
%token GRAPHSHORTESTPATHS
%token GRAPHTOTABLE
%token HAS
%token HAS_ALL
%token HAS_ANY
%token HAS_CS
%token HASPREFIX
%token HASPREFIX_CS
%token HASSUFFIX
%token HASSUFFIX_CS
%token HIDDEN_
%token HINT_CONCURRENCY
%token HINT_DISTRIBUTION
%token HINT_MATERIALIZED
%token HINT_NUM_PARTITIONS
%token HINT_PASS_FILTERS
%token HINT_PASS_FILTERS_COLUMN
%token HINT_PROGRESSIVE_TOP
%token HINT_REMOTE
%token HINT_SUFFLEKEY
%token HINT_SPREAD
%token HINT_STRATEGY
%token HOT
%token HOTCACHE
%token HOTDATA
%token HOTINDEX
%token ID
%token ID__
%token IN
%token IN_CI
%token INTO
%token INVOKE
%token ISFUZZY
%token ISFUZZY__
%token JOIN
%token KIND
%token LADDERCHART
%token LAST
%token LEGEND
%token LET
%token LIKE
%token LIKECS
%token LIMIT
%token LINEAR
%token LINECHART
%token LIST
%token LOOKUP
%token LOG
%token MACROEXPAND
%token MAKEGRAPH
%token MAKESERIES
%token MAP
%token MATCHES_REGEX
%token MATERIALIZE
%token MATERIALIZED_VIEW_COMBINE
%token MV_APPLY
%token MV_EXPAND
%token MVAPPLY
%token MVEXPAND
%token NODES
%token NONE
%token NOOPTIMIZATION
%token NOT_BETWEEN
%token NOT_CONTAINS
%token NOT_CONTAINS_CS
%token NOT_ENDSWITH_CS
%token NOT_ENDSWITH
%token NOT_HAS
%token NOT_HAS_CS
%token NOT_HASPREFIX
%token NOT_HASPREFIX_CS
%token NOT_HASSUFFIX
%token NOT_HASSUFFIX_CS
%token NOT_IN
%token NOT_IN_CI
%token NOT_STARTSWITH
%token NOT_STARTSWITH_CS
%token NOTCONTAINS
%token NOTCONTAINSCS
%token NOTLIKE
%token NOTLIKECS
%token NULL
%token NULLS
%token OF
%token ON
%token OPTIONAL
%token OR
%token ORDER
%token OTHERS
%token OUTPUT
%token PACK
%token PANELS
%token PARSE
%token PARSEKV
%token PARSEWHERE
%token PARTITION
%token PARTITIONBY
%token PARTITIONEDBY
%token PATTERN
%token PACKEDCOLUMN__
%token PIECHART
%token PIVOTCHART
%token PLUGIN
%token PRINT
%token PROJECT
%token PROJECTAWAY
%token PROJECTAWAY_
%token PROJECTKEEP
%token PROJECTRENAME
%token PROJECTREORDER
%token PROJECTSMART
%token QUERYPARAMETERS
%token RANGE
%token REDUCE
%token REGEX
%token RELAXED
%token RENDER
%token REPLACE
%token RESTRICT
%token SAMPLE
%token SAMPLE_DISTINCT
%token SCAN
%token SCATTERCHART
%token SEARCH
%token SERIALIZE
%token SERIES
%token SET
%token SIMPLE
%token SORT
%token SOURCECOLUMNINDEX__
%token STACKED
%token STACKED100
%token STACKEDAREACHART
%token STARTSWITH
%token STARTSWITH_CS
%token STEP
%token SUMMARIZE
%token TABLE
%token TAKE
%token THRESHOLD
%token TIMECHART
%token TIMELINE
%token TIMEPIVOT
%token TITLE
%token TO
%token TOP
%token TOP_HITTERS
%token TOP_NESTED
%token TOSCALAR
%token TOTABLE
%token TREEMAP
%token TYPEOF
%token UNION
%token UNSTACKED
%token UUID
%token VIEW
%token VISIBLE
%token WHERE
%token WITH
%token WITHNOSOURCE__
%token WITHSOURCE
%token WITH_ITEM_INDEX
%token WITH_MATCH_ID
%token WITH_NODE_ID
%token WITH_SOURCE
%token WITH_STEP_NAME
%token XAXIS
%token XCOLUMN
%token XMAX
%token XMIN
%token XTITLE
%token YAXIS
%token YCOLUMNS
%token YMAX
%token YMIN
%token YSPLIT
%token YTITLE
%token BOOL
%token BOOLEAN
%token DATE
%token DATETIME
%token DECIMAL
%token DOUBLE
%token DYNAMIC
%token FLOAT
%token GUID
%token INT
%token INT8
%token INT16
%token INT32
%token INT64
%token LONG
%token STRING
%token REAL
%token TIME
%token TIMESPAN
%token UINT
%token UINT8
%token UINT16
%token UINT32
%token UINT64
%token ULONG
%token UNIQUEID
%token LONGLITERAL
%token INTLITERAL
%token REALLITERAL
%token DECIMALLITERAL
%token STRINGLITERAL
%token BOOLEANLITERAL
%token DATETIMELITERAL
%token TIMESPANLITERAL
%token TYPELITERAL
%token RAWGUIDLITERAL
%token GUIDLITERAL
%token IDENTIFIER
%token IDENTIFIER_CALL
%left OR
%left AND
%left EQUALTILDE EXCLAIMATIONPOINT_TILDE HAS NOT_HAS HAS_CS NOT_HAS_CS HASPREFIX NOT_HASPREFIX HASPREFIX_CS NOT_HASPREFIX_CS HASSUFFIX NOT_HASSUFFIX HASSUFFIX_CS NOT_HASSUFFIX_CS LIKE NOTLIKE LIKECS NOTLIKECS CONTAINS NOTCONTAINS CONTAINSCS NOTCONTAINSCS NOT_CONTAINS CONTAINS_CS NOT_CONTAINS_CS STARTSWITH NOT_STARTSWITH STARTSWITH_CS NOT_STARTSWITH_CS ENDSWITH NOT_ENDSWITH ENDSWITH_CS NOT_ENDSWITH_CS MATCHES_REGEX
%left EQUALEQUAL EXCLAIMATIONPOINT_EQUAL LESSTHAN_GREATERTHAN IN NOT_IN IN_CI NOT_IN_CI HAS_ANY HAS_ALL BETWEEN NOT_BETWEEN
%left LESSTHAN LESSTHAN_EQUAL GREATERTHAN GREATERTHAN_EQUAL
%left PLUS DASH
%left ASTERISK SLASH PERCENTSIGN
%%
top:
  query
  ;
query:
  statement query__star1 query__opt2
  ;
statement:
  aliasDatabaseStatement
  | declarePatternStatement
  | declareQueryParametersStatement
  | letStatement
  | queryStatement
  | restrictAccessStatement
  | setStatement
  ;
aliasDatabaseStatement:
  ALIAS DATABASE identifierOrKeywordOrEscapedName EQUAL unnamedExpression
  ;
letStatement:
  letFunctionDeclaration
  | letViewDeclaration
  | letVariableDeclaration
  | letMaterializeDeclaration
  | letEntityGroupDeclaration
  ;
letVariableDeclaration:
  LET identifierOrKeywordOrEscapedName EQUAL expression
  ;
letFunctionDeclaration:
  LET identifierOrKeywordOrEscapedName EQUAL OPENPAREN letFunctionDeclaration__opt3 CLOSEPAREN letFunctionBody
  ;
letViewDeclaration:
  LET identifierOrKeywordOrEscapedName EQUAL VIEW OPENPAREN letViewDeclaration__opt4 CLOSEPAREN letFunctionBody
  ;
letViewParameterList:
  scalarParameter letViewParameterList__star5
  ;
letMaterializeDeclaration:
  LET identifierOrKeywordOrEscapedName EQUAL MATERIALIZE OPENPAREN pipeExpression CLOSEPAREN
  ;
letEntityGroupDeclaration:
  LET identifierOrKeywordOrEscapedName EQUAL entityGroupExpression
  ;
letFunctionParameterList:
  tabularParameter letFunctionParameterList__star6 letFunctionParameterList__star7
  | scalarParameter letFunctionParameterList__star8
  ;
scalarParameter:
  parameterName COLON scalarType scalarParameter__opt9
  ;
scalarParameterDefault:
  EQUAL literalExpression
  ;
tabularParameter:
  parameterName COLON tabularParameterOpenSchema
  | parameterName COLON tabularParameterRowSchema
  ;
tabularParameterOpenSchema:
  OPENPAREN ASTERISK CLOSEPAREN
  ;
tabularParameterRowSchema:
  OPENPAREN tabularParameterRowSchemaColumnDeclaration tabularParameterRowSchema__star10 CLOSEPAREN
  ;
tabularParameterRowSchemaColumnDeclaration:
  parameterName COLON scalarType
  ;
letFunctionBody:
  OPENBRACE letFunctionBody__star11 letFunctionBody__opt12 letFunctionBody__opt13 CLOSEBRACE
  ;
letFunctionBodyStatement:
  letStatement
  | declareQueryParametersStatement
  ;
declarePatternStatement:
  DECLARE PATTERN simpleNameReference declarePatternStatement__opt14
  ;
declarePatternDefinition:
  EQUAL declarePatternParameterList declarePatternDefinition__opt15 OPENBRACE declarePatternDefinition__plus16 CLOSEBRACE
  ;
declarePatternParameterList:
  OPENPAREN declarePatternParameter declarePatternParameterList__star17 CLOSEPAREN
  ;
declarePatternParameter:
  parameterName COLON scalarType
  ;
declarePatternPathParameter:
  OPENBRACKET declarePatternParameter CLOSEBRACKET
  ;
declarePatternRule:
  declarePatternRuleArgumentList declarePatternRule__opt18 EQUAL declarePatternBody declarePatternRule__opt19
  ;
declarePatternRuleArgumentList:
  OPENPAREN declarePatternRuleArgument declarePatternRuleArgumentList__star20 CLOSEPAREN
  ;
declarePatternRulePathArgument:
  DOT OPENBRACKET declarePatternRuleArgument CLOSEBRACKET
  ;
declarePatternRuleArgument:
  stringLiteralExpression
  ;
declarePatternBody:
  OPENBRACE declarePatternBody__star21 expression CLOSEBRACE
  ;
restrictAccessStatement:
  RESTRICT ACCESS TO OPENPAREN restrictAccessStatementEntity restrictAccessStatement__star22 CLOSEPAREN
  ;
restrictAccessStatementEntity:
  simpleNameReference
  | wildcardedEntityExpression
  ;
setStatement:
  SET identifierOrKeywordName setStatement__opt23
  ;
setStatementOptionValue:
  identifierOrKeywordName
  | literalExpression
  ;
declareQueryParametersStatement:
  DECLARE QUERYPARAMETERS OPENPAREN declareQueryParametersStatementParameter declareQueryParametersStatement__star24 CLOSEPAREN
  ;
declareQueryParametersStatementParameter:
  parameterName COLON scalarType declareQueryParametersStatementParameter__opt25
  ;
queryStatement:
  expression
  ;
expression:
  pipeExpression
  ;
pipeExpression:
  beforePipeExpression pipeExpression__star26
  ;
pipedOperator:
  BAR afterPipeOperator
  ;
pipeSubExpression:
  afterPipeOperator pipeSubExpression__star27
  ;
beforePipeExpression:
  beforeOrAfterPipeOperator
  | printOperator
  | macroExpandOperator
  | rangeExpression
  | unnamedExpression
  ;
afterPipeOperator:
  asOperator
  | assertSchemaOperator
  | consumeOperator
  | countOperator
  | distinctOperator
  | executeAndCacheOperator
  | extendOperator
  | facetByOperator
  | findOperator
  | forkOperator
  | getSchemaOperator
  | graphMarkComponentsOperator
  | graphMatchOperator
  | graphShortestPathsOperator
  | graphToTableOperator
  | invokeOperator
  | joinOperator
  | lookupOperator
  | makeGraphOperator
  | makeSeriesOperator
  | mvexpandOperator
  | mvapplyOperator
  | evaluateOperator
  | parseOperator
  | parseKvOperator
  | parseWhereOperator
  | partitionOperator
  | partitionByOperator
  | projectOperator
  | projectAwayOperator
  | projectRenameOperator
  | projectReorderOperator
  | projectKeepOperator
  | reduceByOperator
  | renderOperator
  | sampleOperator
  | sampleDistinctOperator
  | scanOperator
  | searchOperator
  | serializeOperator
  | sortOperator
  | summarizeOperator
  | takeOperator
  | topHittersOperator
  | topOperator
  | topNestedOperator
  | unionOperator
  | whereOperator
  ;
beforeOrAfterPipeOperator:
  findOperator
  | searchOperator
  | unionOperator
  | evaluateOperator
  ;
forkPipeOperator:
  countOperator
  | extendOperator
  | whereOperator
  | parseOperator
  | parseWhereOperator
  | takeOperator
  | topNestedOperator
  | projectOperator
  | projectAwayOperator
  | projectRenameOperator
  | projectReorderOperator
  | projectKeepOperator
  | summarizeOperator
  | distinctOperator
  | topHittersOperator
  | topOperator
  | sortOperator
  | mvexpandOperator
  | reduceByOperator
  | sampleOperator
  | sampleDistinctOperator
  | asOperator
  | invokeOperator
  | executeAndCacheOperator
  | scanOperator
  ;
asOperator:
  AS asOperator__star28 identifierOrKeywordOrEscapedName
  ;
assertSchemaOperator:
  ASSERTSCHEMA rowSchema
  ;
consumeOperator:
  CONSUME consumeOperator__star29
  ;
countOperator:
  COUNT countOperator__star30
  ;
distinctOperator:
  DISTINCT distinctOperator__star31 distinctOperatorStarTarget
  | DISTINCT distinctOperator__star31 distinctOperatorColumnListTarget
  ;
distinctOperatorStarTarget:
  ASTERISK
  ;
distinctOperatorColumnListTarget:
  namedExpression distinctOperatorColumnListTarget__star32
  ;
evaluateOperator:
  EVALUATE evaluateOperator__star33 functionCallExpression evaluateOperator__opt34
  ;
evaluateOperatorSchemaClause:
  COLON rowSchema
  ;
extendOperator:
  EXTEND namedExpression extendOperator__star35
  ;
executeAndCacheOperator:
  EXECUTE_AND_CACHE
  ;
facetByOperator:
  FACET BY entityExpression facetByOperator__star36 facetByOperator__opt37
  ;
facetByOperatorWithOperatorClause:
  WITH forkPipeOperator
  ;
facetByOperatorWithExpressionClause:
  WITH OPENPAREN forkOperatorExpression CLOSEPAREN
  ;
findOperator:
  FIND findOperator__opt38 findOperator__opt39 unnamedExpression findOperator__opt40 findOperator__opt41
  ;
findOperatorParametersWhereClause:
  findOperatorParametersWhereClause__star42 findOperatorParametersWhereClause__opt43 WHERE
  ;
findOperatorInClause:
  IN OPENPAREN findOperatorSource findOperatorInClause__star44 CLOSEPAREN
  ;
findOperatorProjectClause:
  PROJECT findOperatorProjectExpression findOperatorProjectClause__star45
  ;
findOperatorProjectExpression:
  findOperatorColumnExpression
  | findOperatorPackExpression
  ;
findOperatorColumnExpression:
  parameterName findOperatorColumnExpression__opt46
  ;
findOperatorOptionalColumnType:
  COLON extendedScalarType
  ;
findOperatorPackExpression:
  PACK OPENPAREN ASTERISK CLOSEPAREN
  ;
findOperatorProjectSmartClause:
  PROJECTSMART
  ;
findOperatorProjectAwayClause:
  PROJECTAWAY_ findOperatorProjectAwayStar
  | PROJECTAWAY_ findOperatorProjectAwayColumnList
  ;
findOperatorProjectAwayStar:
  ASTERISK
  ;
findOperatorProjectAwayColumnList:
  findOperatorColumnExpression findOperatorProjectAwayColumnList__star47
  ;
findOperatorSource:
  findOperatorSourceEntityExpression
  | wildcardedEntityExpression
  ;
findOperatorSourceEntityExpression:
  entityNameReference findOperatorSourceEntityExpression__star48
  ;
forkOperator:
  FORK forkOperator__plus49
  ;
forkOperatorFork:
  forkOperatorFork__opt50 OPENPAREN forkOperatorExpression CLOSEPAREN
  ;
forkOperatorExpressionName:
  identifierOrKeywordOrEscapedName EQUAL
  ;
forkOperatorExpression:
  forkPipeOperator forkOperatorExpression__star51
  ;
forkOperatorPipedOperator:
  BAR forkPipeOperator
  ;
getSchemaOperator:
  GETSCHEMA
  ;
graphMarkComponentsOperator:
  GRAPHMARKCOMPONENTS graphMarkComponentsOperator__star52
  ;
graphMatchOperator:
  GRAPHMATCH graphMatchOperator__star53 graphMatchPattern graphMatchOperator__star54 graphMatchOperator__opt55 graphMatchOperator__opt56
  ;
graphMatchPattern:
  graphMatchPatternNode
  | graphMatchPatternUnnamedEdge
  | graphMatchPatternNamedEdge
  ;
graphMatchPatternNode:
  OPENPAREN identifierOrKeywordOrEscapedName CLOSEPAREN
  ;
graphMatchPatternUnnamedEdge:
  DASHDASH_GREATERTHAN
  | LESSTHAN_DASHDASH
  | DASHDASH
  ;
graphMatchPatternNamedEdge:
  DASH_OPENBRACKET identifierOrKeywordOrEscapedName graphMatchPatternNamedEdge__opt57 CLOSEBRACKET_DASH_GREATERTHAN
  | DASH_OPENBRACKET identifierOrKeywordOrEscapedName graphMatchPatternNamedEdge__opt57 CLOSEBRACKET_DASH
  | LESSTHAN_DASH_OPENBRACKET identifierOrKeywordOrEscapedName graphMatchPatternNamedEdge__opt57 CLOSEBRACKET_DASH_GREATERTHAN
  | LESSTHAN_DASH_OPENBRACKET identifierOrKeywordOrEscapedName graphMatchPatternNamedEdge__opt57 CLOSEBRACKET_DASH
  ;
graphMatchPatternRange:
  ASTERISK invocationExpression DOTDOT invocationExpression
  ;
graphMatchWhereClause:
  WHERE expression
  ;
graphMatchProjectClause:
  PROJECT namedExpression graphMatchProjectClause__star58
  ;
graphToTableOperator:
  GRAPHTOTABLE graphToTableOutput graphToTableOperator__star59
  ;
graphToTableOutput:
  NODES graphToTableOutput__opt60 graphToTableOutput__star61
  | EDGES graphToTableOutput__opt60 graphToTableOutput__star61
  ;
graphToTableAsClause:
  AS identifierOrKeywordOrEscapedName
  ;
graphShortestPathsOperator:
  GRAPHSHORTESTPATHS graphShortestPathsOperator__star62 graphMatchPattern graphShortestPathsOperator__star63 graphShortestPathsOperator__opt64 graphShortestPathsOperator__opt65
  ;
invokeOperator:
  INVOKE dotCompositeFunctionCallExpression
  ;
joinOperator:
  JOIN unnamedExpression joinOperator__opt67
  ;
joinOperatorOnClause:
  ON joinOperatorOnClause__opt68
  ;
joinOperatorWhereClause:
  WHERE unnamedExpression
  ;
lookupOperator:
  LOOKUP lookupOperator__star70 unnamedExpression joinOperatorOnClause
  ;
macroExpandOperator:
  MACROEXPAND macroExpandOperator__star71 macroExpandEntityGroup AS identifierOrKeywordOrEscapedName OPENPAREN statement macroExpandOperator__star72 macroExpandOperator__opt73 CLOSEPAREN
  ;
macroExpandEntityGroup:
  entityGroupExpression
  | simpleNameReference
  | entityExpression
  ;
entityGroupExpression:
  ENTITYGROUP OPENBRACKET unnamedExpression entityGroupExpression__star74 CLOSEBRACKET
  ;
makeGraphOperator:
  MAKEGRAPH makeGraphOperator__star75 simpleNameReference DASHDASH_GREATERTHAN simpleNameReference makeGraphOperator__opt76 makeGraphOperator__opt77
  | MAKEGRAPH makeGraphOperator__star75 simpleNameReference DASHDASH simpleNameReference makeGraphOperator__opt76 makeGraphOperator__opt77
  ;
makeGraphIdClause:
  WITH_NODE_ID EQUAL identifierOrKeywordOrEscapedName
  ;
makeGraphTablesAndKeysClause:
  WITH invocationExpression ON simpleNameReference
  ;
makeGraphPartitionedByClause:
  PARTITIONEDBY entityPathOrElementExpression OPENPAREN contextualSubExpression CLOSEPAREN
  ;
makeSeriesOperator:
  MAKESERIES makeSeriesOperator__star78 makeSeriesOperatorAggregation makeSeriesOperator__star79 makeSeriesOperatorOnClause makeSeriesOperatorInRangeClause makeSeriesOperator__opt80
  | MAKESERIES makeSeriesOperator__star78 makeSeriesOperatorAggregation makeSeriesOperator__star79 makeSeriesOperatorOnClause makeSeriesOperatorFromToStepClause makeSeriesOperator__opt80
  ;
makeSeriesOperatorOnClause:
  ON namedExpression
  ;
makeSeriesOperatorAggregation:
  namedExpression makeSeriesOperatorAggregation__opt81
  ;
makeSeriesOperatorExpressionDefaultClause:
  DEFAULT EQUAL namedExpression
  ;
makeSeriesOperatorInRangeClause:
  IN RANGE OPENPAREN namedExpression COMMA namedExpression COMMA namedExpression CLOSEPAREN
  ;
makeSeriesOperatorFromToStepClause:
  makeSeriesOperatorFromToStepClause__opt82 makeSeriesOperatorFromToStepClause__opt83 STEP namedExpression
  ;
makeSeriesOperatorByClause:
  BY namedExpression makeSeriesOperatorByClause__star84
  ;
mvapplyOperator:
  MVAPPLY mvapplyOperator__star85 mvapplyOperatorExpression mvapplyOperator__star86 mvapplyOperator__opt87 mvapplyOperator__opt88 ON OPENPAREN contextualSubExpression CLOSEPAREN
  | MV_APPLY mvapplyOperator__star85 mvapplyOperatorExpression mvapplyOperator__star86 mvapplyOperator__opt87 mvapplyOperator__opt88 ON OPENPAREN contextualSubExpression CLOSEPAREN
  ;
mvapplyOperatorLimitClause:
  LIMIT LONGLITERAL
  ;
mvapplyOperatorIdClause:
  ID GUIDLITERAL
  ;
mvapplyOperatorExpression:
  namedExpression mvapplyOperatorExpression__opt89
  ;
mvapplyOperatorExpressionToClause:
  TO TYPELITERAL
  ;
mvexpandOperator:
  MVEXPAND mvexpandOperator__star90 mvexpandOperatorExpression mvexpandOperator__star91 mvexpandOperator__opt92
  | MV_EXPAND mvexpandOperator__star90 mvexpandOperatorExpression mvexpandOperator__star91 mvexpandOperator__opt92
  ;
mvexpandOperatorExpression:
  namedExpression mvexpandOperatorExpression__opt93
  ;
parseOperator:
  PARSE parseOperator__opt94 unnamedExpression WITH parseOperatorPattern
  ;
parseOperatorKindClause:
  KIND EQUAL SIMPLE parseOperatorKindClause__opt95
  | KIND EQUAL REGEX parseOperatorKindClause__opt95
  | KIND EQUAL RELAXED parseOperatorKindClause__opt95
  ;
parseOperatorFlagsClause:
  FLAGS EQUAL IDENTIFIER
  ;
parseOperatorNameAndOptionalType:
  simpleNameReference parseOperatorNameAndOptionalType__opt96
  ;
parseOperatorPattern:
  parseOperatorPattern__opt97 parseOperatorPattern__star98 parseOperatorPattern__opt99
  ;
parseOperatorPatternSegment:
  parseOperatorPatternSegment__opt100 stringLiteralExpression parseOperatorPatternSegment__opt101
  ;
parseWhereOperator:
  PARSEWHERE parseWhereOperator__opt102 unnamedExpression WITH parseOperatorPattern
  ;
parseKvOperator:
  PARSEKV unnamedExpression rowSchema parseKvOperator__opt103
  ;
parseKvWithClause:
  WITH OPENPAREN queryOperatorProperty parseKvWithClause__star104 CLOSEPAREN
  ;
partitionOperator:
  PARTITION partitionOperator__star105 BY entityExpression partitionOperator__opt106 partitionOperatorSubExpressionBody
  | PARTITION partitionOperator__star105 BY entityExpression partitionOperator__opt106 partitionOperatorFullExpressionBody
  ;
partitionOperatorInClause:
  IN functionCallExpression
  | IN dynamicLiteralExpression
  ;
partitionOperatorSubExpressionBody:
  OPENPAREN pipeSubExpression CLOSEPAREN
  ;
partitionOperatorFullExpressionBody:
  OPENBRACE pipeExpression CLOSEBRACE
  ;
partitionByOperator:
  PARTITIONBY partitionByOperator__star107 entityExpression partitionByOperator__opt108 OPENPAREN contextualSubExpression CLOSEPAREN
  ;
partitionByOperatorIdClause:
  ID GUIDLITERAL
  ;
printOperator:
  PRINT namedExpression printOperator__star109
  ;
projectAwayOperator:
  PROJECTAWAY projectAwayOperator__opt110
  ;
projectKeepOperator:
  PROJECTKEEP simpleOrWildcardedNameReference projectKeepOperator__star112
  ;
projectOperator:
  PROJECT projectOperator__opt113
  ;
projectRenameOperator:
  PROJECTRENAME projectRenameOperator__opt115
  ;
projectReorderOperator:
  PROJECTREORDER projectReorderOperator__opt117
  ;
projectReorderExpression:
  simpleOrWildcardedNameReference projectReorderExpression__opt119
  ;
reduceByOperator:
  REDUCE reduceByOperator__star120 BY namedExpression reduceByOperator__opt121
  ;
reduceByWithClause:
  WITH namedExpression reduceByWithClause__star122
  ;
renderOperator:
  RENDER TABLE renderOperator__opt123
  | RENDER LIST renderOperator__opt123
  | RENDER BARCHART renderOperator__opt123
  | RENDER PIECHART renderOperator__opt123
  | RENDER LADDERCHART renderOperator__opt123
  | RENDER TIMECHART renderOperator__opt123
  | RENDER LINECHART renderOperator__opt123
  | RENDER ANOMALYCHART renderOperator__opt123
  | RENDER PIVOTCHART renderOperator__opt123
  | RENDER AREACHART renderOperator__opt123
  | RENDER STACKEDAREACHART renderOperator__opt123
  | RENDER SCATTERCHART renderOperator__opt123
  | RENDER TIMEPIVOT renderOperator__opt123
  | RENDER COLUMNCHART renderOperator__opt123
  | RENDER TIMELINE renderOperator__opt123
  | RENDER CHART3D_ renderOperator__opt123
  | RENDER CARD renderOperator__opt123
  | RENDER TREEMAP renderOperator__opt123
  | RENDER IDENTIFIER renderOperator__opt123
  ;
renderOperatorWithClause:
  WITH OPENPAREN renderOperatorWithClause__opt124 CLOSEPAREN
  ;
renderOperatorLegacyPropertyList:
  renderOperatorLegacyPropertyList__plus126
  ;
renderOperatorProperty:
  TITLE EQUAL functionCallOrPathExpression
  | XCOLUMN EQUAL simpleNameReference
  | SERIES EQUAL renderPropertyNameList
  | YCOLUMNS EQUAL renderPropertyNameList
  | ANOMALYCOLUMNS EQUAL renderPropertyNameList
  | KIND EQUAL DEFAULT
  | KIND EQUAL UNSTACKED
  | KIND EQUAL STACKED
  | KIND EQUAL STACKED100
  | KIND EQUAL MAP
  | XTITLE EQUAL functionCallOrPathExpression
  | YTITLE EQUAL functionCallOrPathExpression
  | XAXIS EQUAL LINEAR
  | XAXIS EQUAL LOG
  | YAXIS EQUAL LINEAR
  | YAXIS EQUAL LOG
  | LEGEND EQUAL VISIBLE
  | LEGEND EQUAL HIDDEN_
  | YSPLIT EQUAL NONE
  | YSPLIT EQUAL AXES
  | YSPLIT EQUAL PANELS
  | ACCUMULATE EQUAL BOOLEANLITERAL
  | YMIN EQUAL numericLiteralExpression
  | YMAX EQUAL numericLiteralExpression
  | XMIN EQUAL literalExpression
  | XMAX EQUAL literalExpression
  ;
renderPropertyNameList:
  extendedNameReference renderPropertyNameList__star127
  ;
renderOperatorLegacyProperty:
  TITLE EQUAL stringLiteralExpression
  | KIND EQUAL DEFAULT
  | KIND EQUAL UNSTACKED
  | KIND EQUAL STACKED
  | KIND EQUAL STACKED100
  | KIND EQUAL MAP
  | WITH stringLiteralExpression
  | BY renderPropertyNameList
  | ACCUMULATE EQUAL BOOLEANLITERAL
  ;
sampleDistinctOperator:
  SAMPLE_DISTINCT sampleDistinctOperator__star128 namedExpression OF namedExpression
  ;
sampleOperator:
  SAMPLE sampleOperator__star129 namedExpression
  ;
scanOperator:
  SCAN scanOperator__star130 scanOperator__opt131 scanOperator__opt132 scanOperator__opt133 WITH OPENPAREN scanOperator__plus134 CLOSEPAREN
  ;
scanOperatorOrderByClause:
  ORDER BY orderedExpression scanOperatorOrderByClause__star135
  ;
scanOperatorPartitionByClause:
  PARTITION BY unnamedExpression scanOperatorPartitionByClause__star136
  ;
scanOperatorDeclareClause:
  DECLARE OPENPAREN scalarParameter scanOperatorDeclareClause__star137 CLOSEPAREN
  ;
scanOperatorStep:
  STEP parameterName scanOperatorStep__opt138 scanOperatorStep__opt139 COLON unnamedExpression scanOperatorStep__opt140 SEMICOLON
  ;
scanOperatorStepOutputClause:
  OUTPUT EQUAL ALL
  | OUTPUT EQUAL LAST
  | OUTPUT EQUAL NONE
  ;
scanOperatorBody:
  EQUAL_GREATERTHAN scanOperatorAssignment scanOperatorBody__star141
  ;
scanOperatorAssignment:
  parameterName EQUAL unnamedExpression
  ;
searchOperator:
  SEARCH searchOperator__star142 searchOperator__opt143 searchOperator__opt144 unnamedExpression
  | SEARCH searchOperator__star142 searchOperator__opt143 searchOperator__opt144 starExpression
  | SEARCH searchOperator__star142 searchOperator__opt143 searchOperator__opt144 searchOperatorStarAndExpression
  ;
searchOperatorStarAndExpression:
  ASTERISK AND unnamedExpression
  ;
searchOperatorInClause:
  IN OPENPAREN findOperatorSource searchOperatorInClause__star145 CLOSEPAREN
  ;
serializeOperator:
  SERIALIZE serializeOperator__star146 namedExpression serializeOperator__star147
  ;
sortOperator:
  SORT sortOperator__star148 BY orderedExpression sortOperator__star149
  | ORDER sortOperator__star148 BY orderedExpression sortOperator__star149
  ;
orderedExpression:
  namedExpression sortOrdering
  ;
sortOrdering:
  sortOrdering__opt150 sortOrdering__opt151
  ;
summarizeOperator:
  SUMMARIZE summarizeOperator__star152 summarizeOperator__opt153 summarizeOperator__opt155
  ;
summarizeOperatorByClause:
  BY unnamedExpression summarizeOperatorByClause__star156 summarizeOperatorByClause__opt157
  ;
summarizeOperatorLegacyBinClause:
  BIN EQUAL numberLikeLiteralExpression
  ;
takeOperator:
  LIMIT takeOperator__star158 namedExpression
  | TAKE takeOperator__star158 namedExpression
  ;
topOperator:
  TOP topOperator__star159 namedExpression BY orderedExpression
  ;
topHittersOperator:
  TOP_HITTERS namedExpression OF namedExpression topHittersOperator__opt160
  ;
topHittersOperatorByClause:
  BY orderedExpression
  ;
topNestedOperator:
  topNestedOperatorPart topNestedOperator__star161
  ;
topNestedOperatorPart:
  TOP_NESTED topNestedOperatorPart__opt162 OF namedExpression topNestedOperatorPart__opt163 BY orderedExpression
  ;
topNestedOperatorWithOthersClause:
  WITH OTHERS EQUAL namedExpression
  ;
unionOperator:
  UNION unionOperator__star164 unionOperatorExpression unionOperator__star165
  ;
unionOperatorExpression:
  wildcardedEntityExpression
  | entityNameReference
  | parenthesizedExpression
  ;
whereOperator:
  FILTER whereOperator__star166 unnamedExpression
  | WHERE whereOperator__star166 unnamedExpression
  ;
contextualSubExpression:
  pipeSubExpression
  | contextualPipeExpression
  ;
contextualPipeExpression:
  contextualDataTableExpression contextualPipeExpression__star167
  ;
contextualPipeExpressionPipedOperator:
  BAR afterPipeOperator
  ;
strictQueryOperatorParameter:
  BAGEXPANSION EQUAL identifierOrKeywordName
  | BAGEXPANSION EQUAL literalExpression
  | BIN_LEGACY EQUAL identifierOrKeywordName
  | BIN_LEGACY EQUAL literalExpression
  | CROSSCLUSTER__ EQUAL identifierOrKeywordName
  | CROSSCLUSTER__ EQUAL literalExpression
  | CROSSDB__ EQUAL identifierOrKeywordName
  | CROSSDB__ EQUAL literalExpression
  | DECODEBLOCKS EQUAL identifierOrKeywordName
  | DECODEBLOCKS EQUAL literalExpression
  | EXPANDOUTPUT EQUAL identifierOrKeywordName
  | EXPANDOUTPUT EQUAL literalExpression
  | HINT_CONCURRENCY EQUAL identifierOrKeywordName
  | HINT_CONCURRENCY EQUAL literalExpression
  | HINT_DISTRIBUTION EQUAL identifierOrKeywordName
  | HINT_DISTRIBUTION EQUAL literalExpression
  | HINT_MATERIALIZED EQUAL identifierOrKeywordName
  | HINT_MATERIALIZED EQUAL literalExpression
  | HINT_NUM_PARTITIONS EQUAL identifierOrKeywordName
  | HINT_NUM_PARTITIONS EQUAL literalExpression
  | HINT_PASS_FILTERS EQUAL identifierOrKeywordName
  | HINT_PASS_FILTERS EQUAL literalExpression
  | HINT_PASS_FILTERS_COLUMN EQUAL identifierOrKeywordName
  | HINT_PASS_FILTERS_COLUMN EQUAL literalExpression
  | HINT_PROGRESSIVE_TOP EQUAL identifierOrKeywordName
  | HINT_PROGRESSIVE_TOP EQUAL literalExpression
  | HINT_REMOTE EQUAL identifierOrKeywordName
  | HINT_REMOTE EQUAL literalExpression
  | HINT_SUFFLEKEY EQUAL identifierOrKeywordName
  | HINT_SUFFLEKEY EQUAL literalExpression
  | HINT_SPREAD EQUAL identifierOrKeywordName
  | HINT_SPREAD EQUAL literalExpression
  | HINT_STRATEGY EQUAL identifierOrKeywordName
  | HINT_STRATEGY EQUAL literalExpression
  | ISFUZZY EQUAL identifierOrKeywordName
  | ISFUZZY EQUAL literalExpression
  | ISFUZZY__ EQUAL identifierOrKeywordName
  | ISFUZZY__ EQUAL literalExpression
  | ID__ EQUAL identifierOrKeywordName
  | ID__ EQUAL literalExpression
  | KIND EQUAL identifierOrKeywordName
  | KIND EQUAL literalExpression
  | PACKEDCOLUMN__ EQUAL identifierOrKeywordName
  | PACKEDCOLUMN__ EQUAL literalExpression
  | SOURCECOLUMNINDEX__ EQUAL identifierOrKeywordName
  | SOURCECOLUMNINDEX__ EQUAL literalExpression
  | WITH_ITEM_INDEX EQUAL identifierOrKeywordName
  | WITH_ITEM_INDEX EQUAL literalExpression
  | WITH_MATCH_ID EQUAL identifierOrKeywordName
  | WITH_MATCH_ID EQUAL literalExpression
  | WITH_STEP_NAME EQUAL identifierOrKeywordName
  | WITH_STEP_NAME EQUAL literalExpression
  | WITHSOURCE EQUAL identifierOrKeywordName
  | WITHSOURCE EQUAL literalExpression
  | WITH_SOURCE EQUAL identifierOrKeywordName
  | WITH_SOURCE EQUAL literalExpression
  | WITHNOSOURCE__ EQUAL identifierOrKeywordName
  | WITHNOSOURCE__ EQUAL literalExpression
  ;
relaxedQueryOperatorParameter:
  IDENTIFIER EQUAL identifierOrKeywordName
  | IDENTIFIER EQUAL literalExpression
  | BAGEXPANSION EQUAL identifierOrKeywordName
  | BAGEXPANSION EQUAL literalExpression
  | BIN_LEGACY EQUAL identifierOrKeywordName
  | BIN_LEGACY EQUAL literalExpression
  | CROSSCLUSTER__ EQUAL identifierOrKeywordName
  | CROSSCLUSTER__ EQUAL literalExpression
  | CROSSDB__ EQUAL identifierOrKeywordName
  | CROSSDB__ EQUAL literalExpression
  | DECODEBLOCKS EQUAL identifierOrKeywordName
  | DECODEBLOCKS EQUAL literalExpression
  | EXPANDOUTPUT EQUAL identifierOrKeywordName
  | EXPANDOUTPUT EQUAL literalExpression
  | HINT_CONCURRENCY EQUAL identifierOrKeywordName
  | HINT_CONCURRENCY EQUAL literalExpression
  | HINT_DISTRIBUTION EQUAL identifierOrKeywordName
  | HINT_DISTRIBUTION EQUAL literalExpression
  | HINT_MATERIALIZED EQUAL identifierOrKeywordName
  | HINT_MATERIALIZED EQUAL literalExpression
  | HINT_NUM_PARTITIONS EQUAL identifierOrKeywordName
  | HINT_NUM_PARTITIONS EQUAL literalExpression
  | HINT_PASS_FILTERS EQUAL identifierOrKeywordName
  | HINT_PASS_FILTERS EQUAL literalExpression
  | HINT_PASS_FILTERS_COLUMN EQUAL identifierOrKeywordName
  | HINT_PASS_FILTERS_COLUMN EQUAL literalExpression
  | HINT_PROGRESSIVE_TOP EQUAL identifierOrKeywordName
  | HINT_PROGRESSIVE_TOP EQUAL literalExpression
  | HINT_REMOTE EQUAL identifierOrKeywordName
  | HINT_REMOTE EQUAL literalExpression
  | HINT_SUFFLEKEY EQUAL identifierOrKeywordName
  | HINT_SUFFLEKEY EQUAL literalExpression
  | HINT_SPREAD EQUAL identifierOrKeywordName
  | HINT_SPREAD EQUAL literalExpression
  | HINT_STRATEGY EQUAL identifierOrKeywordName
  | HINT_STRATEGY EQUAL literalExpression
  | ISFUZZY EQUAL identifierOrKeywordName
  | ISFUZZY EQUAL literalExpression
  | ISFUZZY__ EQUAL identifierOrKeywordName
  | ISFUZZY__ EQUAL literalExpression
  | ID__ EQUAL identifierOrKeywordName
  | ID__ EQUAL literalExpression
  | KIND EQUAL identifierOrKeywordName
  | KIND EQUAL literalExpression
  | PACKEDCOLUMN__ EQUAL identifierOrKeywordName
  | PACKEDCOLUMN__ EQUAL literalExpression
  | SOURCECOLUMNINDEX__ EQUAL identifierOrKeywordName
  | SOURCECOLUMNINDEX__ EQUAL literalExpression
  | WITH_ITEM_INDEX EQUAL identifierOrKeywordName
  | WITH_ITEM_INDEX EQUAL literalExpression
  | WITH_MATCH_ID EQUAL identifierOrKeywordName
  | WITH_MATCH_ID EQUAL literalExpression
  | WITH_STEP_NAME EQUAL identifierOrKeywordName
  | WITH_STEP_NAME EQUAL literalExpression
  | WITHSOURCE EQUAL identifierOrKeywordName
  | WITHSOURCE EQUAL literalExpression
  | WITH_SOURCE EQUAL identifierOrKeywordName
  | WITH_SOURCE EQUAL literalExpression
  | WITHNOSOURCE__ EQUAL identifierOrKeywordName
  | WITHNOSOURCE__ EQUAL literalExpression
  ;
queryOperatorProperty:
  IDENTIFIER EQUAL identifierOrKeywordName
  | IDENTIFIER EQUAL literalExpression
  ;
namedExpression:
  namedExpression__opt168 unnamedExpression
  ;
namedExpressionNameClause:
  identifierOrExtendedKeywordOrEscapedName EQUAL
  | namedExpressionNameList EQUAL
  ;
namedExpressionNameList:
  OPENPAREN identifierOrExtendedKeywordOrEscapedName namedExpressionNameList__star169 CLOSEPAREN
  ;
unnamedExpression:
  logicalOrExpression
  ;
logicalOrExpression:
  logicalAndExpression logicalOrExpression__star170
  ;
logicalOrOperation:
  OR logicalAndExpression
  ;
logicalAndExpression:
  equalityExpression logicalAndExpression__star171
  ;
logicalAndOperation:
  AND equalityExpression
  ;
equalityExpression:
  relationalExpression
  | equalsEqualityExpression
  | listEqualityExpression
  | betweenEqualityExpression
  | starEqualityExpression
  ;
equalsEqualityExpression:
  relationalExpression EQUALEQUAL relationalExpression
  | relationalExpression LESSTHAN_GREATERTHAN relationalExpression
  | relationalExpression EXCLAIMATIONPOINT_EQUAL relationalExpression
  ;
listEqualityExpression:
  relationalExpression IN OPENPAREN invocationExpression listEqualityExpression__star172 CLOSEPAREN
  | relationalExpression NOT_IN OPENPAREN invocationExpression listEqualityExpression__star172 CLOSEPAREN
  | relationalExpression IN_CI OPENPAREN invocationExpression listEqualityExpression__star172 CLOSEPAREN
  | relationalExpression NOT_IN_CI OPENPAREN invocationExpression listEqualityExpression__star172 CLOSEPAREN
  | relationalExpression HAS_ANY OPENPAREN invocationExpression listEqualityExpression__star172 CLOSEPAREN
  | relationalExpression HAS_ALL OPENPAREN invocationExpression listEqualityExpression__star172 CLOSEPAREN
  ;
betweenEqualityExpression:
  relationalExpression BETWEEN OPENPAREN invocationExpression DOTDOT invocationExpression CLOSEPAREN
  | relationalExpression NOT_BETWEEN OPENPAREN invocationExpression DOTDOT invocationExpression CLOSEPAREN
  ;
starEqualityExpression:
  ASTERISK EQUALEQUAL relationalExpression
  ;
relationalExpression:
  additiveExpression relationalExpression__opt173
  ;
additiveExpression:
  multiplicativeExpression additiveExpression__star174
  ;
additiveOperation:
  PLUS multiplicativeExpression
  | DASH multiplicativeExpression
  ;
multiplicativeExpression:
  stringOperatorExpression multiplicativeExpression__star175
  ;
multiplicativeOperation:
  ASTERISK stringOperatorExpression
  | SLASH stringOperatorExpression
  | PERCENTSIGN stringOperatorExpression
  ;
stringOperatorExpression:
  stringBinaryOperatorExpression
  | stringStarOperatorExpression
  ;
stringBinaryOperatorExpression:
  invocationExpression stringBinaryOperatorExpression__opt176
  ;
stringBinaryOperation:
  stringBinaryOperator invocationExpression
  | COLON invocationExpression
  ;
stringBinaryOperator:
  EQUALTILDE
  | EXCLAIMATIONPOINT_TILDE
  | HAS
  | NOT_HAS
  | HAS_CS
  | NOT_HAS_CS
  | HASPREFIX
  | NOT_HASPREFIX
  | HASPREFIX_CS
  | NOT_HASPREFIX_CS
  | HASSUFFIX
  | NOT_HASSUFFIX
  | HASSUFFIX_CS
  | NOT_HASSUFFIX_CS
  | LIKE
  | NOTLIKE
  | LIKECS
  | NOTLIKECS
  | CONTAINS
  | NOTCONTAINS
  | CONTAINSCS
  | NOTCONTAINSCS
  | NOT_CONTAINS
  | CONTAINS_CS
  | NOT_CONTAINS_CS
  | STARTSWITH
  | NOT_STARTSWITH
  | STARTSWITH_CS
  | NOT_STARTSWITH_CS
  | ENDSWITH
  | NOT_ENDSWITH
  | ENDSWITH_CS
  | NOT_ENDSWITH_CS
  | MATCHES_REGEX
  ;
stringStarOperatorExpression:
  ASTERISK stringBinaryOperator invocationExpression
  ;
invocationExpression:
  invocationExpression__opt177 functionCallOrPathExpression
  ;
functionCallOrPathExpression:
  functionCallOrPathRoot functionCallOrPathExpression__opt_path
  | toTableExpression
  ;
functionCallOrPathRoot:
  primaryExpression
  | toScalarExpression
  ;
functionCallOrPathOperation:
  functionCallOrPathPathOperation
  | functionCallOrPathElementOperation
  | legacyFunctionCallOrPathElementOperation
  ;
functionCallOrPathPathOperation:
  DOT identifierOrKeywordOrEscapedName
  ;
functionCallOrPathElementOperation:
  OPENBRACKET unnamedExpression CLOSEBRACKET
  ;
legacyFunctionCallOrPathElementOperation:
  DOT OPENBRACKET unnamedExpression CLOSEBRACKET
  ;
toScalarExpression:
  TOSCALAR toScalarExpression__opt179 OPENPAREN pipeExpression CLOSEPAREN
  ;
toTableExpression:
  TOTABLE toTableExpression__opt180 OPENPAREN pipeExpression CLOSEPAREN
  ;
noOptimizationParameter:
  KIND EQUAL NOOPTIMIZATION
  ;
dotCompositeFunctionCallExpression:
  functionCallExpression dotCompositeFunctionCallExpression__star181
  ;
dotCompositeFunctionCallOperation:
  DOT functionCallExpression
  ;
functionCallExpression:
  namedFunctionCallExpression
  | countExpression
  ;
namedFunctionCallExpression:
  simpleNameReference OPENPAREN namedFunctionCallExpression__opt182 CLOSEPAREN
  | identifierCallName namedFunctionCallExpression__opt182 CLOSEPAREN
  ;
argumentExpression:
  unnamedExpression argumentExpression__opt_name
  | starExpression
  ;
countExpression:
  COUNT OPENPAREN countExpression__opt184 CLOSEPAREN
  ;
starExpression:
  ASTERISK
  ;
primaryExpression:
  functionCallExpression
  | unsignedLiteralExpression
  | nameReferenceWithDataScope
  | dataTableExpression
  | externalDataExpression
  | contextualDataTableExpression
  | materializedViewCombineExpression
  | parenthesizedExpression
  ;
nameReferenceWithDataScope:
  simpleNameReference nameReferenceWithDataScope__opt185
  ;
dataScopeClause:
  DATASCOPE EQUAL HOTCACHE
  | DATASCOPE EQUAL ALL
  ;
parenthesizedExpression:
  OPENPAREN expression CLOSEPAREN
  ;
rangeExpression:
  RANGE simpleNameReference FROM unnamedExpression TO unnamedExpression STEP unnamedExpression
  ;
entityExpression:
  entityNameReference
  | entityPathOrElementExpression
  ;
entityPathOrElementExpression:
  entityNameReference entityPathOrElementExpression__plus186
  ;
entityPathOrElementOperator:
  entityPathOperator
  | entityElementOperator
  | legacyEntityPathElementOperator
  ;
entityPathOperator:
  DOT entityName
  ;
entityElementOperator:
  OPENBRACKET unnamedExpression CLOSEBRACKET
  ;
legacyEntityPathElementOperator:
  DOT OPENBRACKET unnamedExpression CLOSEBRACKET
  ;
entityName:
  atSignName
  | identifierOrExtendedKeywordOrEscapedName
  | extendedPathName
  ;
entityNameReference:
  entityName
  ;
atSignName:
  ATSIGN
  ;
extendedPathName:
  KIND
  | WITHSOURCE
  | WITH_SOURCE
  ;
wildcardedEntityExpression:
  wildcardedNameReference
  | dotCompositeFunctionCallExpression
  | wildcardedPathExpression
  ;
wildcardedPathExpression:
  dotCompositeFunctionCallExpression DOT wildcardedPathName
  ;
wildcardedPathName:
  wildcardedName
  | entityName
  ;
contextualDataTableExpression:
  CONTEXTUAL_DATATABLE GUIDLITERAL rowSchema
  ;
dataTableExpression:
  DATATABLE dataTableExpression__star187 rowSchema OPENBRACKET dataTableExpression__opt188 dataTableExpression__star189 dataTableExpression__opt190 CLOSEBRACKET
  ;
rowSchema:
  OPENPAREN rowSchema__opt191 rowSchema__star192 rowSchema__opt193 CLOSEPAREN
  ;
rowSchemaColumnDeclaration:
  parameterName COLON scalarType
  ;
externalDataExpression:
  EXTERNALDATA externalDataExpression__star194 rowSchema OPENBRACKET stringLiteralExpression externalDataExpression__star195 CLOSEBRACKET externalDataExpression__opt196
  | EXTERNAL_DATA externalDataExpression__star194 rowSchema OPENBRACKET stringLiteralExpression externalDataExpression__star195 CLOSEBRACKET externalDataExpression__opt196
  ;
externalDataWithClause:
  WITH OPENPAREN externalDataWithClause__opt197 CLOSEPAREN
  ;
externalDataWithClauseProperty:
  parameterName EQUAL stringLiteralExpression
  | parameterName EQUAL LONGLITERAL
  | parameterName EQUAL REALLITERAL
  | parameterName EQUAL BOOLEANLITERAL
  | parameterName EQUAL DATETIMELITERAL
  | parameterName EQUAL TYPELITERAL
  | parameterName EQUAL GUIDLITERAL
  | parameterName EQUAL RAWGUIDLITERAL
  | parameterName EQUAL parameterName
  ;
materializedViewCombineExpression:
  MATERIALIZED_VIEW_COMBINE OPENPAREN stringLiteralExpression CLOSEPAREN materializeViewCombineBaseClause materializedViewCombineDeltaClause materializedViewCombineAggregationsClause
  ;
materializeViewCombineBaseClause:
  BASE OPENPAREN expression CLOSEPAREN
  ;
materializedViewCombineDeltaClause:
  DELTA OPENPAREN expression CLOSEPAREN
  ;
materializedViewCombineAggregationsClause:
  AGGREGATIONS OPENPAREN summarizeOperator CLOSEPAREN
  ;
scalarType:
  BOOL
  | BOOLEAN
  | DATE
  | DATETIME
  | DECIMAL
  | DOUBLE
  | DYNAMIC
  | GUID
  | INT
  | INT64
  | INT8
  | LONG
  | REAL
  | STRING
  | TIME
  | TIMESPAN
  | UNIQUEID
  ;
extendedScalarType:
  BOOL
  | BOOLEAN
  | DATE
  | DATETIME
  | DECIMAL
  | DOUBLE
  | DYNAMIC
  | FLOAT
  | GUID
  | INT
  | INT16
  | INT32
  | INT64
  | INT8
  | LONG
  | REAL
  | STRING
  | TIME
  | TIMESPAN
  | UINT
  | UINT16
  | UINT32
  | UINT64
  | UINT8
  | ULONG
  | UNIQUEID
  ;
parameterName:
  identifierOrExtendedKeywordOrEscapedName
  ;
simpleNameReference:
  identifierOrKeywordOrEscapedName
  ;
extendedNameReference:
  identifierOrExtendedKeywordOrEscapedName
  ;
wildcardedNameReference:
  wildcardedName
  ;
simpleOrWildcardedNameReference:
  simpleNameReference
  | wildcardedNameReference
  ;
identifierName:
  IDENTIFIER
  ;
keywordName:
  ACCESS
  | AGGREGATIONS
  | ALIAS
  | ALL
  | AXES
  | BASE
  | BIN
  | BOOL
  | CLUSTER
  | DATABASE
  | DECLARE
  | DEFAULT
  | DELTA
  | EDGES
  | EVALUATE
  | EXECUTE
  | FACET
  | FORK
  | FROM
  | GUID
  | HIDDEN_
  | HOT
  | HOTDATA
  | HOTINDEX
  | ID
  | INTO
  | LEGEND
  | LET
  | LINEAR
  | LOG
  | LOOKUP
  | LIST
  | MAP
  | NODES
  | NONE
  | NULL
  | NULLS
  | ON
  | OPTIONAL
  | OUTPUT
  | PACK
  | PARTITION
  | PARTITIONBY
  | PATTERN
  | PLUGIN
  | QUERYPARAMETERS
  | RANGE
  | REDUCE
  | REPLACE
  | RENDER
  | RESTRICT
  | SERIES
  | STACKED
  | STACKED100
  | STEP
  | THRESHOLD
  | TYPEOF
  | UNSTACKED
  | UUID
  | VIEW
  | VISIBLE
  | WITH
  | XAXIS
  | XCOLUMN
  | XMAX
  | XMIN
  | XTITLE
  | YAXIS
  | YCOLUMNS
  | YMAX
  | YMIN
  | YTITLE
  | YSPLIT
  ;
extendedKeywordName:
  ACCUMULATE
  | AS
  | BY
  | CONTAINS
  | CONSUME
  | COUNT
  | DATATABLE
  | DISTINCT
  | EXTEND
  | EXTERNALDATA
  | FIND
  | FILTER
  | HAS
  | IN
  | INVOKE
  | LIMIT
  | MATERIALIZE
  | OF
  | PARSE
  | PRINT
  | SAMPLE
  | SAMPLE_DISTINCT
  | SCAN
  | SEARCH
  | SERIALIZE
  | SET
  | SORT
  | SUMMARIZE
  | TAKE
  | TITLE
  | TO
  | TOP
  | TOSCALAR
  | TOTABLE
  | TOP_NESTED
  | TOP_HITTERS
  | WHERE
  ;
escapedName:
  OPENBRACKET stringLiteralExpression CLOSEBRACKET
  ;
identifierOrKeywordName:
  identifierName
  | keywordName
  ;
identifierOrKeywordOrEscapedName:
  identifierName
  | keywordName
  | escapedName
  ;
identifierOrExtendedKeywordOrEscapedName:
  identifierName
  | keywordName
  | extendedKeywordName
  | escapedName
  ;
wildcardedName:
  wildcardedName__opt200 ASTERISK wildcardedName__star201
  ;
wildcardedNamePrefix:
  IDENTIFIER
  | keywordName
  | extendedKeywordName
  ;
wildcardedNameSegment:
  IDENTIFIER
  | keywordName
  | extendedKeywordName
  | LONGLITERAL
  | ASTERISK
  ;
literalExpression:
  signedLiteralExpression
  | unsignedLiteralExpression
  ;
unsignedLiteralExpression:
  longLiteralExpression
  | intLiteralExpression
  | realLiteralExpression
  | decimalLiteralExpression
  | dateTimeLiteralExpression
  | timeSpanLiteralExpression
  | booleanLiteralExpression
  | guidLiteralExpression
  | typeLiteralExpression
  | stringLiteralExpression
  | dynamicLiteralExpression
  ;
numberLikeLiteralExpression:
  longLiteralExpression
  | intLiteralExpression
  | realLiteralExpression
  | decimalLiteralExpression
  | signedLiteralExpression
  | dateTimeLiteralExpression
  | timeSpanLiteralExpression
  ;
numericLiteralExpression:
  longLiteralExpression
  | intLiteralExpression
  | realLiteralExpression
  | decimalLiteralExpression
  | signedLiteralExpression
  ;
signedLiteralExpression:
  signedLongLiteralExpression
  | signedRealLiteralExpression
  ;
longLiteralExpression:
  LONGLITERAL
  ;
intLiteralExpression:
  INTLITERAL
  ;
realLiteralExpression:
  REALLITERAL
  ;
decimalLiteralExpression:
  DECIMALLITERAL
  ;
dateTimeLiteralExpression:
  DATETIMELITERAL
  ;
timeSpanLiteralExpression:
  TIMESPANLITERAL
  ;
booleanLiteralExpression:
  BOOLEANLITERAL
  ;
guidLiteralExpression:
  GUIDLITERAL
  ;
typeLiteralExpression:
  TYPELITERAL
  ;
signedLongLiteralExpression:
  PLUS LONGLITERAL
  | DASH LONGLITERAL
  ;
signedRealLiteralExpression:
  PLUS REALLITERAL
  | DASH REALLITERAL
  ;
stringLiteralExpression:
  STRINGLITERAL stringLiteralExpression__star202
  ;
dynamicLiteralExpression:
  DYNAMIC OPENPAREN jsonValue CLOSEPAREN
  ;
jsonValue:
  jsonArray
  | jsonBoolean
  | jsonDateTime
  | jsonGuid
  | jsonLong
  | jsonNull
  | jsonObject
  | jsonReal
  | jsonString
  | jsonTimeSpan
  | dynamicLiteralExpression
  ;
jsonObject:
  OPENBRACE jsonObject__opt203 CLOSEBRACE
  ;
jsonPair:
  STRINGLITERAL COLON jsonValue
  ;
jsonArray:
  OPENBRACKET jsonArray__opt205 CLOSEBRACKET
  ;
jsonBoolean:
  BOOLEANLITERAL
  ;
jsonDateTime:
  DATETIMELITERAL
  ;
jsonGuid:
  GUIDLITERAL
  ;
jsonNull:
  NULL
  ;
jsonString:
  STRINGLITERAL jsonString__star207
  ;
jsonTimeSpan:
  TIMESPANLITERAL
  ;
jsonLong:
  jsonLong__opt208 LONGLITERAL
  ;
jsonReal:
  jsonReal__opt209 REALLITERAL
  ;
query__star1:
  
  | SEMICOLON statement query__star1
  ;
query__opt2:
  
  | SEMICOLON
  ;
letFunctionDeclaration__opt3:
  
  | letFunctionParameterList
  ;
letViewDeclaration__opt4:
  
  | letViewParameterList
  ;
letViewParameterList__star5:
  
  | COMMA scalarParameter letViewParameterList__star5
  ;
letFunctionParameterList__star6:
  
  | COMMA tabularParameter letFunctionParameterList__star6
  ;
letFunctionParameterList__star7:
  
  | COMMA scalarParameter letFunctionParameterList__star7
  ;
letFunctionParameterList__star8:
  
  | COMMA scalarParameter letFunctionParameterList__star8
  ;
scalarParameter__opt9:
  
  | scalarParameterDefault
  ;
tabularParameterRowSchema__star10:
  
  | COMMA tabularParameterRowSchemaColumnDeclaration tabularParameterRowSchema__star10
  ;
letFunctionBody__star11:
  
  | letFunctionBodyStatement SEMICOLON letFunctionBody__star11
  ;
letFunctionBody__opt12:
  
  | expression
  ;
letFunctionBody__opt13:
  
  | SEMICOLON
  ;
declarePatternStatement__opt14:
  
  | declarePatternDefinition
  ;
declarePatternDefinition__opt15:
  
  | declarePatternPathParameter
  ;
declarePatternDefinition__plus16:
  declarePatternRule declarePatternDefinition__plus16
  | declarePatternRule
  ;
declarePatternParameterList__star17:
  
  | COMMA declarePatternParameter declarePatternParameterList__star17
  ;
declarePatternRule__opt18:
  
  | declarePatternRulePathArgument
  ;
declarePatternRule__opt19:
  
  | SEMICOLON
  ;
declarePatternRuleArgumentList__star20:
  
  | COMMA declarePatternRuleArgument declarePatternRuleArgumentList__star20
  ;
declarePatternBody__star21:
  
  | letFunctionBodyStatement SEMICOLON declarePatternBody__star21
  ;
restrictAccessStatement__star22:
  
  | COMMA restrictAccessStatementEntity restrictAccessStatement__star22
  ;
setStatement__opt23:
  
  | EQUAL setStatementOptionValue
  ;
declareQueryParametersStatement__star24:
  
  | COMMA declareQueryParametersStatementParameter declareQueryParametersStatement__star24
  ;
declareQueryParametersStatementParameter__opt25:
  
  | scalarParameterDefault
  ;
pipeExpression__star26:
  
  | pipedOperator pipeExpression__star26
  ;
pipeSubExpression__star27:
  
  | pipedOperator pipeSubExpression__star27
  ;
asOperator__star28:
  
  | relaxedQueryOperatorParameter asOperator__star28
  ;
consumeOperator__star29:
  
  | relaxedQueryOperatorParameter consumeOperator__star29
  ;
countOperator__star30:
  
  | relaxedQueryOperatorParameter countOperator__star30
  ;
distinctOperator__star31:
  
  | relaxedQueryOperatorParameter distinctOperator__star31
  ;
distinctOperatorColumnListTarget__star32:
  
  | COMMA namedExpression distinctOperatorColumnListTarget__star32
  ;
evaluateOperator__star33:
  
  | relaxedQueryOperatorParameter evaluateOperator__star33
  ;
evaluateOperator__opt34:
  
  | evaluateOperatorSchemaClause
  ;
extendOperator__star35:
  
  | COMMA namedExpression extendOperator__star35
  ;
facetByOperator__star36:
  
  | COMMA entityExpression facetByOperator__star36
  ;
facetByOperator__opt37:
  
  | facetByOperatorWithOperatorClause
  | facetByOperatorWithExpressionClause
  ;
findOperator__opt38:
  
  | dataScopeClause
  ;
findOperator__opt39:
  
  | findOperatorParametersWhereClause
  ;
findOperator__opt40:
  
  | findOperatorProjectClause
  | findOperatorProjectSmartClause
  ;
findOperator__opt41:
  
  | findOperatorProjectAwayClause
  ;
findOperatorParametersWhereClause__star42:
  
  | relaxedQueryOperatorParameter findOperatorParametersWhereClause__star42
  ;
findOperatorParametersWhereClause__opt43:
  
  | findOperatorInClause
  ;
findOperatorInClause__star44:
  
  | COMMA findOperatorSource findOperatorInClause__star44
  ;
findOperatorProjectClause__star45:
  
  | COMMA findOperatorProjectExpression findOperatorProjectClause__star45
  ;
findOperatorColumnExpression__opt46:
  
  | findOperatorOptionalColumnType
  ;
findOperatorProjectAwayColumnList__star47:
  
  | COMMA findOperatorColumnExpression findOperatorProjectAwayColumnList__star47
  ;
findOperatorSourceEntityExpression__star48:
  
  | BAR asOperator findOperatorSourceEntityExpression__star48
  ;
forkOperator__plus49:
  forkOperatorFork forkOperator__plus49
  | forkOperatorFork
  ;
forkOperatorFork__opt50:
  
  | forkOperatorExpressionName
  ;
forkOperatorExpression__star51:
  
  | forkOperatorPipedOperator forkOperatorExpression__star51
  ;
graphMarkComponentsOperator__star52:
  
  | relaxedQueryOperatorParameter graphMarkComponentsOperator__star52
  ;
graphMatchOperator__star53:
  
  | relaxedQueryOperatorParameter graphMatchOperator__star53
  ;
graphMatchOperator__star54:
  
  | COMMA graphMatchPattern graphMatchOperator__star54
  ;
graphMatchOperator__opt55:
  
  | graphMatchWhereClause
  ;
graphMatchOperator__opt56:
  
  | graphMatchProjectClause
  ;
graphMatchPatternNamedEdge__opt57:
  
  | graphMatchPatternRange
  ;
graphMatchProjectClause__star58:
  
  | COMMA namedExpression graphMatchProjectClause__star58
  ;
graphToTableOperator__star59:
  
  | COMMA graphToTableOutput graphToTableOperator__star59
  ;
graphToTableOutput__opt60:
  
  | graphToTableAsClause
  ;
graphToTableOutput__star61:
  
  | relaxedQueryOperatorParameter graphToTableOutput__star61
  ;
graphShortestPathsOperator__star62:
  
  | relaxedQueryOperatorParameter graphShortestPathsOperator__star62
  ;
graphShortestPathsOperator__star63:
  
  | COMMA graphMatchPattern graphShortestPathsOperator__star63
  ;
graphShortestPathsOperator__opt64:
  
  | graphMatchWhereClause
  ;
graphShortestPathsOperator__opt65:
  
  | graphMatchProjectClause
  ;
joinOperator__opt67:
  
  | joinOperatorOnClause
  | joinOperatorWhereClause
  ;
joinOperatorOnClause__star69:
  
  | COMMA unnamedExpression joinOperatorOnClause__star69
  ;
joinOperatorOnClause__opt68:
  
  | unnamedExpression joinOperatorOnClause__star69
  ;
lookupOperator__star70:
  
  | relaxedQueryOperatorParameter lookupOperator__star70
  ;
macroExpandOperator__star71:
  
  | relaxedQueryOperatorParameter macroExpandOperator__star71
  ;
macroExpandOperator__star72:
  
  | SEMICOLON statement macroExpandOperator__star72
  ;
macroExpandOperator__opt73:
  
  | SEMICOLON
  ;
entityGroupExpression__star74:
  
  | COMMA unnamedExpression entityGroupExpression__star74
  ;
makeGraphOperator__star75:
  
  | relaxedQueryOperatorParameter makeGraphOperator__star75
  ;
makeGraphOperator__opt76:
  
  | makeGraphIdClause
  | makeGraphTablesAndKeysClause
  ;
makeGraphOperator__opt77:
  
  | makeGraphPartitionedByClause
  ;
makeSeriesOperator__star78:
  
  | relaxedQueryOperatorParameter makeSeriesOperator__star78
  ;
makeSeriesOperator__star79:
  
  | COMMA makeSeriesOperatorAggregation makeSeriesOperator__star79
  ;
makeSeriesOperator__opt80:
  
  | makeSeriesOperatorByClause
  ;
makeSeriesOperatorAggregation__opt81:
  
  | makeSeriesOperatorExpressionDefaultClause
  ;
makeSeriesOperatorFromToStepClause__opt82:
  
  | FROM namedExpression
  ;
makeSeriesOperatorFromToStepClause__opt83:
  
  | TO namedExpression
  ;
makeSeriesOperatorByClause__star84:
  
  | COMMA namedExpression makeSeriesOperatorByClause__star84
  ;
mvapplyOperator__star85:
  
  | strictQueryOperatorParameter mvapplyOperator__star85
  ;
mvapplyOperator__star86:
  
  | COMMA mvapplyOperatorExpression mvapplyOperator__star86
  ;
mvapplyOperator__opt87:
  
  | mvapplyOperatorLimitClause
  ;
mvapplyOperator__opt88:
  
  | mvapplyOperatorIdClause
  ;
mvapplyOperatorExpression__opt89:
  
  | mvapplyOperatorExpressionToClause
  ;
mvexpandOperator__star90:
  
  | strictQueryOperatorParameter mvexpandOperator__star90
  ;
mvexpandOperator__star91:
  
  | COMMA mvexpandOperatorExpression mvexpandOperator__star91
  ;
mvexpandOperator__opt92:
  
  | mvapplyOperatorLimitClause
  ;
mvexpandOperatorExpression__opt93:
  
  | mvapplyOperatorExpressionToClause
  ;
parseOperator__opt94:
  
  | parseOperatorKindClause
  ;
parseOperatorKindClause__opt95:
  
  | parseOperatorFlagsClause
  ;
parseOperatorNameAndOptionalType__opt96:
  
  | COLON scalarType
  ;
parseOperatorPattern__opt97:
  
  | parseOperatorNameAndOptionalType
  ;
parseOperatorPattern__star98:
  
  | parseOperatorPatternSegment parseOperatorPattern__star98
  ;
parseOperatorPattern__opt99:
  
  | ASTERISK
  ;
parseOperatorPatternSegment__opt100:
  
  | ASTERISK
  ;
parseOperatorPatternSegment__opt101:
  
  | parseOperatorNameAndOptionalType
  ;
parseWhereOperator__opt102:
  
  | parseOperatorKindClause
  ;
parseKvOperator__opt103:
  
  | parseKvWithClause
  ;
parseKvWithClause__star104:
  
  | COMMA queryOperatorProperty parseKvWithClause__star104
  ;
partitionOperator__star105:
  
  | relaxedQueryOperatorParameter partitionOperator__star105
  ;
partitionOperator__opt106:
  
  | partitionOperatorInClause
  ;
partitionByOperator__star107:
  
  | relaxedQueryOperatorParameter partitionByOperator__star107
  ;
partitionByOperator__opt108:
  
  | partitionByOperatorIdClause
  ;
printOperator__star109:
  
  | COMMA namedExpression printOperator__star109
  ;
projectAwayOperator__star111:
  
  | COMMA simpleOrWildcardedNameReference projectAwayOperator__star111
  ;
projectAwayOperator__opt110:
  
  | simpleOrWildcardedNameReference projectAwayOperator__star111
  ;
projectKeepOperator__star112:
  
  | COMMA simpleOrWildcardedNameReference projectKeepOperator__star112
  ;
projectOperator__star114:
  
  | COMMA namedExpression projectOperator__star114
  ;
projectOperator__opt113:
  
  | namedExpression projectOperator__star114
  ;
projectRenameOperator__star116:
  
  | COMMA namedExpression projectRenameOperator__star116
  ;
projectRenameOperator__opt115:
  
  | namedExpression projectRenameOperator__star116
  ;
projectReorderOperator__star118:
  
  | COMMA projectReorderExpression projectReorderOperator__star118
  ;
projectReorderOperator__opt117:
  
  | projectReorderExpression projectReorderOperator__star118
  ;
projectReorderExpression__opt119:
  
  | ASC
  | DESC
  | GRANNYASC
  | GRANNYDESC
  ;
reduceByOperator__star120:
  
  | strictQueryOperatorParameter reduceByOperator__star120
  ;
reduceByOperator__opt121:
  
  | reduceByWithClause
  ;
reduceByWithClause__star122:
  
  | COMMA namedExpression reduceByWithClause__star122
  ;
renderOperator__opt123:
  
  | renderOperatorWithClause
  | renderOperatorLegacyPropertyList
  ;
renderOperatorWithClause__star125:
  
  | COMMA renderOperatorProperty renderOperatorWithClause__star125
  ;
renderOperatorWithClause__opt124:
  
  | renderOperatorProperty renderOperatorWithClause__star125
  ;
renderOperatorLegacyPropertyList__plus126:
  renderOperatorLegacyProperty renderOperatorLegacyPropertyList__plus126
  | renderOperatorLegacyProperty
  ;
renderPropertyNameList__star127:
  
  | COMMA extendedNameReference renderPropertyNameList__star127
  ;
sampleDistinctOperator__star128:
  
  | strictQueryOperatorParameter sampleDistinctOperator__star128
  ;
sampleOperator__star129:
  
  | strictQueryOperatorParameter sampleOperator__star129
  ;
scanOperator__star130:
  
  | relaxedQueryOperatorParameter scanOperator__star130
  ;
scanOperator__opt131:
  
  | scanOperatorOrderByClause
  ;
scanOperator__opt132:
  
  | scanOperatorPartitionByClause
  ;
scanOperator__opt133:
  
  | scanOperatorDeclareClause
  ;
scanOperator__plus134:
  scanOperatorStep scanOperator__plus134
  | scanOperatorStep
  ;
scanOperatorOrderByClause__star135:
  
  | COMMA orderedExpression scanOperatorOrderByClause__star135
  ;
scanOperatorPartitionByClause__star136:
  
  | COMMA unnamedExpression scanOperatorPartitionByClause__star136
  ;
scanOperatorDeclareClause__star137:
  
  | COMMA scalarParameter scanOperatorDeclareClause__star137
  ;
scanOperatorStep__opt138:
  
  | OPTIONAL
  ;
scanOperatorStep__opt139:
  
  | scanOperatorStepOutputClause
  ;
scanOperatorStep__opt140:
  
  | scanOperatorBody
  ;
scanOperatorBody__star141:
  
  | COMMA scanOperatorAssignment scanOperatorBody__star141
  ;
searchOperator__star142:
  
  | relaxedQueryOperatorParameter searchOperator__star142
  ;
searchOperator__opt143:
  
  | dataScopeClause
  ;
searchOperator__opt144:
  
  | searchOperatorInClause
  ;
searchOperatorInClause__star145:
  
  | COMMA findOperatorSource searchOperatorInClause__star145
  ;
serializeOperator__star146:
  
  | strictQueryOperatorParameter serializeOperator__star146
  ;
serializeOperator__star147:
  
  | COMMA namedExpression serializeOperator__star147
  ;
sortOperator__star148:
  
  | relaxedQueryOperatorParameter sortOperator__star148
  ;
sortOperator__star149:
  
  | COMMA orderedExpression sortOperator__star149
  ;
sortOrdering__opt150:
  
  | ASC
  | DESC
  ;
sortOrdering__opt151:
  
  | NULLS FIRST
  | NULLS LAST
  ;
summarizeOperator__star152:
  
  | strictQueryOperatorParameter summarizeOperator__star152
  ;
summarizeOperator__star154:
  
  | COMMA namedExpression summarizeOperator__star154
  ;
summarizeOperator__opt153:
  
  | namedExpression summarizeOperator__star154
  ;
summarizeOperator__opt155:
  
  | summarizeOperatorByClause
  ;
summarizeOperatorByClause__star156:
  
  | COMMA unnamedExpression summarizeOperatorByClause__star156
  ;
summarizeOperatorByClause__opt157:
  
  | summarizeOperatorLegacyBinClause
  ;
takeOperator__star158:
  
  | strictQueryOperatorParameter takeOperator__star158
  ;
topOperator__star159:
  
  | strictQueryOperatorParameter topOperator__star159
  ;
topHittersOperator__opt160:
  
  | topHittersOperatorByClause
  ;
topNestedOperator__star161:
  
  | COMMA topNestedOperatorPart topNestedOperator__star161
  ;
topNestedOperatorPart__opt162:
  
  | namedExpression
  ;
topNestedOperatorPart__opt163:
  
  | topNestedOperatorWithOthersClause
  ;
unionOperator__star164:
  
  | relaxedQueryOperatorParameter unionOperator__star164
  ;
unionOperator__star165:
  
  | COMMA unionOperatorExpression unionOperator__star165
  ;
whereOperator__star166:
  
  | strictQueryOperatorParameter whereOperator__star166
  ;
contextualPipeExpression__star167:
  
  | contextualPipeExpressionPipedOperator contextualPipeExpression__star167
  ;
namedExpression__opt168:
  
  | namedExpressionNameClause
  ;
namedExpressionNameList__star169:
  
  | COMMA identifierOrExtendedKeywordOrEscapedName namedExpressionNameList__star169
  ;
logicalOrExpression__star170:
  
  | logicalOrOperation logicalOrExpression__star170
  ;
logicalAndExpression__star171:
  
  | logicalAndOperation logicalAndExpression__star171
  ;
listEqualityExpression__star172:
  
  | COMMA invocationExpression listEqualityExpression__star172
  ;
relationalExpression__opt173:
  
  | LESSTHAN additiveExpression
  | GREATERTHAN additiveExpression
  | LESSTHAN_EQUAL additiveExpression
  | GREATERTHAN_EQUAL additiveExpression
  ;
additiveExpression__star174:
  
  | additiveOperation additiveExpression__star174
  ;
multiplicativeExpression__star175:
  
  | multiplicativeOperation multiplicativeExpression__star175
  ;
stringBinaryOperatorExpression__opt176:
  
  | stringBinaryOperation
  ;
invocationExpression__opt177:
  
  | PLUS
  | DASH
  ;
functionCallOrPathPathExpression__plus178:
  functionCallOrPathOperation functionCallOrPathPathExpression__plus178
  | functionCallOrPathOperation
  ;
toScalarExpression__opt179:
  
  | noOptimizationParameter
  ;
toTableExpression__opt180:
  
  | noOptimizationParameter
  ;
dotCompositeFunctionCallExpression__star181:
  
  | dotCompositeFunctionCallOperation dotCompositeFunctionCallExpression__star181
  ;
namedFunctionCallExpression__star183:
  
  | COMMA argumentExpression namedFunctionCallExpression__star183
  ;
namedFunctionCallExpression__opt182:
  
  | argumentExpression namedFunctionCallExpression__star183
  ;
countExpression__opt184:
  
  | namedExpression
  ;
nameReferenceWithDataScope__opt185:
  
  | dataScopeClause
  ;
entityPathOrElementExpression__plus186:
  entityPathOrElementOperator entityPathOrElementExpression__plus186
  | entityPathOrElementOperator
  ;
dataTableExpression__star187:
  
  | relaxedQueryOperatorParameter dataTableExpression__star187
  ;
dataTableExpression__opt188:
  
  | literalExpression
  ;
dataTableExpression__star189:
  
  | COMMA literalExpression dataTableExpression__star189
  ;
dataTableExpression__opt190:
  
  | COMMA
  ;
rowSchema__opt191:
  
  | rowSchemaColumnDeclaration
  ;
rowSchema__star192:
  
  | COMMA rowSchemaColumnDeclaration rowSchema__star192
  ;
rowSchema__opt193:
  
  | COMMA
  ;
externalDataExpression__star194:
  
  | relaxedQueryOperatorParameter externalDataExpression__star194
  ;
externalDataExpression__star195:
  
  | COMMA stringLiteralExpression externalDataExpression__star195
  ;
externalDataExpression__opt196:
  
  | externalDataWithClause
  ;
externalDataWithClause__star198:
  
  | COMMA externalDataWithClauseProperty externalDataWithClause__star198
  ;
externalDataWithClause__opt199:
  
  | COMMA
  ;
externalDataWithClause__opt197:
  
  | externalDataWithClauseProperty externalDataWithClause__star198 externalDataWithClause__opt199
  ;
wildcardedName__opt200:
  
  | wildcardedNamePrefix
  ;
wildcardedName__star201:
  
  | wildcardedNameSegment wildcardedName__star201
  ;
stringLiteralExpression__star202:
  
  | STRINGLITERAL stringLiteralExpression__star202
  ;
jsonObject__star204:
  
  | COMMA jsonPair jsonObject__star204
  ;
jsonObject__opt203:
  
  | jsonPair jsonObject__star204
  ;
jsonArray__star206:
  
  | COMMA jsonValue jsonArray__star206
  ;
jsonArray__opt205:
  
  | jsonValue jsonArray__star206
  ;
jsonString__star207:
  
  | STRINGLITERAL jsonString__star207
  ;
jsonLong__opt208:
  
  | DASH
  ;
jsonReal__opt209:
  
  | DASH
  ;
identifierCallName:
  IDENTIFIER_CALL
  ;
functionCallOrPathExpression__opt_path:
  
  | functionCallOrPathPathExpression__plus178
  ;
argumentExpression__opt_name:
  
  | EQUAL unnamedExpression
  ;
%%
