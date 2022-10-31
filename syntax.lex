%{
// Definitons, can be accessed inside yylex() and main()
	#include "y.tab.h"
	int countn=0;
%}

%option yylineno

/* regular definitions */
D		[0-9]
L	    [a-zA-Z]
unary   "++"|"--"
SYM     [$@:!#]
SPACE   " "
EXPO    [Ee][\+\-]?([2-9]|([1-9]D+))
EN      [\+\-]?[1-9]{D}*{EXPO}?
DEC     \.{D}+
RE      [\+\-]?([1-9]{D}*|0){DEC}{EXPO}?[lf]?
CA      \".*\"
CH      \'.\'
VAR     ({L}|_)({D}|{L}|_)*
WR_VAR  ({D}+({D}|{L})+)|({D}+,[{D}{L}])|({SYM}{VAR})|({VAR}{SYM}+[{SYM}{D}{L}]*)

%%
[\n]			{ yylineno = yylineno + 1;} // Count the number of lines 
"main"          {return(MAIN);}
"auto"			{return(AUTO);}
"break"			{return(BREAK);}
"case"			{return(CASE);}
"char"			{return(CHAR);}
"const"			{return(CONST);}
"continue"		{return(CONTINUE);}
"default"		{return(DEFAULT);}
"do"			{return(DO);}
"double"		{return(DOUBLE);}
"else"			{return(ELSE);}
"enum"			{return(ENUM);}
"extern"		{return(EXTERN);}
"float"			{return(FLOAT);}
"for"			{return(FOR);}
"goto"			{return(GOTO);}
"if"			{return(IF);}
"int"			{return(INT);}
"long"			{return(LONG);}
"register"		{return(REGISTER);}
"printf"		{return(PRINTF);}
"scanf"         {return(SCANF);}
"short"			{return(SHORT);}
"signed"		{return(SIGNED);}
"sizeof"		{return(SIZEOF);}
"static"		{return(STATIC);}
"struct"		{return(STRUCT);}
"switch"		{return(SWITCH);}
"union"			{return(UNION);}
"unsigned"		{return(UNSIGNED);}
"void"			{return(VOID);}
"volatile"		{return(VOLATILE);}
"while"			{return(WHILE);}
^"#include"[ ]*<.+\.h>      {return(INCLUDE);}
"true"          {return(TRUE);}
"false"         {return(FALSE);}
"return"        {return(RETURN);}
"*"				{return(OP_MULT);}
"+"				{return(OP_SUMA);}
"-"				{return(OP_SUS);}
"/"				{return(OP_DIV);}
"%"				{return(OP_MOD);}
"="				{return(OP_ASIG);}
";"				{return(PUNTO_COMA);}
"("				{return(PARENT_A);}
")"				{return(PARENT_C);}
","             {return(COMA);}
"{"             {return(INICIO);}
"}"             {return(FIN);}
"|"             {return(OP_O);}
"!"             {return(OP_NO);}
"+="            {return(OP_INCRE_SUM);}
"*="            {return(OP_INCRE_MULT);}
"-="            {return(OP_INCRE_SUST);}
"/="            {return(OP_INCRE_DIV);}
">="            {return(OP_MAYOR_IGUAL);}
">"             {return(OP_MAYOR);}
"<="			{return(OP_MENOR_IGUAL);}
"<"             {return(OP_MENOR);}
"!="            {return(OP_DIST);}
"&&"            {return(OP_Y);}
"=="			{return(OP_IGUAL);}
{unary}         {return(UNARY);}
{CH}			{return(CHAR);}
{CA}			{return(STRING);}
{RE}			{return(FLOAT);}
{EN}			{return(INT);}
{VAR}			{return(ID);}
[ \t]*          { ; } // Ignore tabs
\/\/.*          { ; } // Ignore single line comments 
%%

int yywrap() {
    return 1;
}
