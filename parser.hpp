/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_PARSER_HPP_INCLUDED
# define YY_YY_PARSER_HPP_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    T_PLUS = 258,
    T_MINUS = 259,
    T_MULTIPLY = 260,
    T_DIVIDE = 261,
    T_LSS = 262,
    T_LEQ = 263,
    T_EQUIVALENCE = 264,
    T_AND = 265,
    T_OR = 266,
    T_NOT = 267,
    T_ASSIGN = 268,
    T_ID = 269,
    T_OPENPAREN = 270,
    T_CLOSEPAREN = 271,
    T_OPEN_BRACKET = 272,
    T_CLOSE_BRACKET = 273,
    T_INTEGER = 274,
    T_NUMBER = 275,
    T_TRUE = 276,
    T_FALSE = 277,
    T_SEMICOLON = 278,
    T_NEWLN = 279,
    T_EOF = 280,
    T_NONE = 281,
    T_PRINT = 282,
    T_RETURN = 283,
    T_IF = 284,
    T_ELSE = 285,
    T_WHILE = 286,
    T_NEW = 287,
    T_BOOL = 288,
    T_EXTENDS = 289,
    T_REPEAT = 290,
    T_UNTIL = 291,
    T_FOR = 292,
    T_DOT = 293,
    T_COMMA = 294,
    T_UNARY = 295,
    T_LAMBDA = 296,
    T_COLON = 297
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER_HPP_INCLUDED  */
