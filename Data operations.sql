#Запрос на остаток кошачьего корма
SELECT feed.name,SUM (total_quantity) FROM log_feed RIGHT JOIN feed ON id_feed=feed.id WHERE log_feed.id_feed=1;
#Запрос на картотеку питомцев
SELECT pets.name As 'Кличка',animals.name As 'Вид',variety.name As 'Порода',coloring.name As 'Окрас' from pets
            LEFT JOIN animals 
            ON pets.id_animals=animals.id
            LEFT JOIN variety
            ON pets.id_variety=variety.id
            LEFT JOIN coloring
            ON pets.id_coloring=coloring.id
                  #Фильтр по виду
            #WHERE pets.id_animals=1
                  #Фильтр по породе
            #WHERE pets.id_variety=1
                  #Фильтр по окрасу
            #WHERE pets.id_coloring=1 
            ;
SELECT pets.name AS 'Кличка',pets_out.oper_date,operations.name AS 'Операция' from pets_out
    LEFT JOIN pets ON pets_out.id_pet=pets.id
    LEFT JOIN log_pets ON pets_out.operations=log_pets.id
    INNER JOIN operations on pets_out.operations=operations.id ;
    SELECT * FROM operations;