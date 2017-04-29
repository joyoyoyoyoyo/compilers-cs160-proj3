/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

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
    T_MODULO = 262,
    T_EXP = 263,
    T_OPENPAREN = 264,
    T_CLOSEPAREN = 265,
    T_NUMBER = 266,
    T_SEMICOLON = 267,
    T_NEWLN = 268,
    T_EOF = 269,
    T_EQUALEQ = 270,
    T_EQUAL = 271,
    T_ASSIGN = 272,
    T_EQUIVALENCE = 273,
    T_LESS_THAN = 274,
    T_GREATER_THAN = 275,
    T_LESS_OR_EQ = 276,
    T_GREATER_OR_EQ = 277,
    T_PRINT = 278,
    T_RETURN = 279,
    T_IF = 280,
    T_ELSE = 281,
    T_WHILE = 282,
    T_NEW = 283,
    T_INTEGER = 284,
    T_BOOL = 285,
    T_NONE = 286,
    T_EQUALS = 287,
    T_AND = 288,
    T_OR = 289,
    T_NOT = 290,
    T_TRUE = 291,
    T_FALSE = 292,
    T_EXTENDS = 293,
    T_REPEAT = 294,
    T_UNTIL = 295,
    T_MULT = 296,
    T_LESS = 297,
    T_LESSEQ = 298,
    T_ID = 299,
    T_OPEN_BRACKET = 300,
    T_CLOSE_BRACKET = 301,
    T_FOR = 302,
    T_INT = 303,
    T_DOTOP = 304,
    T_COMMA = 305,
    U_MINUS = 306,
    T_COLON = 307
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
