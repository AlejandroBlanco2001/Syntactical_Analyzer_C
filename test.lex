%{
// Definitons, can be accessed inside yylex() and main()
#include <stdio.h>
#include <string.h>
int number_id = 0;
int number_errors = 0;
%}

/* regular definitions */
D		[0-9]
L		[a-zA-Z]
AF      [a-zA-Z0-9\s]
EXPO    [Ee][\+\-]?([2-9]|([1-9]D+))
EN      [\+\-]?[1-9]{D}*{EXPO}?
DEC     \.{D}+
RE      [\+\-]?([1-9]{D}*|0){DEC}{EXPO}?
CA      \"{AF}*\"
CH      \'({D}|{L})\'

%%
[ \t] {/* Just ignore whitespaces*/}
"main"          {  printf("MAIN \n"); }
"auto"			{  printf("AUTO "); }
"break"			{  printf("BREAK "); }
"case"			{  printf("CASE "); }
"char"			{  printf("CHAR "); }
"const"			{  printf("CONST "); }
"continue"		{  printf("CONTINUE "); }
"default"		{  printf("DEFAULT "); }
"do"			{  printf("DO "); }
"double"		{  printf("DOUBLE "); }
"else"			{  printf("ELSE "); }
"enum"			{  printf("ENUM "); }
"extern"		{  printf("EXTERN "); }
"float"			{  printf("FLOAT "); }
"for"			{  printf("FOR "); }
"goto"			{  printf("GOTO "); }
"if"			{  printf("IF "); }
"int"			{  printf("INT "); }
"long"			{  printf("LONG "); }
"register"		{  printf("REGISTER "); }
"printf"		{  printf("PRINTF "); }
"scanf"         {  printf("SCANF "); }
"short"			{  printf("SHORT "); }
"signed"		{  printf("SIGNED "); }
"sizeof"		{  printf("SIZEOF "); }
"static"		{  printf("STATIC "); }
"struct"		{  printf("STRUCT "); }
"switch"		{  printf("SWITCH "); }
"typedef"		{  printf("TYPEDEF "); }
"union"			{  printf("UNION "); }
"unsigned"		{  printf("UNSIGNED "); }
"void"			{  printf("VOID "); }
"volatile"		{  printf("VOLATILE "); }
"while"			{  printf("WHILE "); }
"*"				   printf("op-mult= %s", yytext);
"+"				   printf("op-sum= %s ", yytext);
"-"				   printf("op-sust= %s ", yytext);
"/"				   printf("op-div= %s ", yytext);
"%"				   printf("op-mod= %s ", yytext);
"="				   printf("op-asig= %s ", yytext);
";"				   printf("Punto-coma= %s ", yytext);
"("				   printf("Parent-a= %s ", yytext);
")"				   printf("Parent-c= %s ", yytext);
","                printf("coma= %s ", yytext);
"{"                printf("Inicio= %s ", yytext);
"}"                printf("Fin= %s ", yytext);
"|"                printf("op-or= %s ", yytext);
"!"                printf("op-neg= %s ", yytext);
">="               printf("op-maq= %s ", yytext);
">"                printf("op-may= %s ", yytext);
"<="			   printf("op-meq= %s ", yytext);
"<"                printf("op-men= %s ", yytext);
"!="               printf("op-dist= %s ", yytext);
"&&"               printf("op-and= %s ", yytext);
"=="			   printf("op-igu= %s ", yytext);
{CH}			   printf("Cte-cara= %s ", yytext);
{CA}			   printf("Cte-cade= %s ", yytext);
{RE}			   printf("Cte-real= %s ", yytext);
{EN}			   printf("Cte-ent= %s ", yytext);
.				   printf("", yytext);
%%

int yywrap(){}

int main(int argc, char* argv[])
{
	if (argc > 1)
	{
		FILE *fp = fopen(argv[1], "r");
		if(fp)
		{
			yyin = fp;
		}
	}
	yylex();
	printf("Hay un total de %d identificadores ", number_id); 
	return 0;
}
