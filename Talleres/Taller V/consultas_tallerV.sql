-- 1  Listar los bancos que tienen al menos un cajero automatico en la comuna 6 y 10
select nombre
from bancos b
where b.nombre in (select banco
			 from cajeros_automaticos ca
			 where (ca.comuna = 6 or ca.comuna=10));
			 
-- 2 Listar los bancos que no tienen presencia en Boedo
select nombre
from bancos b
where b.nombre not in (select banco
				 from cajeros_automaticos ca
				 where ca.barrio = 'Boedo');
				 

-- 3 Listar el id y nombre de los bancos que tienen cajeros autom´aticos sobre la avenida Corriente
select id, nombre
from bancos b
where b.nombre in (select banco
			 from cajeros_automaticos ca
			 where ca.calle ILIKE '%corrientes%');
			 

-- 4 Listar el banco que tiene la mayor cantidad de terminales de cajeros autom´aticos en ”Palermo"
select nombre
from bancos b
where b.nombre in (select banco
				   from cajeros_automaticos ca
				   where ca.barrio = 'Palermo'
				   group by banco
				   order by COUNT(terminales) desc
				   limit 1);
				   
-- 8 Listar el nombre de los bancos que tienen cajeros automaticos en todas las comunas.
select nombre
from bancos b
where not exists (select id
				  from comunas
				  
				  except
				  
				  select comuna
				  from cajeros_automaticos ca
				  where ca.banco = b.nombre);

-- 9 Listar el nombre de los bancos que tienen cajeros automaticos en todos los barrios de la comuna 15 
