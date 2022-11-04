rm -rf lex.y.c y.tab.c y.tab.h a.out y.output
lex LAB02_BLANCO_CESPEDES.lex
yacc -d -v LAB02_BLANCO_CESPEDES.y
gcc y.tab.c -ll -w
./a.out $1
