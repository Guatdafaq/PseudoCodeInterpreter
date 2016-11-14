%{
#include "macros.h"
#include "ipe.h"
#include "ipe.tab.h"
#include <ctype.h>

extern char *progname;
extern int lineno;
%}
/* definiciones regulares */
espacio     [ \t\n]
letra       [a-zA-Z]
digito      [0-9]
identificador   {letra}(_?({letra}|{digito})*)*
numero      {digito}+(\.{digito}+)?(E[+\-]?{digito}+)?
cadena  	"'"([^']|\\\')*"'"
mod       #[mM][oO][dD]
o             #[oO]
y             #[yY]
no          #[nN][oO]
comentario      [\@].*{espacio}*

%x COMENTARIO

%%
[ \t] { ; } /* saltar los espacios y los tabuladores */

"\{"  {BEGIN COMENTARIO;}
<COMENTARIO>"\}"  {BEGIN 0;}
<COMENTARIO>. {;}

{comentario}    {;}

{cadena}    {yylval.sym = install_cadena("", CADENA, yytext);
		
		return CADENA;}

{numero} {double d;  
                                   sscanf(yytext,"%lf",&d);
                                 /* Instala el numero en la tabla de simbolos */
				   yylval.sym=install("",NUMBER,d); 
				   return NUMBER;}

{identificador} { Symbol *s;
		int i;
            		for(i = 0; yytext[i]; i++) 
                    		yytext[i] = tolower(yytext[i]);
		
                   if ((s=lookup(yytext)) == 0)
                               s = install (yytext, INDEFINIDA, 0.0);
                    yylval.sym = s;
                    return s->tipo == INDEFINIDA ? VAR : s->tipo;}




">="	{return MAYOR_IGUAL;}
"<="	{return MENOR_IGUAL;}
"="	{return IGUAL;}
"<>"	{return DISTINTO;}
">"	{return MAYOR_QUE;}
"<"	{return MENOR_QUE;}
"::"	{return CONCATENACION;}	
":="      {return ASIGNACION;}


{mod}		{return MODULO;}
{o}		{return O_LOGICO;}
{y}		{return Y_LOGICO;}
{no}		{return NEGACION;}



^#       {printf("\n>>>>>>> Fin del programa <<<<<<<\n"); return 0;}
\n      {lineno++; } /* no se devuelve nada, continúa el analisis léxico */
^\$[^\n]*  { /* Ejecucion de un comando del shell */

         BORRAR;
         LUGAR(10,10);
         if (strcmp(yytext,"$") != 0)
            {
             printf("\n Salida provisional al sistema operativo\n\n");
             printf("\n comando ---> %s\n\n",yytext);
             system(yytext+1);
             putchar('\n');
             }
           else 
            {
             printf(" Si desea ejecutar un comando del sistema operativo ");
             printf(" teclee: \n\t\t $comando ");
            }

         LUGAR(24,1);
         printf(">>>>>>>> Pulse ENTER para volver al programa %s ",progname);
         /* Espera que se pulse ENTER */
         while(getchar()!='\n')  ;

         BORRAR;
         LUGAR(2,1);
         printf("Continue la ejecucion del programa --> %s \n\n",progname);
         /* no se devuelve nada, continúa el analisis léxico */
         }
.       {return yytext[0];}
