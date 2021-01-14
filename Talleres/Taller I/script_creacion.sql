-- Table: public.paradas
DROP TABLE IF EXISTS colectivos_por_parada;
DROP TABLE IF EXISTS paradas;
CREATE TABLE public.paradas (
cod_parada integer     NOT NULL,
longitud   numeric 	   NOT NULL,
latitud    numeric 	   NOT NULL,
tipo_parada VARCHAR(50),
calle 	   VARCHAR(50),
altura     INT,
entre1     VARCHAR(50),
entre2     VARCHAR(50)
)

WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.paradas
    OWNER to postgres;
ALTER TABLE public.paradas ADD CONSTRAINT pk_paradas PRIMARY KEY(cod_parada);
	

CREATE TABLE public.colectivos_por_parada (
cod_parada INTEGER,
num_colectivo INTEGER NOT NULL
)

WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.colectivos_por_parada
    OWNER to postgres;
ALTER TABLE public.colectivos_por_parada ADD CONSTRAINT pk_colectivos_por_parada PRIMARY KEY(cod_parada, num_colectivo);
ALTER TABLE public.colectivos_por_parada ADD CONSTRAINT fk_colectivos_por_parada FOREIGN KEY(cod_parada) REFERENCES paradas(cod_parada) ON DELETE NO ACTION;
