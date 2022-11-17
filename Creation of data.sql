# Создаем таблицы
# Создаем таблицу видов животных
CREATE TABLE animals (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,name VARCHAR (50));
# Создаем таблицу пород
CREATE TABLE variety (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,name VARCHAR (50),animals INT NOT NULL );
# Создаем таблицу окрасов
CREATE TABLE coloring(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,name VARCHAR (30));
# Создаем таблицу вакцин
CREATE TABLE vaccinations(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,name VARCHAR (30),animals INT NOT NULL,price DECIMAL(10,2) NOT NULL);
# Вносим данные в таблицы
#Виды животных
INSERT INTO animals(name)VALUES
('Кошка'),
('Собака'),
('Хомяк'),
('Морская свинка'),
('Попугай');
#Породы питомцев
#Добавляем породы кошек
INSERT INTO variety(name,animals)VALUES
('Сибирская',1),
('Сфинкс',1),
('Мейн-кун',1),
('Шотландская вислоухая',1),
('Бенгальская кошка',1),
('Сиамская кошка',1),
('Абиссинская',1),
('Русская голубая',1);
#Добавляем породы собак
INSERT INTO variety(name,animals)VALUES
('Боксер',2),
('Немецкая овчарка',2),
('Алабай',2),
('Коккер-спаниэль',2),
('Мопс',2),
('Французкий бульдог',2),
('Ирландский сеттер',2);
#Добавляем породы хомяков
INSERT INTO variety(name,animals)VALUES
('Обыкновенный',3),
('Джунгарский',3),
('Сирийский',3),
('Кэмпбелл',3);
#Добавляем породы морских свинок
INSERT INTO variety(name,animals)VALUES
('Агути',4),
('Альпака',4);
#Добавляем породы попугаев
INSERT INTO variety(name,animals)VALUES
('Волнистый',5),
('Какаду',5),
('Корелла',5),
('Розелла',5);
#Добавляем поле animals к таблице coloring(окрас)
ALTER TABLE coloring ADD COLUMN animals INT NOT NULL;
#Добавляем окрас
INSERT INTO coloring (name,animals) VALUES
#Добавляем окрас кошек
('Трехцветная',1),
('Рыжая',1),
('Белая',1),
('Черная',1),
#Добавляем окрас собак
('Тигровый',2),
('Белый',2),
('Черный',2),
('Палевый',2),
#Добавляем окрас Хомяков
('Буро-серый',3),
('Пепельный',3),
('Коричневый',3),
('Черный',3),
('Белый',3),
#Добавляем окрас морских свинок
('Коричневый',4),
('Черный',4),
('Белый',4),
#Добавляем окрас попугаев
('Зеленый',5),
('Синий',5);
#Добавляем названия вакцин
INSERT INTO vaccinations(name,animals,price)VALUES
('Прививки от чумки',2,300),
('Прививка от бешенства',2,10.23),
('Прививка от панлейкопениии',1,0.),
('Прививка от бешенства',1,20);


#Добавляам название кормов
CREATE TABLE feed (id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,name VARCHAR(250) NOT NULL,weight DECIMAL (6,3) NOT NULL,price DECIMAL(6,2)NOT NULL);
#Добавляем поле срок годности
#ALTER TABLE feed ADD COLUMN expiration_date DATE NOT NULL;
#ALTER TABLE feed ADD COLUMN quantity INT NOT NULL;
ALTER TABLE feed ADD COLUMN animals INT NOT NULL;

INSERT INTO feed(name,weight,price,animals)VALUES
('Hills корм сух для кошек курица',2,1998,1),
('Корм для собак farmina n&d беззерновой для здоровья кожи и шерсти сельдь с киноа',7,7998,2),
('Корм для хомячков Litttle One 400г',0.4,1100,3),
('Вака Люкс корм д/морских свинок 800г',0.8,2300,4),
('Корм для средних попугаев "Травел" 500гр',0.5,1234,5);
#Создаем таблицу вальеров
CREATE TABLE  valliers(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,name VARCHAR(30),area DECIMAL(3,2),start_date DATE,end_date DATE);
#Удаляем лишние поля
ALTER TABLE valliers DROP COLUMN start_date;
ALTER TABLE valliers DROP COLUMN end_date;
#Создаем таблицу аренды вальеров
CREATE TABLE valliers_date (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,valliers_id INT NOT NULL,start_date DATE,end_date DATE);
#Создаем таблицу владельцев
CREATE TABLE family(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,family VARCHAR(50));
#Добавляем владельцев
INSERT INTO family(family)VALUES
('Иванов'),
('Петров'),
('Худайбердыев');

#Меняем в вальерах площадь на обьем
ALTER TABLE valliers RENAME COLUMN area TO volume;
#Добавляем Вальеры
INSERT INTO valliers(name,volume)VALUES
('Собачий 1.5х1х0.8',1.62),
('Кошачий 0.8х0.8х0.8',0.512),
('Для грызунов 0.3х0.2х0.2',0.012),
('Для попугаев 0.3х0ю3х0.3',0.03);
#Создаем таблицу движения кормов
CREATE TABLE log_feed (id_log int AUTO_INCREMENT NOT NULL PRIMARY KEY,id_feed INT,sum DECIMAL(6.2),total_quantity DECIMAL(5.3),sale_date DATETIME DEFAULT CURRENT_TIMESTAMP);
#Закупки кошачьего корма
INSERT INTO  log_feed (id_feed,sum,total_quantity) SELECT feed.id,(feed.price*3),(feed.weight*3) from feed WHERE feed.id=1;
INSERT INTO  log_feed (id_feed,sum,total_quantity) SELECT feed.id,(feed.price*4),(feed.weight*4) from feed WHERE feed.id=1;
#Расход кошачьего корма
INSERT INTO  log_feed (id_feed,sum,total_quantity) SELECT feed.id,(feed.price*(-4)),(feed.weight*(-4)) from feed WHERE feed.id=1;
#Создаем таблицу питомцев
CREATE TABLE pets (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,name VARCHAR (20),id_animals INT NOT NULL,id_variety INT NOT NULL,id_coloring INT NOT NULL);
#Создаем Питомцев
INSERT INTO pets(name,id_animals,id_variety,id_coloring)VALUES
('Жужа',2,15,5),
('Лео',1,7,1),
('Марс',2,15,5);
#Создаем ти наполняем тпблицу виды операций с питомцами
CREATE TABLE operations(id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,name VARCHAR (30));
INSERT INTO operations(name)VALUES 
('Прибыл'),
('Убыл'),
('Закупка корма'),
('Кормление');
#Создаем таблицу движений питомцев
CREATE TABLE log_pets(id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,id_pet INT NOT NULL,oper_date DATETIME DEFAULT CURRENT_TIMESTAMP,id_vallier INT,id_oper INT);
INSERT INTO log_pets(id_pet,id_vallier,id_oper)VALUES
(1,1,1),
(2,2,1),
(3,1,1),
(1,1,2),
(2,2,2);
#Создание представлений числящихся питомцах и выбывших   
CREATE VIEW v AS SELECT id_pet, SUM(id_oper) AS 'sumoperations',MAX(oper_date) AS 'oper_date',MAX(id) AS log_id,max(id_oper) AS operations FROM log_pets 
    GROUP BY id_pet ;
CREATE VIEW pets_out AS SELECT * FROM v WHERE sumoperations>2;
CREATE VIEW pets_in AS SELECT * FROM v WHERE sumoperations<2;


  