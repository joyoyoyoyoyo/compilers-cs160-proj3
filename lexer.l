%option yylineno
%pointer

%{
    #include <cstdlib>
    #include <cerrno>
    #include <climits>
    #include <limits>
    #include "parser.hpp"
    
	void yyerror(const char *);
%}

%x COMMENT

%%
        int lineNumbers = 1;

"/*"                    { BEGIN(COMMENT); }
<COMMENT>[^*\n]*
<COMMENT>"*"+[^*/\n]*
<COMMENT>\n             lineNumbers++;
<COMMENT>"*"+"/"        { BEGIN(INITIAL); }


[ \r\t\n]+              ;
","                     {return T_COMMA;}
"->"                    {return T_LAMBDA;}
":"                     {return T_COLON;}
"="                     {return T_ASSIGN;}
"+"                     {return T_PLUS; }
"-"                     {return T_MINUS;}
"*"                     {return T_MULTIPLY;}
"/"                     {return T_DIVIDE;}
"<"                     {return T_LSS;}
"<="                    {return T_LEQ;}
"and"                   {return T_AND;}
"or"                    {return T_OR;}
"not"                   {return T_NOT;}
[0-9]+                  {return T_NUMBER;}
"."                     {return T_DOT;}
"("                     {return T_OPENPAREN;}
")"                     {return T_CLOSEPAREN;}
"{"                     {return T_OPEN_BRACKET;}
"}"                     {return T_CLOSE_BRACKET;}
"integer"               {return T_INTEGER;}
"true"                  {return T_TRUE;}
"false"                 {return T_FALSE;}
"boolean"               {return T_BOOL;}
"new"                   {return T_NEW;}
";"                     {return T_SEMICOLON;}

        /* Reserved keywords */
"print"                 {return T_PRINT;}
"equals"                {return T_EQUIVALENCE;}
"if"                    {return T_IF;}
"else"                  {return T_ELSE;}
"while"                 {return T_WHILE;}
"none"                  {return T_NONE;}
"extends"               {return T_EXTENDS;}
"repeat"                {return T_REPEAT;}
"until"                 {return T_UNTIL;}
"return"[ \r\t\n]+      {return T_RETURN;}
[a-zA-Z][a-zA-Z0-9]*    {return T_ID;}

.                       { yyerror("invalid character"); }


%%

int yywrap(void) {
  return 1;
}
