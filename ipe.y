
%{
#include <stdio.h>
#include <math.h>

#include "ipe.h"

#include "macros.h"

#define code2(c1,c2)         code(c1); code(c2)
#define code3(c1,c2,c3)      code(c1); code(c2); code(c3)
#define code5(c1,c2,c3,c4,c5) 	code(c1); code(c2); code(c3);code(c4); code(c5);
%}

%union{             
       Symbol *sym;    /* puntero a la tabla de simbolos */
       Inst *inst;     /* instruccion de maquina */
}

%token <sym> NUMBER VAR CONSTANTE FUNCION0_PREDEFINIDA FUNCION1_PREDEFINIDA FUNCION2_PREDEFINIDA INDEFINIDA PRINT PRINT_CHAR WHILE IF THEN ELSE READ READ_CHAR CADENA  DO REPEAT UNTIL FOR SINCE INC  TOKEN_LUGAR TOKEN_BORRAR
%type <inst> stmt asgn expr stmtlist cond mientras si fin para variable repetir
%right ASIGNACION
%left O_LOGICO
%left Y_LOGICO
%left MAYOR_QUE MENOR_QUE MENOR_IGUAL MAYOR_IGUAL DISTINTO IGUAL
%left CONCATENACION
%left '+' '-' 
%left '*' '/' MODULO POTENCIA
%left UNARIO NEGACION
%right '^'   
%%

list :    /* nada: epsilon produccion */ 
        | list stmt   {code(STOP); return 1;}
        | list error  {yyerrok;} 
        ;

stmt : 	asgn     {code(pop2);}
	| '(' PRINT expr ')'   {code(escribir); $$ = $3;}
        	| '(' READ VAR ')'    {code2(leervariable,(Inst)$3);}
        	| '(' PRINT_CHAR expr ')' {code(escribir_cadena); $$ = $3;}
        	| '(' READ_CHAR VAR ')' {code2(leer_cadena, (Inst)$3);}
        	| '(' TOKEN_LUGAR expr expr ')' {code(colocar_cursor); $$=$3;}
        	| '(' TOKEN_BORRAR ')'		{code(borrar_pantalla); $$=progp;}
      
        | '(' mientras cond DO stmtlist fin ')' 
                  {
                   ($2)[1]=(Inst)$5; /* cuerpo del bucle */
                   ($2)[2]=(Inst)$6; /* siguiente instruccion al bucle */
                  }
        | '(' mientras cond stmtlist fin ')'
                  {
			execerror(" Mientras sin palabra reservada HACER ");			
                  }
        | '(' si cond THEN stmtlist fin ')' /* proposicion if sin parte else */
                  {
                   ($2)[1]=(Inst)$5; /* cuerpo del if */
                   ($2)[3]=(Inst)$6; /* siguiente instruccion al if */
                  }
     
        | '(' si cond THEN stmtlist fin ELSE stmtlist fin ')' /* proposicion if con parte else */
                  {
                   ($2)[1]=(Inst)$5; /* cuerpo del if */
                   ($2)[2]=(Inst)$8; /* cuerpo del else */
                   ($2)[3]=(Inst)$9; /* siguiente instruccion al if-else */
                  }
       
        | '(' para variable SINCE expr  fin UNTIL expr fin INC expr fin DO stmtlist fin ')'
        	{
        		($2)[1] = (Inst)$8; 
          		($2)[2] = (Inst)$11; 
         		($2)[3] = (Inst)$14; 
          		($2)[4] = (Inst)$15;
        	}
      
        | '(' repetir stmtlist fin UNTIL cond fin ')'  
        	{
        		($2)[1]=(Inst)$3; /* condicion del bucle */
                  	($2)[2]=(Inst)$6; /* siguiente instruccion al bucle */
        	}
        ;


asgn :    '(' ASIGNACION VAR expr ')' { $$=$4; code3(varpush,(Inst)$3,assign);}
        	|'(' ASIGNACION CONSTANTE expr ')' {execerror(" NO se pueden asignar datos a constantes ",$3->nombre);}
	;

variable: VAR {code((Inst)$1); $$=progp;}
	;

cond :    expr {code(STOP); $$ =$1;}
      	;

mientras:    WHILE      {$$= code3(whilecode,STOP,STOP);}
      	;

repetir: REPEAT 	{$$= code3(dowhilecode,STOP,STOP);}
	;

si:       IF         {$$= code(ifcode); code3(STOP,STOP,STOP);}
      	;

fin :    /* nada: produccion epsilon */  {code(STOP); $$ = progp;}
      	;

para:	FOR  {$$=code5(forcode,STOP,STOP,STOP,STOP);}
	;

stmtlist:  /* nada: prodcuccion epsilon */ {$$=progp;}
        | stmtlist stmt 
        ;

expr :    NUMBER     		{$$=code2(constpush,(Inst)$1);}
        | VAR        		{$$=code3(varpush,(Inst)$1,eval);} 
        | CONSTANTE      	{$$=code3(varpush,(Inst)$1,eval);}
        | CADENA 		{$$=code2(char_push, (Inst)$1);}
        | asgn
        | FUNCION0_PREDEFINIDA '(' ')'      {code2(funcion0,(Inst)$1->u.ptr);}
        | FUNCION1_PREDEFINIDA '(' expr ')' {$$=$3;code2(funcion1,(Inst)$1->u.ptr);}
        | FUNCION2_PREDEFINIDA '(' expr ',' expr ')'
                                            {$$=$3;code2(funcion2,(Inst)$1->u.ptr);}
        | '(' expr ')'  	{$$ = $2;}
        | '(''+' expr expr ')'	{code(sumar);}
        | '(''-' expr expr ')' 	{code(restar);}
        | '(''*' expr expr ')'	{code(multiplicar);}
        | '(''/' expr expr ')' 	{code(dividir);}
        | '('MODULO expr expr ')'{code(modulo);}
        | '(''^' expr expr ')' 	{code(potencia);}
        | '(' '-' expr ')' %prec UNARIO 	{$$=$3; code(negativo);}
        | '(' '+' expr ')' %prec UNARIO 	{$$=$3; code(positivo);}
        | '('MAYOR_QUE expr expr ')'	{code(mayor_que);}
        | '(' MAYOR_IGUAL expr expr')' {code(mayor_igual);}
        | '(' MENOR_QUE expr expr ')' 	{code(menor_que);}
        | '(' MENOR_IGUAL expr expr ')' {code(menor_igual);}
        | '(' IGUAL expr expr ')'	{code(igual);}
        | '(' DISTINTO expr expr ')' 	{code(distinto);}
        | '(' Y_LOGICO expr expr  ')'	{code(y_logico);}
        | '(' O_LOGICO expr expr  ')'	{code(o_logico);}
        | '(' NEGACION expr expr  ')' 	{code(negacion);}
        | '(' CONCATENACION expr expr ')' {code(concatenar);}
      	;

%%

#include <stdio.h>
#include <ctype.h>
#include <signal.h>
#include <setjmp.h>

jmp_buf begin;
char *progname;
int lineno = 1;
/* Dispositivo de entrada est‡ndar de yylex() */
extern FILE * yyin;

main(int argc, char *argv[])
{

 void fpecatch();

 /* Si se invoca el intérprete con un fichero de entrada */
 /* entonces se establece como dispositivo de entrada para yylex() */
 if (argc == 2) yyin = fopen(argv[1],"r");


 progname=argv[0];

 /* inicializacion de la tabla de simbolos */
 init();

/* Establece un estado viable para continuar despues de un error */
 setjmp(begin);

 /* Establece cual va a ser la funcion para tratar errores de punto flotante */
 signal(SIGFPE,fpecatch); /* Excepcion de punto flotante*/

/* initcode inicializa el vector de intrucciones y la pila del interprete */
 for (initcode(); yyparse(); initcode()) execute(prog);

 return 0;

}

yyerror(char *s)
{
 warning(s,(char *) 0);
}

warning(char *s, char *t)
{
 fprintf(stderr," ** %s : %s", progname,s);
 if (t) fprintf(stderr," ---> %s ",t);
 fprintf(stderr,"  (linea %d)\n",lineno);
}

execerror(s,t) /* recuperacion de errores durante la ejecucion */
char *s,*t;
{
 warning(s,t);
  longjmp(begin,0);
}

void fpecatch()     /*  atrapa errores de punto flotante */
{
 execerror("error de punto flotante ",(char *)0);
}

