/*
SQL – работа с несколькими таблицами
Задания выполнять на БД vk и с данными, которые сгенерировали ранее из скрипта _vk_db_seed.sql
1. Подсчитать количество групп, в которые вступил каждый пользователь.
2. Подсчитать количество пользователей в каждом сообществе.
3. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
который больше всех общался с выбранным пользователем (написал ему сообщений).
*/

-- Задание 1
-- Подсчитать количество групп, в которые вступил каждый пользователь:
select 
	CONCAT(firstname, ' ', lastname) AS participant,
	count(*) as group_num
from users 
join users_communities on users.id = users_communities.user_id
group by users.id
order by count(*) desc

-- Задание 2
-- Подсчитать количество пользователей в каждом сообществе:
select
	count(*) as 'количество пользователей',
	communities.name as 'сообщество'
from users_communities 
join communities on users_communities.community_id = communities.id
group by communities.id

-- Задание 3
-- Пусть задан некоторый пользователь. 
-- Из всех пользователей соц. сети найдите человека, 
-- который больше всех общался с выбранным пользователем (написал ему сообщений):
select 
	from_user_id as 'ID пользователя',
	concat(users.firstname, ' ', users.lastname) as 'Имя',
	count(*) as 'кол-во сообщений'
from messages 
join users on users.id = messages.from_user_id
where to_user_id = 1
group by from_user_id
order by count(*) desc
limit 1;