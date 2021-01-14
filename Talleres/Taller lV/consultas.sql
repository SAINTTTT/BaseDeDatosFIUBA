-- TALLER IV - SQL CONSULTAS

-- 1
select *
from paradas
limit 5;

select *
from colectivos_por_parada
limit 5;

-- 2 y 3
select DISTINCT calle
from paradas
where paradas.calle IS NOT NULL;

-- 4

select cod_parada, calle, altura
from paradas
order by cod_parada;

--- 5
SELECT paradas.cod_parada, paradas.calle||' '||paradas.altura AS direccion
FROM paradas;

-- 6 y 7-- Los valores null los trata como el maximo
select DISTINCT calle
from paradas
order by calle asc;

-- 8 Guardar en formato .csv la consulta. Irrelevante ahoraa
-- 9
drop table direcciones if exists
select cod_parada, calle, altura
into direcciones
from paradas;

--10
select cod_parada
from direcciones
where calle ILIKE '%rivadavia%';

--11
select cod_parada
from direcciones
where calle ILIKE '%rivadavia%'
and direcciones.altura < 1600;

--12
select cod_parada
from direcciones
where direcciones.altura = 850
and direcciones.calle ILIKE '%paseo colon%';

--13
select DISTINCT cod_parada
from paradas
where (paradas.entre1 ILIKE '%mexico%' OR paradas.entre2 ILIKE '%mexico%')
and (paradas.entre1 ILIKE '%chile%' OR paradas.entre2 ILIKE '%chile%')
and direcciones.calle ILIKE '%paseo colon%';

--14
select p.cod_parada, p.longitud
from paradas p
order by longitud desc
limit 1;

--15
select p.cod_parada, p.longitud
from paradas p
order by longitud asc
limit 1;

--16
select COUNT(cod_parada)
from paradas; --No hace falta hacer un group by

--17 Mostrar cuantas calles tienen alguna parada de colectivos en la ciudad
select COUNT(DISTINCT calle)
from paradas;

--18 Mostrar cuantas paradas de colectivos hay en la avenida Rivadavia.
select COUNT(*)
from paradas
where paradas.calle ILIKE '%rivadavia%';


-- 19 Obtener la paradas que comparten las lıneas 28 y 21.
(select p.cod_parada
from paradas p inner join colectivos_por_parada cpp using (cod_parada)
where cpp.num_colectivo = 21) 

intersect 

(select p.cod_parada
from paradas p inner join colectivos_por_parada cpp using (cod_parada)
where cpp.num_colectivo = 28)
order by cod_parada

-- 19 opcion 2
select cp1.cod_parada
from colectivos_por_parada cp1, colectivos_por_parada cp2
where cp1.num_colectivo = 21 and cp2.num_colectivo = 28
and cp1.cod_parada = cp2.cod_parada
order by cp1.cod_parada;


--20 Obtener la paradas de las lineas 28 y/o 21.
(select p.cod_parada
from paradas p inner join colectivos_por_parada cpp using (cod_parada)
where cpp.num_colectivo = 21) 

union DISTINCT

(select p.cod_parada
from paradas p inner join colectivos_por_parada cpp using (cod_parada)
where cpp.num_colectivo = 28)

--21 Obtener el ranking de la cantidad de paradas que hay por lınea de colectivo, ordenando de mayor a menor por dicha cantidad.
select cp.num_colectivo, COUNT(cod_parada) as cantidad_paradas
from colectivos_por_parada cp
group by cp.num_colectivo
order by 2 desc; 		-- Tambien puedo poner el cardinal de la columna (1 o 2, dependiendo la cantidad de filas que quiera mostrar) o puedo poner order by COUNT

-- 22 Idem al anterior, pero limitando el ranking a las l´ıneas cuya cantidad de paradas sea de al menos 100.
select COUNT(cod_parada) as cantidad
from colectivos_por_parada cp
group by cp.num_colectivo
having COUNT(cod_parada) >= 100		--Puedo renombrar el COUNT con un 'as' pero no lo puedo usar en el HAVING
order by cantidad desc;

-- 23 Mostrar el ranking de la cantidad de paradas que hay por avenida.
select p.calle, COUNT(cod_parada) as cantidad_paradas
from paradas p
where p.calle ILIKE '%av.%'
group by p.calle
order by cantidad_paradas desc;

-- 24 Obtener la cantidad de paradas que hay por cada tipo de parada.
select p.tipo_parada, COUNT(cod_parada) as cantidad_paradas
from paradas p
group by p.tipo_parada;

-- 25 Obtener las 5 calles con mayor cantidad de cuadras entre los dos extremos de sus paradas.
select calle, min(altura) min_altura, max(altura) max_altura
from paradas
where calle is not NULL   and   altura is not NULL
group by calle
order by (max(altura) - min(altura)) desc
fetch first 5 rows only;

-- 26 Mostrar la/las parada/s en que pare el mayor numero de colectivos
select cp.cod_parada, COUNT(num_colectivo) as cantidad_colectivos
from colectivos_por_parada cp
group by cp.cod_parada
order by cantidad_colectivos desc
limit 2;

-- 27 Obtener todos los pares (cod parada, num colectivo) tales que el numero el codigo de la parada no corresponda al numero de colectivo (es decir, el colectivo no pare en dicha parada).
-- La idea es tomar todas las combinaciones posibles - las combinaciones existentes = combinaciones que no existen
(select p.cod_parada, cpp.num_colectivo
from paradas p, colectivos_por_parada cpp)

except

(select cod_parada, num_colectivo
from colectivos_por_parada);



--28 Obtener todas las paradas que sean exclusivas, es decir, que sean para una sola lınea de colectivos.
select cp.cod_parada
from colectivos_por_parada cp
where cp.cod_parada in (select cp.cod_parada
					   from colectivos_por_parada cp
					   group by cp.cod_parada
					   having COUNT(cp.num_colectivo) = 1)
SELECT cod_parada
FROM colectivos_por_parada
GROUP BY cod_parada
HAVING COUNT(1)=1;

--29 Idem al anterior pero mostrando la direccion de dicha parada de colectivos
select p.cod_parada, p.calle, p.altura
from paradas p
where p.cod_parada in (select cp.cod_parada
					   from colectivos_por_parada cp
					   group by cp.cod_parada
					   having COUNT(cp.num_colectivo) = 1)

-- 30 Obtener las lıneas de colectivos que tengan todos los tipos de paradas.
select cp.num_colectivo
from colectivos_por_parada cp
where cp.cod_parada in (select cod_parada
					   from paradas
					   group by cod_parada
					   having COUNT(tipo_parada) = 3)


-- 31 Obtener los colectivos que, en todo su trayecto, no tengan paradas en ninguna avenida

SELECT distinct num_colectivo
FROM colectivos_por_parada
WHERE num_colectivo NOT IN (
	SELECT distinct c.num_colectivo
	FROM colectivos_por_parada c NATURAL JOIN paradas
	WHERE calle ILIKE '%av%'
)



-------------------------------------------------------------------------------------------
-- INNER JOIN
select *
from paradas p, colectivos_por_parada cp
where cp.cod_parada = p.cod_parada
order by num_colectivo; 

-- INNER JOIN CON NOMENCLATURA DE JOIN
select *
from paradas p inner join colectivos_por_parada cp on cp.cod_parada = p.cod_parada
order by num_colectivo; 

-- INNER JOIN CON NOMENCLATURA DE JOIN SI LAS COLUMNAS TIENEN EL MISMO NOMBRE (poner parentesis al nombre del atributo)
select *
from colectivos_por_parada cp inner join paradas p using (cod_parada)
order by num_colectivo; 
