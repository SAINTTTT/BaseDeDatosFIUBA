# PRACTICA ALGEBRA RELACIONAL

En el caso de los alumnos que tienen todas las materias aprobadas, otra forma de verlo es:
- Armo una tabla con el producto cartesiano entre Alumnos y Materia de su carrera, para ver todas las materias que un alumno cursa en su carrera --
> X
- Armo la tabla con el producto cartesiano de alumnos con su materia aprobada --
> Y
- Resto ambas tablas para obtener los alumnos con la materia que aun no aprobaron
> X - Y = Z
- Al resultado le hago una proyeccion sobre el ID de Alumno y se lo resto a la tabla alumnos, para de esta forma quitar los alumnos que tienen materias pendientes y quedarme solamente con aquellos que no tienen materias pendientes, i.e, aprobaron todo.

