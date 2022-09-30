# Grupo integrante

Por: Isaac Blanco, Camilo Céspedes y Ricardo Di Silvio

## Como utilizar el analizador

Dirigirse al directorio del proyecto y correr el comando `sh test_lex.sh`.
Al hacerlo, se analizará el texto dentro del archivo `PRUEBA.c` y se generará el archivo `salida.txt` con los contenidos del análisis.

#### El archivo a analizar no debe necesariamente tener como extensión `.c`, sino también puede ser un archivo de texto de otro tipo, por ejemplo, `.txt`

## Como cambiar el codigo que se va a analizar

Opción 1: Incluir el nuevo archivo a leer y reemplazar el nombre `PRUEBA.c` por el nombre del nuevo archivo en la cuarta linea
del archivo `test_lex.sh`
Opción 2: Modificar el contenido del archivo `PRUEBA.c` usando el comando `$nano PRUEBA.c`
