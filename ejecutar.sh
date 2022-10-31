rm -rf lex.y.c y.tab.c y.tab.h a.out
lex syntax.lex
yacc -d -v syntactic.y
gcc y.tab.c -ll -w
./a.out prueba.c
