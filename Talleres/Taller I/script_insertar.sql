INSERT INTO public.colectivos_por_parada(
	cod_parada, num_colectivo)
	VALUES (null, 100);


INSERT INTO public.paradas (cod_parada, longitud, latitud, tipo_parada,
calle, altura, entre1, entre2)
	VALUES (1,1,1,'A','B',1,1,1);
	
	
-------------------------------------------------------------------------------
COPY public.paradas FROM '/home/aaron/pgadmin-datos/Taller I - Datos/paradas.csv' DELIMITER ';' CSV HEADER ENCODING 'LATIN 1';

COPY public.colectivos_por_parada FROM '/home/aaron/pgadmin-datos/Taller I - Datos/colectivosPorParada.csv' DELIMITER ';' CSV HEADER ENCODING 'LATIN 1';

----------------------------------------------------------------------------------