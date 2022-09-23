%{
// Definitons, can be accessed inside yylex() and main()
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include "Node.h"

Node *head_errors;
Node *head_id;
int number_id = 0;
int number_errors = 0;
%}

/* regular definitions */
D		[0-9]
L	    [a-zA-Z]
SYM     [\~\!\#\$\%\^\&\*\(\)\+\,\.\/\|\\\'\-\=\<\>\?\{\}\[\]\:\"\;]
SPACE   " "
EXPO    [Ee][\+\-]?([2-9]|([1-9]D+))
EN      [\+\-]?[1-9]{D}*{EXPO}?
DEC     \.{D}+
RE      [\+\-]?([1-9]{D}*|0){DEC}{EXPO}?[lf]?
CA      \".*\"
CH      \'.\'
VAR     ({L}|_)({D}|{L}|\_)*
WR_VAR  {D}+({D}|{L})+

%%
"\n"               printf("\n");
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
{VAR}			   { printf("Id= %s ", yytext); number_id = append(head_id,number_id); }
{WR_VAR}		   { printf("Id= %s ", yytext); number_errors = append(head_errors,number_errors); }
.				   printf("");
%%

int yywrap(){}

int append(Node *head, int cantidad)
{	
	Node *temp = NULL;
	temp = (Node*)malloc(sizeof(Node));
	Node *p = head;
	while(p->next != NULL)
	{
		if(strcmp(p->text,yytext) == 0)
		{
			return cantidad;
		}
		p = p->next;
	}
	if(strcmp(p->text,yytext) == 0)
	{
		return cantidad;
	}
	p->next = temp;
	temp->next = NULL;
	strcpy(temp->text,yytext);
	return cantidad + 1;
}

void printList(Node *head){
	Node *p = head->next;
	while(p != NULL)
	{
		printf("Id= %s;  ", p->text);
		p = p->next;
	}
	printf("\n");
}

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
	head_id = (Node*)malloc(sizeof(Node));
    head_errors = (Node*)malloc(sizeof(Node));
	yylex();
	printList(head_id);
	printf("Hay un total de %d identificadores \n", number_id);
	printList(head_errors);
	printf("Hay un total de %d errores lexicos \n", number_errors);
	return 0;
}
