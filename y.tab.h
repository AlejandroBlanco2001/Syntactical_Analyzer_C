/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    MAIN = 258,                    /* MAIN  */
    INCLUDE = 259,                 /* INCLUDE  */
    UNARY = 260,                   /* UNARY  */
    RETURN = 261,                  /* RETURN  */
    AUTO = 262,                    /* AUTO  */
    BREAK = 263,                   /* BREAK  */
    CASE = 264,                    /* CASE  */
    CHAR = 265,                    /* CHAR  */
    CONST = 266,                   /* CONST  */
    CONTINUE = 267,                /* CONTINUE  */
    DEFAULT = 268,                 /* DEFAULT  */
    DO = 269,                      /* DO  */
    DOUBLE = 270,                  /* DOUBLE  */
    ELSE = 271,                    /* ELSE  */
    ENUM = 272,                    /* ENUM  */
    EXTERN = 273,                  /* EXTERN  */
    FLOAT = 274,                   /* FLOAT  */
    FOR = 275,                     /* FOR  */
    GOTO = 276,                    /* GOTO  */
    IF = 277,                      /* IF  */
    INT = 278,                     /* INT  */
    LONG = 279,                    /* LONG  */
    REGISTER = 280,                /* REGISTER  */
    PRINTF = 281,                  /* PRINTF  */
    SCANF = 282,                   /* SCANF  */
    SHORT = 283,                   /* SHORT  */
    SIGNED = 284,                  /* SIGNED  */
    SIZEOF = 285,                  /* SIZEOF  */
    STATIC = 286,                  /* STATIC  */
    STRUCT = 287,                  /* STRUCT  */
    SWITCH = 288,                  /* SWITCH  */
    UNION = 289,                   /* UNION  */
    UNSIGNED = 290,                /* UNSIGNED  */
    VOID = 291,                    /* VOID  */
    VOLATILE = 292,                /* VOLATILE  */
    WHILE = 293,                   /* WHILE  */
    OP_MULT = 294,                 /* OP_MULT  */
    OP_SUMA = 295,                 /* OP_SUMA  */
    OP_SUS = 296,                  /* OP_SUS  */
    OP_DIV = 297,                  /* OP_DIV  */
    OP_MOD = 298,                  /* OP_MOD  */
    OP_ASIG = 299,                 /* OP_ASIG  */
    PUNTO_COMA = 300,              /* PUNTO_COMA  */
    PARENT_A = 301,                /* PARENT_A  */
    PARENT_C = 302,                /* PARENT_C  */
    COMA = 303,                    /* COMA  */
    INICIO = 304,                  /* INICIO  */
    FIN = 305,                     /* FIN  */
    OP_O = 306,                    /* OP_O  */
    OP_NO = 307,                   /* OP_NO  */
    OP_MAYOR_IGUAL = 308,          /* OP_MAYOR_IGUAL  */
    OP_MAYOR = 309,                /* OP_MAYOR  */
    OP_MENOR_IGUAL = 310,          /* OP_MENOR_IGUAL  */
    OP_MENOR = 311,                /* OP_MENOR  */
    OP_DIST = 312,                 /* OP_DIST  */
    OP_Y = 313,                    /* OP_Y  */
    OP_IGUAL = 314,                /* OP_IGUAL  */
    CHARACTER = 315,               /* CHARACTER  */
    STRING = 316,                  /* STRING  */
    FLOAT_NUMBER = 317,            /* FLOAT_NUMBER  */
    INTEGER = 318,                 /* INTEGER  */
    ID = 319,                      /* ID  */
    TRUE = 320,                    /* TRUE  */
    FALSE = 321,                   /* FALSE  */
    OP_INCRE_SUM = 322,            /* OP_INCRE_SUM  */
    OP_INCRE_MULT = 323,           /* OP_INCRE_MULT  */
    OP_INCRE_DIV = 324,            /* OP_INCRE_DIV  */
    OP_INCRE_SUST = 325            /* OP_INCRE_SUST  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define MAIN 258
#define INCLUDE 259
#define UNARY 260
#define RETURN 261
#define AUTO 262
#define BREAK 263
#define CASE 264
#define CHAR 265
#define CONST 266
#define CONTINUE 267
#define DEFAULT 268
#define DO 269
#define DOUBLE 270
#define ELSE 271
#define ENUM 272
#define EXTERN 273
#define FLOAT 274
#define FOR 275
#define GOTO 276
#define IF 277
#define INT 278
#define LONG 279
#define REGISTER 280
#define PRINTF 281
#define SCANF 282
#define SHORT 283
#define SIGNED 284
#define SIZEOF 285
#define STATIC 286
#define STRUCT 287
#define SWITCH 288
#define UNION 289
#define UNSIGNED 290
#define VOID 291
#define VOLATILE 292
#define WHILE 293
#define OP_MULT 294
#define OP_SUMA 295
#define OP_SUS 296
#define OP_DIV 297
#define OP_MOD 298
#define OP_ASIG 299
#define PUNTO_COMA 300
#define PARENT_A 301
#define PARENT_C 302
#define COMA 303
#define INICIO 304
#define FIN 305
#define OP_O 306
#define OP_NO 307
#define OP_MAYOR_IGUAL 308
#define OP_MAYOR 309
#define OP_MENOR_IGUAL 310
#define OP_MENOR 311
#define OP_DIST 312
#define OP_Y 313
#define OP_IGUAL 314
#define CHARACTER 315
#define STRING 316
#define FLOAT_NUMBER 317
#define INTEGER 318
#define ID 319
#define TRUE 320
#define FALSE 321
#define OP_INCRE_SUM 322
#define OP_INCRE_MULT 323
#define OP_INCRE_DIV 324
#define OP_INCRE_SUST 325

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
