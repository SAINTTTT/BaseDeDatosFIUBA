# BASE DE DATOS - Clase 4
SQL es hoy en dia el estandar para la operacion de bases de datos relacionales.  
Como lenguaje de manipulacion de datos, es no procedural.

Hay que poder diferenciar una RELACION de una tabla en SQL, ya que la RELACION contiene un conjunto de restricciones que una tabla en SQL por defecto no tiene. Ej: restriccion de unicidad. 

SQL
El * es la proyeccion. Cuando pongo SELECT * tomo todos los atributos

PRIMARY KEY != UNIQUE. La PK sirve para ser referenciada de afuera. 
Ademas, UNIQUE puede ser NULL

No es obligatorio definir una PK, pero es recomendado hacerlo siempre

SELECT * FROM T1,T2,...,Tn realiza un producto cartesiano entre todos los elementos de las diferentes tablas

Si hago SELECT DISTINCT * ... realiza la misma accion pero elimina los repetidos

Cuando hago una consulta lo primero que tengo que pensar es que va en el FROM



> __Sintaxis__  

SELECT * 
FROM T1,T2,...,Tn 
WHERE [condition]

Es analogo a una proyeccion de todas las tuplas de un producto cartesiano en AR. __La diferencia es que la proyeccion de SQL no elimina filas repetidas (para eso necesito el DISTINCT)__

Funciones de agregacion son metodos que podemos agregar en el SELECT. No puedo agregar atributos (columnas) en el SELECT que no esten agregados en las funciones de agregacion si las tuviese. EJ: No puedo hacer

>SELECT *, SUM(Score)  
FROM Posts

Porque SUM(Score) me colapsa varios resultados en una sola fila, por lo que no puedo proyectar las demas con el *. 

Si puedo agregar mas funciones de agregacion


>SELECT AVG(Score), SUM(Score)  
FROM Posts

Tambien puedo agregar SUBCONSULTAS en el SELECT. EJ:  

>SELECT *, (SELECT COUNT( * ) FROM Posts WHERE ParentID = 928491)  
From Posts

- _CLAUSULA WHERE_

WHERE acepta las condiciones para filtrar resultados en la consulta. Acepta patrones para la comparacion.  
__'%'__ indica que puede ir cualquier combinacion de caracteres. Ej

__'_'__ indica que puede ir cualquier caracter (uno solo). Ej: WHERE apellido like '_essi'
