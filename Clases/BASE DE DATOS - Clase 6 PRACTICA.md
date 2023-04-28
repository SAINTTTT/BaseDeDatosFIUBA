# BASE DE DATOS - Clase 6 PRACTICA

## Repaso de dependencia funcional
El valor del atributo X identifica univocamente al valor de Y, es decir, que para dos tuplas con el mismo valor de X tienen que tener el mismo valor de Y

D.F Parcial es cuando solo una parte de la PK me permite identificar un atributo que depende funcionalmente

La clausura de X es todo lo que puedo deducir a partir de X
Suponiendo que B->C, la clausura transitiva de B son B y C (incluir B porque puedo deducirla a partir de B)

Una buena forma de encontrar DFs TRANSITIVAS es ver aquellas DFs que dependen de un atributo que no es clave

Cuando hago una descomposicion y no preservo la informacion, NO PIERDO tuplas pero si voy a generar nuevas tuplas que antes no estaban
NUNCA SE PIERDEN LAS TUPLAS 

La descomposicion va a preservar la informacion si se hace en base a una clave dependencia

17:03 ART se ve un ejemplo de como ver que formas normales posee una relacion
Una buena manera de encontrar la claves candidatas es calcular las clausuras transitivas

PRESERVAR INFORMACION quiere decir que si hago la union de todas las descomposicion proyectadas obtengo la relacion original

-------------------------------------------------------------------------------------------------

DEPENDENCIAS MULTIVALUADAS Y DE JUNTAS
Para el valor de un atributo de X existe un conjunto de posibles valores de Y que se relacionan univocamente con X

4 forma normal es cuando para toda dependencia multivaluada X->->Y, X es superclave

OBS: Si R esta en 4FN entonces esta tambien en FNBC




