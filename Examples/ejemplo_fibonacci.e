(borrar)
(lugar 10 10)
(escribir_cadena ' Elemento x de la sucesión de Fibonacci ')


(lugar 11 10)
(escribir_cadena ' Introduce un numero entero ')
(leer N)

(:= x 0)
(:= anterior 0)
(:= a 1)
(:= elemento 0)

(para i desde 0 hasta N paso 1 hacer
	(:= x
	(+ a anterior)
       	)
       	(:= elemento (+ elemento 1))
       	(lugar 15 10)
       	(:= anterior a)
       	(:= a x)	
)

(escribir_cadena ' El valor de la sucesión de Fibonacci para el elemento ')
	(escribir N)
	(escribir_cadena ' es ')
	(escribir (- x 1))



