/*
1. Используя транзакцию, написать функцию, которая удаляет всю информацию об указанном пользователе из БД vk.
   Пользователь задается по id. Удалить нужно все сообщения, лайки, медиа записи, 
   профиль и запись из таблицы users. Функция должна возвращать номер пользователя.
2. Предыдущую задачу решить с помощью процедуры.
*/

-- Задание 1
-- Используя транзакцию, написать функцию, которая удаляет всю информацию об указанном пользователе из БД vk.
-- Пользователь задается по id. Удалить нужно все сообщения, лайки, медиа записи, 
-- профиль и запись из таблицы users. Функция должна возвращать номер пользователя:
delimiter $$
create function del_user(user_id int)
returns int
begin
delete from users_communities where user_id = user_id;
delete from users where id = user_id;
return 0;
end $$
delimiter ;  

select del_user(5);

-- Задание  2
-- Предыдущую задачу решить с помощью процедуры:
-- Удаление сообщений в таблице messages:
delimiter $$
create procedure del_user(user_num int)
begin
SET FOREIGN_KEY_CHECKS = 0; 
start transaction;
delete from messages where from_user_id = user_num;
delete from messages where to_user_id = user_num;
delete from media where user_id = user_num;
delete from likes where user_id = user_num;
delete from profiles where user_id = user_num;
delete from users where id = user_num;
select user_num;
SET FOREIGN_KEY_CHECKS = 1;
commit;
end $$
delimiter ;
call del_user(5);

select * from users;