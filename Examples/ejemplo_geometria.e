(borrar)
(lugar 10 10)

(escribir_cadena 'Menú para operaciones geométricas')

(repetir 

 @ Opciones disponibles
 (borrar)
 (lugar 10 10)
 (escribir_cadena ' 1- Área de un rectángulo ')
 (lugar 11 10)
 (escribir_cadena ' 2- Área de un cuadrado ')
 (lugar 12 10)
 (escribir_cadena ' 3 - Área de un triángulo ')
 (lugar 13 10)
 (escribir_cadena ' 4 - Área de un círculo ')
  (lugar 14 10)
 (escribir_cadena ' 0 - Finalizar ')


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
  (si (= opcion 1)
        entonces
        	(lugar 10 10)
    	(escribir_cadena 'Área de un rectángulo ')
          	(escribir_cadena 'Introduce la altura: ')
          	(leer altura)
          	(escribir_cadena 'Introduce el ancho: ')
          	(leer ancho)
          	(:= resultado (* altura ancho))
          	(escribir_cadena 'Resultado:')
          	(escribir resultado)
    si_no 
      (si (= opcion 2)
        entonces
          	(lugar 10 10)
          	(escribir_cadena ' Área de un cuadrado ')
          	(escribir_cadena 'Introduce el lado: ')
          	(leer lado)
          	(:= resultado (* altura ancho))
          	(escribir_cadena 'Resultado:')
          	(escribir resultado)
    si_no
      (si (= opcion 3)
        entonces
          	(lugar 10 10)
          	(escribir_cadena ' Área de un triángulo ')
          	(escribir_cadena 'Introduce la altura: ')
          	(leer altura)
          	(escribir_cadena 'Introduce el ancho: ')
          	(leer ancho)
          	(:= resultado (/ (* altura ancho) 2))
          	(escribir_cadena 'Resultado:')
          	(escribir resultado)
    si_no
     (si (= opcion 4)
        entonces
          	(lugar 10 10)
          	(escribir_cadena ' Área de un círculo ')
          	(escribir_cadena 'Introduce el radio: ')
          	(leer radio)
          	(:= resultado (* PI (^ radio 2)))
          	(escribir_cadena 'Resultado:')
          	(escribir resultado)

    si_no  
          (lugar 15 10)
            (escribir_cadena ' Ha elegido una opción incorrecta ')
            	     
        )))))  
 (lugar 40 10) 
 (escribir_cadena '\n Pulse una tecla para continuar --> ')
 (leer_cadena pausa)
  hasta (=  opcion 0)
) 

(borrar)
(lugar 10 10)
(escribir_cadena 'El programa ha concluido')

