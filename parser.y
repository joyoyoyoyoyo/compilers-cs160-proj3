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
%token T_MODULO
%token T_EXP
%token T_OPENPAREN
%token T_CLOSEPAREN
%token T_NUMBER
%token T_SEMICOLON
%token T_NEWLN
%token T_EOF

%token T_EQUALEQ
%token T_EQUAL
%token T_ASSIGN
%token T_EQUIVALENCE
%token T_LESS_THAN
%token T_GREATER_THAN
%token T_LESS_OR_EQ
%token T_GREATER_OR_EQ

/* Reserved tokens */
%token T_PRINT
%token T_RETURN
%token T_IF
%token T_ELSE
%token T_WHILE
%token T_NEW
%token T_INTEGER
%token T_BOOL
%token T_NONE
%token T_EQUALS
%token T_AND
%token T_OR
%token T_NOT
%token T_TRUE
%token T_FALSE
%token T_EXTENDS
%token T_REPEAT
%token T_UNTIL


%token T_INTEGER
%token T_PLUS
%token T_MINUS
%token T_DIVIDE
%token T_MULT
%token T_OR
%token T_AND
%token T_LESS
%token T_EQUAL
%token T_EQUALEQ
%token T_LESSEQ
%token T_NOT
%token T_ID
%token T_OPEN_BRACKET
%token T_CLOSE_BRACKET
%token T_OPENPAREN
%token T_CLOSEPAREN
%token T_TRUE
%token T_FALSE
%token T_IF
%token T_SEMICOLON
%token T_ELSE
%token T_PRINT
%token T_FOR
%token T_NEW
%token T_INT
%token T_BOOL
%token T_NONE
%token T_DOTOP
%token T_EOF
%token T_COMMA
%token U_MINUS
%token T_COLON
%token T_RETURN
/* WRITEME: Specify precedence here */
%left T_OR
%left T_AND
%left T_LESS T_LESSEQ T_EQUALEQ
%left T_PLUS T_MINUS
%left T_MULT T_DIVIDE
%right T_NOT U_MINUS


%%

/* WRITEME: This rule is a placeholder, since Bison requires
            at least one rule to run successfully. Replace
            this with your appropriate start rules. */
Start :
      ;

/* WRITME: Write your Bison grammar specification here */
Classes : Classes Class | Class
;

Class : T_ID T_COLON T_ID T_OPEN_BRACKET Members Methods T_CLOSE_BRACKET
| T_ID T_OPEN_BRACKET Members Methods T_CLOSE_BRACKET
;

Members : Members Member |
;

Member : Type T_ID
;

Type : T_INT | T_BOOL | T_ID
;

Methods : Method Methods |
;

Method : T_ID T_OPENPAREN Args T_CLOSEPAREN T_COLON ReturnType T_OPEN_BRACKET Body T_CLOSE_BRACKET
;

Args : Arg |
;

Arg  : Arg T_COMMA Argument | Argument
;

Argument : Type T_ID
;

ReturnType : Type | T_NONE
;

Body : Declrs Stmnts Return
;

Declrs : Declrs Type Declr |
;

Declr : Declr T_COMMA T_ID | T_ID
;

Stmnts : Stmnt Stmnts |
;

Stmnt  : Assignment | MethodCall | IFELSE | FORLOOP | T_PRINT Exp
;

Assignment : T_ID T_EQUAL Exp
;

IFELSE : T_IF Exp T_OPEN_BRACKET Block T_CLOSE_BRACKET
| T_IF Exp T_OPEN_BRACKET Block T_CLOSE_BRACKET T_ELSE T_OPEN_BRACKET Block T_CLOSE_BRACKET
;

FORLOOP : T_FOR Assignment T_SEMICOLON Exp T_SEMICOLON Assignment T_OPEN_BRACKET Block T_CLOSE_BRACKET
;

Block : Block Stmnt | Stmnt
;

Return : T_RETURN Exp |
;

Exp : Exp T_PLUS Exp | Exp T_MINUS Exp | Exp T_MULT Exp | Exp T_DIVIDE Exp
| Exp T_LESS Exp | Exp T_LESSEQ Exp | Exp T_EQUALEQ Exp | Exp T_AND Exp | Exp T_OR Exp
| T_NOT Exp | T_MINUS Exp %prec U_MINUS | T_ID | T_ID T_DOTOP T_ID
| MethodCall | T_OPENPAREN Exp T_CLOSEPAREN | T_INTEGER | T_TRUE | T_FALSE
| T_NEW T_ID | T_NEW T_ID T_OPENPAREN Params T_CLOSEPAREN
;

MethodCall : T_ID T_OPENPAREN Params T_CLOSEPAREN | T_ID T_DOTOP T_ID T_OPENPAREN Params T_CLOSEPAREN
;

Params : Params_P |
;

Params_P : Params_P T_COMMA Exp | Exp
;

%%

extern int yylineno;

void yyerror(const char *s) {
  fprintf(stderr, "%s at line %d\n", s, yylineno);
  exit(1);
}
