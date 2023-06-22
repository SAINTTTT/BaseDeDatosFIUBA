# RESUMEN PRACTICAS

## MONGO DB
Trabajamos con Binary JSON (BSON). La diferencia es que tienen tipos de datos predefinidos y son menos que la cantidad que acepta JSON.

NO hay joins  
JOIN -> EMBEDDED DOCUMENT

A diferencia de SQL, para crear dos "tablas" (aqui llamadas COLECCIONES) simplemente alcanza con:

```mongodb
db.createCollection("conductores")
db.createCollection("autos")
```

Con estas instrucciones creo las colecciones de "autos" y "conductores". Es mas simple que SQL ya que no tengo que indicar ni keys, ni atributos, etc.. (schema-less)

> **ES FUNDAMENTAL EL CONCEPTO DE DOCUMENTOS EMBEBIDOS**

UN **SHARD** es un pedazo de la DB donde distribuyo los datos. Cada SHARD tiene un nodo primario y varios secundarios en el caso que se caiga el primero.

CONSULTAS BASICAS:

```mongodb
db.<collection>.find(<query>, <proejection>)
.sort(<order>)
.limit(N)


//Esto es como un SELECT * FROM tweets
db.tweets.find() 

//Limito a 5 resultados
db.tweets.find().limit(5)

//Busco con una condicion (en este caso, por id)
db.tweets.find({"_id" : "11123464awefeaw"})

//Busco el mismo documento con ese _id, pero no quiero ver el _id en el resultado. Uso la 
//proyeccion. Ademas le indico que si quiero ver el campo "user"
db.tweets.find({"_id" : "11123464awefeaw"}, {"_id" : 0, "user" : 1})

//Con el '0' indico que no quiero un campo, con el '1' le digo que si.

//Con la proyeccion tambien puedo renombrar campos
db.tweets.find({"_id" : "11123464awefeaw"}, {"user_first_name" : "$user.name"})

```


BUSQUEDA CONDICIONAL
```mongodb
//OR
db.tweets.find({ $or: [
    {"user_id : "Juan"},
    { retweet_count : 2183}
]})


//AND
db.tweets.find({ $and: [
    {"user_id : "19872394"},
    { retweet_count : 2183}
]})


//Para el AND tengo la alternativa de escribir directamente las condiciones 
db.tweets.find({ user_id : "Juan", retweet_count : 2183})


//eq - gt - gte - lt - lte
db.tweets.find({ retweet_count : { $gte : 2183}})


```
