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

\/\/(.*)           ;
"\n"               fprintf(yyout,"\n");
[ \t] {/* Just ignore whitespaces*/}
"main"          {  fprintf(yyout,"MAIN \n"); }
"auto"			{  fprintf(yyout,"AUTO "); }
"break"			{  fprintf(yyout,"BREAK "); }
"case"			{  fprintf(yyout,"CASE "); }
"char"			{  fprintf(yyout,"CHAR "); }
"const"			{  fprintf(yyout,"CONST "); }
"continue"		{  fprintf(yyout,"CONTINUE "); }
"default"		{  fprintf(yyout,"DEFAULT "); }
"do"			{  fprintf(yyout,"DO "); }
"double"		{  fprintf(yyout,"DOUBLE "); }
"else"			{  fprintf(yyout,"ELSE "); }
"enum"			{  fprintf(yyout,"ENUM "); }
"extern"		{  fprintf(yyout,"EXTERN "); }
"float"			{  fprintf(yyout,"FLOAT "); }
"for"			{  fprintf(yyout,"FOR "); }
"goto"			{  fprintf(yyout,"GOTO "); }
"if"			{  fprintf(yyout,"IF "); }
"int"			{  fprintf(yyout,"INT "); }
"long"			{  fprintf(yyout,"LONG "); }
"register"		{  fprintf(yyout,"REGISTER "); }
"printf"		{  fprintf(yyout,"PRINTF "); }
"scanf"         {  fprintf(yyout,"SCANF "); }
"short"			{  fprintf(yyout,"SHORT "); }
"signed"		{  fprintf(yyout,"SIGNED "); }
"sizeof"		{  fprintf(yyout,"SIZEOF "); }
"static"		{  fprintf(yyout,"STATIC "); }
"struct"		{  fprintf(yyout,"STRUCT "); }
"switch"		{  fprintf(yyout,"SWITCH "); }
"typedef"		{  fprintf(yyout,"TYPEDEF "); }
"union"			{  fprintf(yyout,"UNION "); }
"unsigned"		{  fprintf(yyout,"UNSIGNED "); }
"void"			{  fprintf(yyout,"VOID "); }
"volatile"		{  fprintf(yyout,"VOLATILE "); }
"while"			{  fprintf(yyout,"WHILE "); }
"*"				   fprintf(yyout,"op-mult= %s", yytext);
"+"				   fprintf(yyout,"op-sum= %s ", yytext);
"-"				   fprintf(yyout,"op-sust= %s ", yytext);
"/"				   fprintf(yyout,"op-div= %s ", yytext);
"%"				   fprintf(yyout,"op-mod= %s ", yytext);
"="				   fprintf(yyout,"op-asig= %s ", yytext);
";"				   fprintf(yyout,"Punto-coma= %s ", yytext);
"("				   fprintf(yyout,"Parent-a= %s ", yytext);
")"				   fprintf(yyout,"Parent-c= %s ", yytext);
","                fprintf(yyout,"coma= %s ", yytext);
"{"                fprintf(yyout,"Inicio= %s ", yytext);
"}"                fprintf(yyout,"Fin= %s ", yytext);
"|"                fprintf(yyout,"op-or= %s ", yytext);
"!"                fprintf(yyout,"op-neg= %s ", yytext);
">="               fprintf(yyout,"op-maq= %s ", yytext);
">"                fprintf(yyout,"op-may= %s ", yytext);
"<="			   fprintf(yyout,"op-meq= %s ", yytext);
"<"                fprintf(yyout,"op-men= %s ", yytext);
"!="               fprintf(yyout,"op-dist= %s ", yytext);
"&&"               fprintf(yyout,"op-and= %s ", yytext);
"=="			   fprintf(yyout,"op-igu= %s ", yytext);
{CH}			   fprintf(yyout,"Cte-cara= %s ", yytext);
{CA}			   fprintf(yyout,"Cte-cade= %s ", yytext);
{RE}			   fprintf(yyout,"Cte-real= %s ", yytext);
{EN}			   fprintf(yyout,"Cte-ent= %s ", yytext);
{VAR}			   { fprintf(yyout,"Id= %s ", yytext); number_id = append(head_id,number_id); }
{WR_VAR}		   { fprintf(yyout,"Error= %s ", yytext); number_errors = append(head_errors,number_errors); }
.				   fprintf(yyout,"");
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

void printList(Node *head, FILE *f, int opt){
	int i = 1;
	Node *p = head->next;
	while(p != NULL)
	{
		if(opt == 1){
			fprintf(f,"Id-%d= %s;  ",i,p->text);
		}else{
			fprintf(f,"Error-%d= %s;  ",i,p->text);
		}
		i = i + 1;
		p = p->next;
	}
	fprintf(f,"\n");
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
	FILE *fp2 = fopen("salida.txt","w");
	yyout = fp2;
	head_id = (Node*)malloc(sizeof(Node));
    head_errors = (Node*)malloc(sizeof(Node));
	yylex();
	fprintf(fp2,"Hay un total de %d identificadores \n", number_id);
	printList(head_id,fp2,1);
	fprintf(fp2,"Hay un total de %d errores lexicos \n", number_errors);
	printList(head_errors,fp2,0);
	fclose(fp2);
	return 0;
}
