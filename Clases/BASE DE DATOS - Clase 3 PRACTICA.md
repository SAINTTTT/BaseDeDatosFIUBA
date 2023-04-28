# PRACTICA ALGEBRA RELACIONAL

En el caso de los alumnos que tienen todas las materias aprobadas, otra forma de verlo es:
- Armo una tabla con el producto cartesiano entre Alumnos y Materia de su carrera, para ver todas las materias que un alumno cursa en su carrera --
> X
- Armo la tabla con el producto cartesiano de alumnos con su materia aprobada --
> Y
- Resto ambas tablas para obtener los alumnos con la materia que aun no aprobaron
> X - Y = Z
- Al resultado le hago una proyeccion sobre el ID de Alumno y se lo resto a la tabla alumnos, para de esta forma quitar los alumnos que tienen materias pendientes y quedarme solamente con aquellos que no tienen materias pendientes, i.e, aprobaron todo.

a) Listar las pel´ıculas del a˜no 2000.  
> σ year = 2000 (movies)  

b) Mostrar el nombre y apellido de los directores de la base que tienen pel´ıculas fechadas en el a˜no 2000. 

>peliculas_2000 = π movies.id (σ year = 2000 (movies))
directors_2000 = πmovies_directors.director_id (peliculas_2000 ⨝ movies.id = movies_directors.movie_id movies_directors)
π first_name, last_name (directors_2000 ⨝ movies_directors.director_id = directors.id directors)

c) Mostrar los nombres de las pel´ıculas filmadas por Woody Allen.  
>WOODY_ALLEN_ID = π id (σ first_name = 'Woody' ∧ last_name = 'Allen' (directors))
MOVIES_WOODY_ALLEN = π movie_id (movies_directors ⨝ movies_directors.director_id = directors.id WOODY_ALLEN_ID)
π name (movies ⨝ movies.id = movies_directors.movie_id MOVIES_WOODY_ALLEN)

d) Mostrar los nombres de las pel´ıculas en que Hitler figura como actor. 
> ID_HITLER = π id (σ first_name = 'Adolf' ∧ last_name = 'Hitler'(actors))  
ID_MOVIE_HITLER = πroles.movie_id (roles ⨝ roles.actor_id = actors.id ID_HITLER)  
π name (movies ⨝ movies.id = roles.movie_id ID_MOVIE_HITLER) 

e) ¿Algún director abarca todo los g´eneros?  
>GENRES = π genre (movies_genres)  
π director_id, genre (directors_genres) ÷ GENRES

f ) Mostrar el nombre y apellido de los directores que abarcaron (al menos) los mismos
g´eneros que Polanski. ¿Y que Scorsese? ¿Y que Tarantino?  
>ID_POLANSKI = π directors.id (σ last_name = 'Polanski' (directors))  
GENRES_POLANSKI = π genre (directors_genres ⨝ directors_genres.director_id = directors.id ID_POLANSKI)  
IDS_DIRECTORS = π director_id, genre (directors_genres) ÷ GENRES_POLANSKI  
π first_name, last_name (directors ⨝ directors.id = directors_genres.director_id IDS_DIRECTORS)

g) Mostrar el a˜no de la ´ultima pel´ıcula.  
h) Listar las pel´ıculas del ´ultimo a˜no.  
i) Listar las pel´ıculas del director Hitchcock en las que actu´o Leo G. Carroll.  
j) Listar las pel´ıculas del director Hitchcock en las que NO actu´o Leo G. Carroll.  
k) Listar los actores que participan de al menos 3 pel´ıculas.  