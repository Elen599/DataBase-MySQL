/*Cоставить Select-запросы на основе БД vk, 
  которую можно восстановить из скрипта vk_db_seed.sql 
  (файл vk_db_seed.sql находится в этой же папке).*/

--Задание 1
-- С помощью [ORDER BY] вывести список имен только firstname пользователей без повторений в алфавитном порядке:
select firstname from users
ORDER BY firstname;

-- Задание 2
-- Выведите количество мужчин старше 35 лет [COUNT]:
select *
from profiles 
where 
     TIMESTAMPDIFF(year, birthday, NOW()) > 35
     and gender = 'm';

-- Задание 3
--Сколько заявок в друзья в каждом статусе? (таблица friend_requests) [GROUP BY]:
select status, count(*) as application
from friend_requests
group by status;

-- Задание 4
-- Выведите номер пользователя, который отправил больше всех заявок в друзья (таблица friend_requests) [LIMIT]:
select count(*) as user_num
from friend_requests
group by initiator_user_id
order by  user_num desc
limit 1;

-- Задание 5
-- Выведите названия и номера групп, имена которых состоят из 5 символов [LIKE]:
select id, name 
from communities 
where name LIKE '_____';