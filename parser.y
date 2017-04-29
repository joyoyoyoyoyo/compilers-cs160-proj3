%{
    #include <cstdlib>
    #include <cstdio>
    #include <iostream>

    #define YYDEBUG 1

    int yylex(void);
    void yyerror(const char *);
%}

%error-verbose

/* WRITEME: List all your tokens here */
%token T_PLUS
%token T_MINUS
%token T_MULTIPLY
%token T_DIVIDE
%token T_LSS
%token T_LEQ
%token T_EQUIVALENCE
%token T_AND
%token T_OR
%token T_NOT

%token T_ID


%token T_OPENPAREN
%token T_CLOSEPAREN
%token T_OPEN_BRACKET
%token T_CLOSE_BRACKET
%token T_INTEGER
%token T_NUMBER
%token T_TRUE
%token T_FALSE
%token T_SEMICOLON
%token T_NEWLN
%token T_EOF
%token T_ASSIGN

%token T_NONE


/* Reserved tokens */
%token T_PRINT
%token T_RETURN
%token T_IF
%token T_ELSE
%token T_WHILE
%token T_NEW
%token T_BOOL

%token T_EXTENDS
%token T_REPEAT
%token T_UNTIL
%token T_FOR
%token T_DOT
%token T_COMMA
%token T_UNARY
%token T_LAMBDA
%token T_COLON
/* WRITEME: Specify precedence here */
%left T_OR
%left T_AND
%left T_LSS T_LEQ T_EQUIVALENCE
%left T_PLUS T_MINUS
%left T_MULTIPLY T_DIVIDE
%right T_NOT T_UNARY


%%

/* WRITEME: This rule is a placeholder, since Bison requires
            at least one rule to run successfully. Replace
            this with your appropriate start rules. */
Start : Classes
      ;

/* WRITME: Write your Bison grammar specification here */
Classes : Classes ClassName | ClassName
;


ClassName   : T_ID T_OPEN_BRACKET T_CLOSE_BRACKET T_SEMICOLON
            | T_ID T_OPEN_BRACKET InnerScopeClass T_CLOSE_BRACKET T_SEMICOLON
            | T_ID T_EXTENDS T_ID T_OPEN_BRACKET T_CLOSE_BRACKET T_SEMICOLON
            | T_ID T_EXTENDS T_ID T_OPEN_BRACKET InnerScopeClass T_CLOSE_BRACKET T_SEMICOLON
            ;

InnerScopeClass :   ClassMembers ClassMethods
                ;

ClassMembers    :   Type T_ID T_SEMICOLON ClassMembers
                |   Type T_ID T_SEMICOLON
                |
                ;

ClassMethods    :   MethodName ClassMethods
                |   MethodName
                |
                ;

Parameters      : Parameters T_COMMA Parameter
                | Parameter
                ;

Parameter       : T_ID T_COLON Type
                ;

ParameterSeq    : T_COMMA T_ID T_COLON Type ParameterSeq
                | T_COMMA T_ID T_COLON Type
                |
                ;

MethodName      : T_ID T_OPENPAREN Parameters T_CLOSEPAREN T_LAMBDA ReturnType T_OPEN_BRACKET InnerScopeMethod T_CLOSE_BRACKET
                | T_ID T_OPENPAREN Parameters T_CLOSEPAREN T_LAMBDA ReturnType T_OPEN_BRACKET T_CLOSE_BRACKET
                | T_ID T_OPENPAREN T_CLOSEPAREN T_LAMBDA ReturnType T_OPEN_BRACKET InnerScopeMethod T_CLOSE_BRACKET
                | T_ID T_OPENPAREN T_CLOSEPAREN T_LAMBDA ReturnType T_OPEN_BRACKET T_CLOSE_BRACKET

                ;


InnerScopeMethod: Declarations Statements ReturnStatement
                | Declarations Statements
                | Statements
                |
                ;



Declarations    : ClassMembers
                |
                ;

Statements      : Statements Statement
                | Statement
                |
                ;

Statement       : Assignment
                | MethodCall
                | IfElse
                | While
                | RepeatUntil
                | Print

Assignment      : Type T_ASSIGN Exp T_SEMICOLON
                | T_ID T_DOT T_ID T_ASSIGN Exp T_SEMICOLON
                |
                ;

MethodCall      : T_ID T_OPENPAREN Parameters T_CLOSEPAREN T_SEMICOLON
                | T_ID T_OPENPAREN T_CLOSEPAREN T_SEMICOLON
                | T_ID T_DOT T_ID T_OPENPAREN Parameters T_CLOSEPAREN T_SEMICOLON
                | T_ID T_DOT T_ID T_OPENPAREN T_CLOSEPAREN T_SEMICOLON
                |
                ;

IfElse          : T_IF Exp T_OPEN_BRACKET Block T_CLOSE_BRACKET
                | T_IF Exp T_OPEN_BRACKET T_CLOSE_BRACKET
                | T_IF Exp T_OPEN_BRACKET Block T_CLOSE_BRACKET T_ELSE T_OPEN_BRACKET Block T_CLOSE_BRACKET
                | T_IF Exp T_OPEN_BRACKET T_CLOSE_BRACKET T_ELSE T_OPEN_BRACKET T_CLOSE_BRACKET
                ;


While           : T_WHILE Exp T_OPEN_BRACKET Block T_CLOSE_BRACKET
                | T_WHILE Exp T_OPEN_BRACKET T_CLOSE_BRACKET
                ;

RepeatUntil     : T_REPEAT T_OPEN_BRACKET Block T_CLOSE_BRACKET T_UNTIL T_OPENPAREN Exp T_SEMICOLON
                | T_REPEAT T_OPEN_BRACKET T_CLOSE_BRACKET T_UNTIL T_OPENPAREN Exp T_SEMICOLON

Print           : T_PRINT Exp T_SEMICOLON
                ;

Block           : Block Statement Exp T_SEMICOLON
                | Statement Exp T_SEMICOLON
                ;

ReturnStatement : T_RETURN Exp T_SEMICOLON
                |
                ;



Type : T_INTEGER | T_BOOL | T_ID
;


ReturnType : Type | T_NONE
;








Exp : Exp T_PLUS Exp | Exp T_MINUS Exp | Exp T_MULTIPLY Exp | Exp T_DIVIDE Exp
| Exp T_LSS Exp | Exp T_LEQ Exp | Exp T_EQUIVALENCE Exp | Exp T_AND Exp | Exp T_OR Exp
| T_NOT Exp | T_MINUS Exp %prec T_UNARY | T_ID | T_ID T_DOT T_ID
| MethodCall | T_OPENPAREN Exp T_CLOSEPAREN | T_NUMBER | T_TRUE | T_FALSE
| T_NEW T_ID | T_NEW T_ID T_OPENPAREN Parameters T_CLOSEPAREN
;


%%

extern int yylineno;

void yyerror(const char *s) {
  fprintf(stderr, "%s at line %d\n", s, yylineno);
  exit(1);
}
