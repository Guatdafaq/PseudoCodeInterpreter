(borrar)
(lugar 10 10)
(escribir_cadena ' Factorial de un número  ')

(lugar 11 10)
(escribir_cadena ' Introduce un número entero ')
(leer N)

(:= factorial 1)

(para i desde 2 hasta N paso 1 hacer
	(:= factorial 
            (* factorial i)
        )
)

@ Se muestra el resultado

(lugar 15 10)
(escribir_cadena ' El factorial de ')
(escribir N)
(escribir_cadena ' es ')
(escribir factorial)