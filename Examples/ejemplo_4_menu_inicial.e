(borrar)
(lugar 10 10)

(escribir_cadena 'Introduce tu nombre --> ')
(leer_cadena nombre)

(borrar)
(lugar 10 10)

(escribir_cadena ' Bienvenido/a << ')
(escribir_cadena nombre)
(escribir_cadena ' >> al intérprete de pseudocódigo en español:\'ipe.exe\'.')

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
    (escribir_cadena 'Ha elegido la opción de Factorial de un numero  ')

      @ Máximo común divisor
    si_no 
      (si (= opcion 2)
        entonces
          (lugar 10 10)
          (escribir_cadena ' Ha elegido la opción de Máximo común divisor de dos números ')

        @ Resto de opciones
        si_no  
          (lugar 15 10)
            (escribir_cadena ' Ha elegido una opción incorrecta ')
      )  @ Fin de la sentencia condicional que empieza en la línea 74

  )  @ Fin de la sentencia condicional que empieza en la línea 67

 )  @ Fin de la sentencia condicional que empieza en la línea 59

 (lugar 40 10) 
 (escribir_cadena '\n Pulse una tecla para continuar --> ')
 (leer_cadena pausa)
 
  hasta (=  opcion 0)
) @ Fin del bucle repetir que comienza en la línea 42

(borrar)
(lugar 10 10)
(escribir_cadena 'El programa ha concluido')
