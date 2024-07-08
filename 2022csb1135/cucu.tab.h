/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     INT = 258,
     CHAR = 259,
     ASSIGN = 260,
     IDENT = 261,
     NUM = 262,
     PLUS = 263,
     MINUS = 264,
     DIV = 265,
     MUL = 266,
     WHILE = 267,
     IF = 268,
     LEFT_BRACKET = 269,
     RIGHT_BRACKET = 270,
     LEFT_CURLY = 271,
     RIGHT_CURLY = 272,
     STRING = 273,
     COMMA = 274,
     SEMI = 275,
     ELSE = 276,
     RET = 277,
     COMP_EQUAL = 278,
     COMP_NOT_EQUAL = 279,
     LEFT_SQBRAC = 280,
     RIGHT_SQBRAC = 281,
     LESS_THAN_EQUAL = 282,
     GREATER_THAN_EQUAL = 283,
     TRUE = 284,
     FALSE = 285
   };
#endif
/* Tokens.  */
#define INT 258
#define CHAR 259
#define ASSIGN 260
#define IDENT 261
#define NUM 262
#define PLUS 263
#define MINUS 264
#define DIV 265
#define MUL 266
#define WHILE 267
#define IF 268
#define LEFT_BRACKET 269
#define RIGHT_BRACKET 270
#define LEFT_CURLY 271
#define RIGHT_CURLY 272
#define STRING 273
#define COMMA 274
#define SEMI 275
#define ELSE 276
#define RET 277
#define COMP_EQUAL 278
#define COMP_NOT_EQUAL 279
#define LEFT_SQBRAC 280
#define RIGHT_SQBRAC 281
#define LESS_THAN_EQUAL 282
#define GREATER_THAN_EQUAL 283
#define TRUE 284
#define FALSE 285




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 11 "cucu.y"
{
    int num;
    char *string;
}
/* Line 1529 of yacc.c.  */
#line 114 "cucu.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

