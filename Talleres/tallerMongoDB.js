//AGREGACION
//a
db.country.aggregate(
                    [
                     {$match:{area:{$gt: 1000000} } }, 
                     {$sort: {area:-1}},
                     {$project: {"name":"$name.common", "area":1}}
                    ]
                    )
                    


//b Para los pa´ıses que tienen m´as de 4 pa´ıses lim´ıstrofes, mostrar solamente su nombre com´un como un campo de primer nivel.
db.country.aggregate(
                    [
                    {$project: {
                        "name":"$name.common",
                        "num_borders": {$size: "$borders"}
                                }
                    },
                    {$match: {
                        "num_borders": {$gt:4}
                            }
                    },
                    {$project: {
                        "name":1
                               }
                    
                    }

                    ] 
                    )
                    
//c Para los pa´ıses que tienen m´as de 4 pa´ıses lim´ıstrofes, mostrar todos sus campos, y adem´as su nombre com´un como un campo de primer nivel.
db.country.aggregate(
                    [
                    {$addFields: {
                        "name":"$name.common",
                        "num_borders": {$size: "$borders"}
                                }
                    },
                    {$match: {
                        "num_borders": {$gt:4}
                            }
                    }
                    ] 
                    )
                    
                    
//d Mostrar el nombre oficial, capital y regi´on, de los pa´ıses que tengan m´as de una moneda oficial, est´a encerrado solamente por tierra ´o su superficie tiene menos de 70.000 km cuadrados.
db.country.aggregate(
                    [
                    {$addFields: {
                        "ncurrencies":{$size:"$currency"}
                    }                        
                    },
                    {$match: {
                        $or:[
                        {"ncurrencies":{$gt:1}},
                        {"landlocked":true},
                        {"area": {$gt:70000}}
                        ]
                    }
                    },
                    {$project: {"officialName":"$name.official", "capital":1, "region":1}
                    }
                    ]
                    )
                    
                    
//e Mostrar para cada regi´on, el nombre de la misma y el ´area total de todo los paises que contiene.
db.country.aggregate(
                    [
                    {$group: {_id: "$region", area:{$sum: "$area"}}}
                    ]
                    )
                    
                    
//f Hacer un listado con los nombres de los libros y cada unos de los autores, por l´ınea.
db.books.aggregate(
                      [    
                          {$unwind:"$authors"},
                          {$project: {"title":1, "authors":1}}
                      ]
                  )