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

/* WRITEME: Write any definitions here. You can find information on
            definitions here:
            ftp://ftp.gnu.org/old-gnu/Manuals/flex-2.5.4/html_mono/flex.html#SEC10 */

/* WRITEME: If you are going to use start conditions, write them here.
            You can find more information on start conditions here:
            ftp://ftp.gnu.org/old-gnu/Manuals/flex-2.5.4/html_mono/flex.html#SEC11
            You will probably want to use exclusive conditions rather
            than inclusive conditions (use the %x instead of the %s). */
%x COMMENT

%%

  /* WRITEME: Write your Flex token rules here */
<INITIAL>"/*"     { BEGIN(COMMENT); }
<COMMENT>[^*\n]*     ;
<COMMENT>"*"+[^*/\n]* ;
<COMMENT>"\n"     ;
<COMMENT><<EOF>>  { yyerror("dangling comment"); }
<COMMENT>"*/"     { BEGIN(INITIAL); }

<<EOF>>          {return 0;}
[a-zA-Z][a-zA-Z0-9]* {return T_ID;}
[ \r\t\n]       {}

"{" {return T_OPEN_BRACKET;}
"}" {return T_CLOSE_BRACKET;}
"," {return T_COMMA;}
":" {return T_COLON;}
"=" {return T_EQUAL;}
"=="    {return T_EQUALEQ;}
"<"     {return T_LESS_THAN;}
">"     {return T_GREATER_THAN;}
"<="    {return T_LESS_OR_EQ;}
">="    {return T_GREATER_OR_EQ;}
"+"         {return T_PLUS; }
"-"         {return T_MINUS;}
"*"         {return T_MULTIPLY;}
"/"         {return T_DIVIDE;}
"%"         {return T_MODULO;}
"**"        {return T_EXP;}
"("         {return T_OPENPAREN;}
")"         {return T_CLOSEPAREN;}
[0-9]+      {return T_NUMBER;}
[0-9]+      {return T_INTEGER;}
";"         {return T_SEMICOLON;}
"."         {return T_DOTOP;}

        /* Reserved keywords */
"print"   {return T_PRINT;}
"if"      {return T_IF;}
"else"    {return T_ELSE;}
"while"   {return T_WHILE;}
"new"     {return T_NEW;}
"integer" {return T_INTEGER;}
"boolean" {return T_BOOL;}
"none"    {return T_NONE;}
"equals"  {return T_EQUALS;}
"and"     {return T_AND;}
"or"      {return T_OR;}
"not"     {return T_NOT;}
"true"    {return T_TRUE;}
"false"   {return T_FALSE;}
"extends" {return T_EXTENDS;}
"repeat"  {return T_REPEAT;}
"until"   {return T_UNTIL;}
.         { yyerror("invalid character"); }

%%

int yywrap(void) {
  return 1;
}
