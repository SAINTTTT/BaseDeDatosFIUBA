-- Parcialito de SQL

-- a) Mostrar el nombre del banco, barrio y la cantidad total de terminales de cajeros automaticos (de ese banco y barrio), de los cajeros automaticos de la comuna 10. Mostrar
-- todos los bancos; si un banco no tiene cajeros en ningun barrio de esa comuna, mostrar el nombre del banco y null en los otros 2 campos. Mostrar el resultado ordenado por
-- nombre de banco, de forma ascendente.

select ca.banco, ca.barrio, SUM(terminales) as total_terminales
from cajeros_automaticos ca right outer join bancos on ca.banco = bancos.nombre
where ca.comuna = 10
group by ca.banco, ca.barrio;
-- No me salio el primero. Se que de alguna forma tenia que realizar un join entre los bancos que cumplen la condicion pedida y los bancos que no la cumplen para 
-- que el join (left join era el que pretendia usar) me rellene con null los espacios de los bancos que no cumplian


-- b) Mostrar el nombre de los bancos que tienen cajeros automaticos en el barrio de “Palermo” pero no en los barrios “Paternal” y “Chacarita”.
(select ca.banco
from cajeros_automaticos ca
where ca.barrio = 'Palermo')

intersect 

(select ca.banco
from cajeros_automaticos ca
where ca.barrio <> 'Paternal' and ca.barrio <> 'Chacarita');

-- c) Mostrar el nombre del banco y la cantidad total de terminales de cajeros automaticos,
-- para todos los bancos en la que su cantidad total de terminales de cajeros automaticos
-- superen el promedio de terminales de cajeros automaticos por banco.

select ca1.banco, SUM(ca1.terminales) as total_terminales
from cajeros_automaticos ca1
group by ca1.banco
having SUM(ca1.terminales) > (select avg(ca2.terminales)
							 from cajeros_automaticos ca2
							 );

-- d) Mostrar el nombre, area y perımetro de los barrios que tienen mas de 3 gimnasios y mas de 33 cajeros automaticos.
select b.nombre, b.area, b.perimetro
from barrios b
where b.nombre in (select gym.barrio
				  from gimnasios gym
				  group by gym.barrio
				  having COUNT(gym.id) > 3)
				  
intersect

select b.nombre, b.area, b.perimetro
from barrios b
where b.nombre in (select ca.barrio
				  from cajeros_automaticos ca
				  group by ca.barrio
				  having sum(ca.terminales) > 33);
				  

-- e) Listar el id y nombre de los bancos con “de” ´o “S.A.” en su nombre que tienen cajeros automaticos de la red “LINK” en todas las comunas uni-barrio
select bancos.id, bancos.nombre
from bancos 
where bancos.nombre ILIKE '% de %' or bancos.nombre ILIKE '%S.A%'
and (bancos.nombre in (select ca.banco
					 from cajeros_automaticos ca
					 where ca.red ILIKE 'LINK'
					))
and (bancos.nombre in (select ca2.banco
					 from cajeros_automaticos ca2
					 group by ca2.banco, ca2.comuna
					 having COUNT(ca2.barrio) = 1));

