#include <stdio.h>
// COMENTARIO DE PRUEBA
void main()
{	int i,x;
	float media,media2;
	media =0;
	for (i = 0; i < 10;i++)
	{ 
		scanf("%d",x);
	media+=x;
	};
	// ME METI EN LA MITAD
	media /= 10;
	printf ("%f",media);
	i = 0;
	media2 = 0;
	while (i < 10)
		{scanf("%d",x);
		i++;
		media2 = media2 + x;
		};
	media2 = media2/10;
	printf ("%f",media);
	i = 0;
	// UNO MÁS POR SI LAS MOSCAS 
	media2 = 0;
	do		{scanf("%d",x);
			i++;
			media2 = media2 + x;
			}while (i < 10);
	media2 = media2/10;
	printf ("%f",media);
}
