%{
    #include<stdio.h>
    #include<string.h>
    #include<stdlib.h>
    #include<ctype.h>
    #include"lex.yy.c"
    
	int yylex();
	int yywrap();
	int errores = 0;

	FILE *fo;
	extern int yylineno;
	extern char *yytext;
	extern FILE *fp;
	extern int countn;
%}

%token MAIN INCLUDE UNARY RETURN AUTO BREAK CASE CHAR CONST CONTINUE DEFAULT DO DOUBLE ELSE ENUM EXTERN FLOAT FOR GOTO IF INT LONG REGISTER PRINTF SCANF SHORT SIGNED SIZEOF STATIC STRUCT SWITCH UNION UNSIGNED VOID VOLATILE WHILE OP_MULT OP_SUMA OP_SUS OP_DIV OP_MOD OP_ASIG PUNTO_COMA PARENT_A PARENT_C COMA INICIO FIN OP_O OP_NO OP_MAYOR_IGUAL OP_MAYOR OP_MENOR_IGUAL OP_MENOR OP_DIST OP_Y OP_IGUAL CHARACTER STRING FLOAT_NUMBER INTEGER ID TRUE FALSE OP_INCRE_SUM OP_INCRE_MULT OP_INCRE_DIV OP_INCRE_SUST

%right OP_ASIG OP_INCRE_SUST OP_INCRE_DIV OP_INCRE_SUM OP_INCRE_MULT UNARY 
%left OP_SUMA OP_SUS OP_DIV OP_MULT OP_MENOR OP_MAYOR OP_MENOR_IGUAL OP_MAYOR_IGUAL OP_IGUAL OP_DIST OP_Y OP_O

%start program

%%

// Start of the grammar 
program: headers datatype MAIN PARENT_A PARENT_C INICIO body return FIN
;

// Libray of the code #include<bla bla bla.h>
headers: headers headers
| INCLUDE
|
;

// Body of the code ( Ifs, fors, whiles...)  
body: IF PARENT_A condition PARENT_C INICIO body FIN else
| IF PARENT_A condition PARENT_C statement PUNTO_COMA else
| FOR PARENT_A statement PUNTO_COMA condition PUNTO_COMA statement PARENT_C INICIO body FIN
| FOR PARENT_A statement PUNTO_COMA condition PUNTO_COMA statement PARENT_C INICIO body FIN PUNTO_COMA
| FOR PARENT_A statement PUNTO_COMA condition PUNTO_COMA statement PARENT_C statement PUNTO_COMA
| WHILE PARENT_A condition PARENT_C INICIO body FIN
| WHILE PARENT_A condition PARENT_C INICIO body FIN PUNTO_COMA
| WHILE PARENT_A condition PARENT_C statement PUNTO_COMA
| DO INICIO body FIN WHILE PARENT_A condition PARENT_C PUNTO_COMA
| DO statement PUNTO_COMA WHILE PARENT_A condition PARENT_C PUNTO_COMA
| statement PUNTO_COMA  
| body body
| PRINTF PARENT_A STRING moreParams PARENT_C PUNTO_COMA
| PRINTF PARENT_A STRING PARENT_C PUNTO_COMA 
| SCANF PARENT_A STRING COMA ID PARENT_C PUNTO_COMA
| error
;

// Parameters of a function
moreParams: COMA STRING moreParams
| COMA ID moreParams
| COMA expression moreParams
|
;

// Else statement 
else: ELSE INICIO body FIN
| ELSE statement PUNTO_COMA 
|
;

// Datatypes of the variables  
datatype: CHAR
| INT
| FLOAT
| VOID
;

// Conditions 
condition: expression relational expression
| condition logic condition
| TRUE
| FALSE
;

// Lines of the code
statement: datatype ID init 
| ID asignators value
| ID asignators ID
| ID asignators expression 
| ID relational expression 
| ID UNARY 
| UNARY ID
| error
;

// Asign of the variables 
init: OP_ASIG value
| OP_ASIG expression
| COMA ID init
|
;

// Operators for asignators ( = , >= , <=... )
asignators: OP_ASIG 
| OP_INCRE_SUM
| OP_INCRE_SUST
| OP_INCRE_DIV
| OP_INCRE_MULT
;

// Arithmetics expression (x+y, y-4...)
expression: expression arithmetics expression
| value
;

// Arithmetics operators (+,-,*,/)
arithmetics: OP_SUMA
| OP_SUS
| OP_DIV
| OP_MOD
| OP_MULT
;

// Relational operators (==, >, >=, <, <= , !=)
relational: OP_IGUAL
| OP_MAYOR
| OP_MAYOR_IGUAL
| OP_MENOR
| OP_MENOR_IGUAL
| OP_DIST
;

// Value of things ( 'a', "ab", 2.0, 2, x)
value: CHARACTER
| FLOAT_NUMBER
| INTEGER
| STRING
| ID
;

// Logic operators ( && , || )
logic: OP_O
| OP_Y
;

// Return 
return: RETURN value PUNTO_COMA
|
;

%%

int main(int argc, char *argv[])
{
	fo = fopen("./salida.txt", "w");
	yyin = fopen(argv[1], "r");
	fprintf(fo, "Prueba con el archivo de entrada \n");
	if(!yyparse())
	{
		fprintf(fo, "Analisis completo\n");
	}
	if(errores == 0){
		fprintf(fo, "Resultado: Sin errores sintacticos");
	}
	fclose(yyin);
	fclose(fo);
	return 0;
}

void yyerror(const char *msg){
	errores = errores + 1;
	fprintf(fo, "Error sintactico en la línea número: %d \n", yylineno);
}

