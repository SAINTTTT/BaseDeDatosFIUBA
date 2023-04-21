# BASE DE DATOS - clase 1 TEORICA #

***ALMACENAMIENTO*** es una palabra clave en esto de la bbdd

<ins>BBDD</ins>: **CONJUNTO DE DATOS INTERRELACIONADOS**. No todos tienen la misma estructura pero tienen que tener un sentido universal

<ins>DATO</ins> es un hecho que puede ser representado y almacenado de
alguna forma, y que tiene un sentido implícito. Tiene que tener un sentido para darme informacion. Lo podemos pensar al DATO como una **PROPOSICION**

PREDICADO
Es la funcion que indica si la proposicion es V o F. 
Puede tipificar los datos cuando comparten una estructura: EJ: ***[persona]*** gano ***[torneo]*** en ***[año]***

<ins>Las BBDD solo almacenan proposiciones VERDADERAS (V)</ins>


----------------------------------------------------------
SISTEMA DE GESTION DE BASE DE DATOS

SGBD ---> Es software basicamente

Es importante tener una estructura de indices para buscar los datos. EJ: Buscar una pelicula por Titulo o Director. Si me piden buscar por Año y no tengo ese indice guardado, no lo voy a poder buscar

INDEPENDENCIA DE DATOS: Si se cambia el SGBD no tiene que ser necesario cambiar el modo en que se accede a la BBDD desde el programa o aplicacion.

----------------------------------------------------------
ARQUITECTURA DE 3 CAPAS ANSI/SPARC

Vista: No todos deben ver la BBDD de la misma forma (permisos, como se los ve, etc.)

Conceptual: El mundo de datos o modelo (clases por ejemplo)

Interno: Como traduzco el modelo en cuanto a la logica (cuantas tablas voy a tener por ejem)

----------------------------------------------------------
FUNCIONES DE LOS SGBD

Tiene que evitar PROBLEMAS DE CONCURRENCIA, si yo modifico algo y viene otro despues tiene que poder manipular los datos ssin problemas

Tiene que proponer INDICES para las consultas.

--------------------------------------------------------------------------------------------------------------------
PARTE 2 - DISEÑO CONCEPTUAL DE BASES DE DATOS

Esto es para el Nivel Conceptual, donde se describe la semantica de los datos

Tipo de Entidad: Es la clase u objeto particular
Entidad: Es una instancia de un Tipo de Entidad 

Se representa en el modelo el Tipo de Entidad

Atributo: Propiedad que describe al Tipo de Entidad

Tipo de interrelacion: Asociacion o Asociaciones entre dos o mas Tipos de Entidades. Ej--> un Futbolista nacio en Pais. Tambien, un Futbolista jugo en Pais.

CARDINALIDAD: Representa cuantos Tipo de Entidad se relacionan. La cardinalidad se lee normal en el diagrama de EI.

Las Interrelaciones las tengo que pensar como un conjunto, es decir, no puede haber repeticiones. O existe o no existe.

Atributos NULL puede ser porque no exista o porque existe pero se desconoce. NO USAR NULL PARA REPRESENTAR EL CERO

Atributo COMPUESTO: Lo uso cuando necesito la informacion "partida" de ese Atributo.

Atributo MULTIVALUADO: Puede tomar mas de un valor. Es una mala idea usarlo cuando a partir de ese Atributo intento buscar otra Entidad.

OBSERVACION PERSONAL: Tratar dde almacenar datos que no cambian con el tiempo. Ej--> No almacenar Edad (hay que cambiarla año a año), almacenar en cambio Fecha de nacimiento

UNICIDAD: Tiene que tener un ID que lo identifique univocamente

PARTICIPACION: Cantidad minima de instancias que deben relacionarse

Las INTERRELACIONES TIENEN ATRIBUTOS y son necesarios para identificar la Interrelacion. Ej--> Alumno aprobo Materia. "aprobo" tiene el atributo Fecha para saber cuando la aprobo. No la puedo poner en Alumno o en Materia porque no le corresponde exclusivamente a ninguno de los dos. Ademas, si la pongo en Alumno como multivaluada por ejemplo, no podria relacionar la Fecha con la Asignatura correspondiente
----
Cuando la CARDINALIDAD es 1:1, el atriubuto clave de la Interrelacion puede ser el atributo clave de cualquiera de los Tipos de Entidades interrelacionados

Cuando la CARDINALIDAD es 1:N, el atriubuto clave de la Interrelacion es la clave del Tipo de Entindad de el lado de N

Cuando la CARDINALIDAD es N:N, el atriubuto clave de la Interrelacion es el conjunto de las claves de los Tipos de Entidad
-----

ENTIDAD DEBIL: Cuando una entidad necesita de otra para subsistir. La clave de la debil se compone de la clave de la identificadora mas algunos de sus atributos llamados discriminantes. 

-------

INTERRELACIONES TERNARIAS (O N-ARIAS): Participan 3 tipos de entidad distintos. Ej de la clase--> Para identificar una puntuacion, necesito Cantante, Ronda y Jurado.

