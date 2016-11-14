{
  Asignatura:    Procesadores de Lenguajes

  TitulaciÃ³n:    IngenierÃ­a InformÃ¡tica
  Especialidad:  ComputaciÃ³n
  Curso:         Tercero
  Cuatrimestre:  Segundo

  Departamento:  InformÃ¡tica y AnÃ¡lisis NumÃ©rico
  Centro:        Escuela PolitÃ©cnica Superior de CÃ³rdoba
  Universidad de CÃ³rdoba
 
  Curso acadÃ©mico: 2014 - 2015

  Fichero de ejemplo para el intérprete de pseudocódigo en espaÃ±ol con notaciÃ³n prefija: ipe.exe
}

@ Bienvenida

(borrar)

(lugar 10 10)

(escribir_cadena 'Introduce tu nombre --> ')

(leer_cadena nombre)

(borrar)
(lugar 10 10)

(escribir_cadena ' Bienvenido/a << ')

(escribir_cadena nombre)

(escribir_cadena ' >> al intérprete de pseudocódigo en espaÃ±ol:\'ipe.exe\'.')

(lugar 40 10)
(escribir_cadena 'Pulsa una tecla para continuar')
(leer_cadena  pausa)


(repetir 

 @ Opciones disponibles
 (borrar)
 (lugar 10 10)
 (escribir_cadena ' Factorial de un número --> 1 ')
 (lugar 11 10)
 (escribir_cadena ' Máximo común divisor ----> 2 ')
 (lugar 12 10)
 (escribir_cadena ' Finalizar ---------------> 0 ')

 (lugar 15 10)
 (escribir_cadena ' Elige una opcion ')
 (leer opcion)

 (borrar)

 (si (= opcion 0)        @ Fin del programa
    entonces  
        (lugar 10 10)
        (escribir_cadena nombre)
        (escribir_cadena ': gracias por usar el intérprete ipe.exe ')
   si_no
       @ Factorial de un número
	(si (= opcion 1)
   	    entonces
                (lugar 10 10)
		(escribir_cadena ' Factorial de un numero  ')

                (lugar 11 10)
		(escribir_cadena ' Introduce un numero entero ')
		(leer N)

        (:= factorial 1)

        (para i desde 2 hasta N paso 1 hacer
            (:= factorial
                (* factorial i)
            )
        )

        	@ Resultado
        	(lugar 15 10)
		(escribir_cadena ' El factorial de ')
		(escribir N)
		(escribir_cadena ' es ')
		(escribir factorial)
    
   		@ Máximo común divisor
		si_no 
			(si (= opcion 2)
				entonces
					(lugar 10 10)
					(escribir_cadena ' Máximo común divisor de dos números ')

					(lugar 11 10)
                  			(escribir_cadena ' Algoritmo de Euclides ')

                  			(lugar 12 10)
                  			(escribir_cadena ' Escribe el primer número ')
                  			(leer a)

                  			(lugar 13 10)
                  			(escribir_cadena ' Escribe el segundo número ')
                  			(leer b)

                  			@ Se ordenan los números
					(si (< a  b)
						entonces 
							(:= auxiliar a)
							(:= a b)
							(:= b auxiliar)
					)

					@ Se guardan los valores originales
					(:= A1 a)
					(:= B1 b)

					@ Se aplica el mÃ©todo de Euclides	
					(:= resto (#mod a b))

					(mientras (<> resto 0) hacer
						(:= a b)
						(:= b resto)
						(:= resto (#mod a b))
					)
         
					@ Se muestra el resultado
					(lugar 15 10)
					(escribir_cadena ' Máximo común divisor de ')
					(escribir A1)
					(escribir_cadena ' y ')
					(escribir B1)
					(escribir_cadena ' es ---> ')
					(escribir b)

			@ Resto de opciones
 			si_no  
				(lugar 15 10)
			    	(escribir_cadena ' Opcion incorrecta ')

 			)  @ Fin de la sentencia condicional que empieza en la lÃ­nea 89
		)  @ Fin de la sentencia condicional que empieza en la lÃ­nea 66

	    )  @ Fin de la sentencia condicional que empieza en la lÃ­nea 59

 (lugar 40 10) 
 (escribir_cadena '\n Pulse una tecla para continuar --> ')
 (leer_cadena pausa)
 
  hasta (=  opcion 0)
) @ Fin del bucle repetir que empieza en la lÃ­nea 42

@ Despedida final

(borrar)
(lugar 10 10)
(escribir_cadena 'El programa ha concluido')