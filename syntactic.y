%{
    #include<stdio.h>
    #include<string.h>
    #include<stdlib.h>
    #include<ctype.h>
    #include"lex.yy.c"
    
	int yylex();
	int yywrap();

	extern FILE *fp;
	extern int countn;
%}

%token MAIN INCLUDE UNARY RETURN AUTO BREAK CASE CHAR CONST CONTINUE DEFAULT DO DOUBLE ELSE ENUM EXTERN FLOAT FOR GOTO IF INT LONG REGISTER PRINTF SCANF SHORT SIGNED SIZEOF STATIC STRUCT SWITCH UNION UNSIGNED VOID VOLATILE WHILE OP_MULT OP_SUMA OP_SUS OP_DIV OP_MOD OP_ASIG PUNTO_COMA PARENT_A PARENT_C COMA INICIO FIN OP_O OP_NO OP_MAYOR_IGUAL OP_MAYOR OP_MENOR_IGUAL OP_MENOR OP_DIST OP_Y OP_IGUAL CHARACTER STRING FLOAT_NUMBER INTEGER_NUMBER ID TRUE FALSE OP_INCRE_SUM OP_INCRE_MULT OP_INCRE_DIV OP_INCRE_SUST

%right OP_ASIG OP_INCRE_SUST OP_INCRE_DIV OP_INCRE_SUM OP_INCRE_MULT UNARY 
%left OP_SUMA OP_SUST OP_DIV OP_MULT OP_MENOR OP_MAYOR OP_MENOR_IGUAL OP_MAYOR_IGUAL OP_IGUAL OP_DIST OP_Y OP_O

%start program

%%

program: headers datatype MAIN PARENT_A PARENT_C INICIO body return FIN
;

headers: headers headers
| INCLUDE
|
;

body: IF PARENT_A condition PARENT_C INICIO body FIN else
| FOR PARENT_A statement PUNTO_COMA condition PUNTO_COMA statement PARENT_C INICIO body FIN PUNTO_COMA
| WHILE PARENT_A condition PARENT_C INICIO body FIN
| DO INICIO body FIN WHILE PARENT_A condition PARENT_C PUNTO_COMA
| statement PUNTO_COMA
| body body
| PRINTF PARENT_A STRING PARENT_C PUNTO_COMA
| PRINTF PARENT_A STRING COMA ID PARENT_C PUNTO_COMA 
| SCANF PARENT_A STRING COMA '&' ID PARENT_C PUNTO_COMA
;

else: ELSE INICIO body FIN
|
;

datatype: CHAR
| INT
| FLOAT
| VOID
;

condition: value relational value
| value logic value
| TRUE
| FALSE
;

statement: datatype ID init PUNTO_COMA
| ID asignators value PUNTO_COMA
| ID relational expression PUNTO_COMA
| ID UNARY PUNTO_COMA
| UNARY ID PUNTO_COMA
| error
;

init: OP_ASIG value
| COMA ID init
|
;

asignators: OP_ASIG 
| OP_INCRE_SUM
| OP_INCRE_SUST
| OP_INCRE_DIV
| OP_INCRE_MULT
;

expression: expression arithmetics expression
| value
;

arithmetics: OP_SUMA
| OP_SUS
| OP_DIV
| OP_MULT
;

relational: OP_IGUAL
| OP_MAYOR
| OP_MAYOR_IGUAL
| OP_MENOR
| OP_MENOR_IGUAL
| OP_DIST
;

value: CHARACTER
| FLOAT_NUMBER
| INTEGER_NUMBER
| STRING
| ID
;

logic: OP_O
| OP_Y
;

return: RETURN value PUNTO_COMA
|
;

%%

int main(int argc, char *argv[])
{
	yyin = fopen(argv[1], "r");
	if(!yyparse())
	{
		printf("\n Parsing complete\n");
	}else
	{
		printf("\nParsing failed\n");
	}
	fclose(yyin);
	return 0;
}

void yyerror(const char *msg){
	extern int yylineno;
	fprintf(stderr, "line %d: %s\n", yylineno+1, msg);
}

