rm -rf lex.yy.c a.out salida.txt
flex test.lex
gcc lex.yy.c
./a.out PRUEBA.c