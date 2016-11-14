(borrar)
(lugar 10 10)
(escribir_cadena ' Datos personales ')

@Obtención de datos

(escribir_cadena ' Introduce tu nombre ')
(leer_cadena nombre)

(escribir_cadena ' Introduce tu primer apellido ')
(leer_cadena apellido1)

(escribir_cadena ' Introduce tu segundo apellido ')
(leer_cadena apellido2)

(escribir_cadena ' Introduce tu DNI ')
(leer_cadena dni)

(escribir_cadena ' Introduce tu dirección ')
(leer_cadena direccion)

(escribir_cadena ' Introduce tu edad ')
(leer_cadena edad)

(escribir_cadena ' Introduce tu universidad ')
(leer_cadena uni)

(escribir_cadena ' Introduce tu grado ')
(leer_cadena grado)

(escribir_cadena ' Introduce tu curso ')
(leer_cadena curso)

(escribir_cadena ' Introduce el nombre de la asignatura ')
(leer_cadena asignatura)
@Datos ordenados
(borrar)
(lugar 2 2)
(escribir_cadena ' Nombre completo: ')
(lugar 3 8)
(escribir_cadena (:: 'Nombre: ' nombre))
(lugar 4 8)
(escribir_cadena (:: 'Primer apellido: ' apellido1))
(lugar 5 8)
(escribir_cadena (:: 'Segundo apellido: ' apellido2))
(lugar 6 2)
(escribir_cadena (:: ' DNI: ' dni))
(lugar 7 2)
(escribir_cadena (:: ' Dirección: ' direccion))
(lugar 8 2)
(escribir_cadena (:: ' Edad: ' edad))
(lugar 2 40)
(escribir_cadena (:: ' Universidad: ' uni))
(lugar 3 40)
(escribir_cadena (:: ' Grado: ' grado))
(lugar 4 40)
(escribir_cadena (:: ' Curso: ' curso))
(lugar 5 40)
(escribir_cadena (:: ' Asignatura: ' asignatura))

(escribir_cadena '\n')