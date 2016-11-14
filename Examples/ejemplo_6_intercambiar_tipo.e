
(escribir_cadena 'Ejemplo de intercambio de valores \n')

(escribir_cadena 'Introduce un número --> ')

(leer numero)

(si (> numero 0)
  entonces
           (escribir_cadena  'Introduce una cadena --> ')
           (leer_cadena dato)
   si_no
           (escribir_cadena  'Introduce un número --> ')
           (leer dato)
)
@ Asignación
(:= nuevo dato)

(escribir_cadena  'Valor leído --> ')

(si (> numero 0)
 entonces
	(escribir_cadena  nuevo)
 si_no
	(escribir nuevo)
)