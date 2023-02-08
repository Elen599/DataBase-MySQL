/*
1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Необходимые поля таблицы: product_name (название товара), manufacturer (производитель), product_count (количество), price (цена). Заполните БД произвольными данными.
2. Напишите SELECT-запрос, который выводит название товара, производителя и цену для товаров, количество которых превышает 2
3. Выведите SELECT-запросом весь ассортимент товаров марки “Samsung”.

4.* С помощью SELECT-запроса с оператором LIKE / REGEXP найти:
4.1 Товары, в которых есть упоминание "Iphone"
4.2 Товары, в которых есть упоминание "Samsung"
*/


CREATE TABLE `new_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) NOT NULL,
  `manufacturer` varchar(45) DEFAULT NULL,
  `product_count` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

INSERT INTO `` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUE (1, `Galaxy J5`, `Samsung`, `2`, `29 000`);
INSERT INTO `` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUE (2, `P70-T`, `Lenovo`, `7`, `15 000`);
INSERT INTO `` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUE (3, `Xperia X`, `Sony`, `4`, `29 000`);
INSERT INTO `` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUE (4, `8x`, `Samsung`, `5`, `30 000`);
INSERT INTO `` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUE (5, `ZenFone 5`, `ASUS`, `7`, `59 000`);
INSERT INTO `` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUE (6, `PRO95`, `Samsung`, `2`, `99 000`);
INSERT INTO `` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUE (7, `K8 K350E`, `LG`, `2`, `60 000`);
INSERT INTO `` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUE (8, `K5 X220ds`, `LG`, `9`, `29 000`);
INSERT INTO `` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUE (9, `FS506`, `Fly`, `5`, `55 000`);
INSERT INTO `` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUE (10, `FS506`, `Fly`, `8`, `33 000`);
INSERT INTO `` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUE (11, `Xperia Z5`, `Sony Xperia Z5`, `10`, `54 000`);
INSERT INTO `` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUE (11, `iphone 14`, `apple`, `1`, `154 000`);
INSERT INTO `` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUE (11, `iphone 14`, `apple`, `9`, `104 000`);


-- Подключение к базе данных:
USE cell_phones;

SELECT * FROM new_table;

-- SELECT-запрос, который выводит название товара, производителя и цену для товаров, количество которых превышает 2
SELECT price, product_name
FROM new_table
WHERE product_count >= 2;

-- SELECT-запрос, который выводит весь ассортимент товаров марки “Samsung”
SELECT * FROM new_table
WHERE manufacturer = "Samsung";

-- SELECT-запрос с помощью оператора LIKE 
SELECT product_name
FROM new_table
WHERE manufacturer like "Samsung";

-- SELECT-запроса с помощью оператора REGEXP
SELECT manufacturer
FROM new_table
WHERE product_name regexp "iphone";