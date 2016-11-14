(borrar)
(lugar 10 10)
(escribir_cadena ' Máximo común divisor ----> 2 ')
   
 @ Máximo común divisor

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