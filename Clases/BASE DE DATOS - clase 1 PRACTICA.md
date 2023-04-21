# BASE DE DATOS - clase 1 PRACTICA #

## EL MODELO ENTIDAD RELACION ##
Es util para comunicar mi modelo de datos. Lo debo usar para mi y para otros, para que entiendan de una forma sencilla.




***EJERCICIO 1 DE LA GUIA DE TRABAJOS***.

1. (AFA - Modelado de datos) La Asociaci´on del F´utbol Argentino (AFA) mantiene una serie
de datos hist´oricos acerca de sus jugadores y equipos inscriptos, encuentros y torneos
disputados, resultados y goles:
Cada jugador asociado a la AFA recibe un n´umero de inscripci´on, y se registran su
apellido y nombres, ciudad y provincia de origen, y fecha de nacimiento.
Cada equipo asociado se registra con su nombre, ciudad y provincia en que se encuentra, y fecha de alta como instituci´on. No pueden registrarse dos equipos con id´entico
nombre.
La AFA organiza una serie de torneos, cada uno compuesto por una serie de fechas
que se identifican dentro de cada torneo con n´umeros consecutivos. En cada fecha
de un torneo se producen una serie de encuentros en que un equipo local enfrenta
a un equipo visitante. Los encuentros tambi´en se encuentran n´umerados en forma
consecutiva dentro de cada fecha. La AFA mantiene registro de todos los encuentros
jugados en cada fecha, indicando qu´e equipos se enfrentaron, en qu´e d´ıa y horario, y
cu´al fue el resultado.
En cada torneo, cada equipo participante presenta una formaci´on compuesta por una
serie de jugadores. Un mismo jugador no puede formar parte de la formaci´on de m´as de
un equipo durante un mismo torneo. Cada jugador inscripto en un torneo es inscripto
para jugar en una determinada posici´on.
En cada encuentro se convierte una serie de goles, que se identifican con n´umeros
consecutivos dentro del encuentro. Para cada gol convertido se registra cu´al fue el
equipo que lo convirti´o, qu´e jugador lo hizo, y en qu´e minuto del partido.
Proponga un diagrama Entidad-Interrelaci´on adecuado para modelar los datos que mantiene la AFA.

ENTIDADES:  
----  
Jugador, Equipo, Torneo, Fecha, Partido, Formacion  
**OBSERVAR QUE LAS ENTIDADES MAYORMENTE SON LOS SUSTANTIVOS Y LAS INTERRELACIONES SON VERBOS**   

INTERRELACIONES:  
----  
- Considerar al momento de relacionar las entidades el objetivo del modelado del problema.
En este caso, un jugador no puede pertenecer a mas de un equipo ya que se esta modelando un unico torneo, aunque el jugador se pueda ir a otro equipo en algun momento  
- En las interrelaciones ternarias solo indicamos la cardinalidad maxima. 

![Modelo](/home/aaron/Facultad/BaseDeDatos/Clases/img/modelo.png "Hola")