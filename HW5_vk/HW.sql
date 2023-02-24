/*
SQL – оконные функции

1. Создайте представление с произвольным SELECT-запросом из прошлых уроков [CREATE VIEW]
2. Выведите данные, используя написанное представление [SELECT]
3. Удалите представление [DROP VIEW]
4. Сколько новостей (записей в таблице media) у каждого пользователя? 
Вывести поля: news_count (количество новостей), user_id (номер пользователя), 
user_email (email пользователя). Попробовать решить с помощью CTE или с помощью обычного JOIN.
*/

-- Задание 1
-- Создайте представление с произвольным SELECT-запросом из прошлых уроков [CREATE VIEW]:
-- Вывести в таблицу только имя и фамилию пользователя:
create or replace view tab_data as
select lastname, firstname
from users;



-- Задание  2
-- Выведите данные, используя написанное представление [SELECT]:
select * from tab_data;

-- Задание 3
-- Удалите представление [DROP VIEW]:
drop view tab_data;

-- Задание  4
-- Сколько новостей (записей в таблице media) у каждого пользователя? 
-- Вывести поля: news_count (количество новостей), user_id (номер пользователя), 
-- user_email (email пользователя). Попробовать решить с помощью CTE или с помощью обычного JOIN.

-- Решение с помощью СТЕ:
with cte as (
	select 
		count(*) as news_count,
		user_id 
	from media 
	group by user_id
)
select 
	news_count,
	user_id,
	email
from cte
join users on id = cte.user_id;

-- Решение с помошью JOIN:
select count(*) as count_news,
	user_id,
	email
FROM users 
JOIN media on user_id = users.id 
GROUP BY user_id;