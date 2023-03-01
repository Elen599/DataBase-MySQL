# Удаляем сообщения пользователя
drop procedure if exists delete_mess;
delimiter $$
create procedure delete_mess(in local_id int, in local_name varchar(50), in local_last_name varchar(50) )
begin
delete from messenges
where from_user_id = local_id;
end$$
delimiter ;

call delete_mess(9, 'Frederick', 'Kilback');

select * from messenges;

-------------------------------------------------------------------------------
# Удаляем пользователя
drop procedure if exists delete_user;
delimiter $$
create procedure delete_user(in local_id int, in local_name varchar(50), in local_last_name varchar(50))
begin
delete from users
where id_user = local_id and
first_name = local_name and
last_name = local_last_name;
end$$
delimiter ;

call delete_user(3, 'Reuben', 'Windler');

select * from users;

------------------------------------------------------------------------------------
# Удаляем профиль
drop procedure if exists delete_user;
delimiter $$
create procedure delete_prof(in local_id int, in local_gender char(1), in local_birthday date)
begin
delete from profil
where id_profile = local_id and
gender = local_gender and
birthday = local_birthday;
end$$
delimiter ;

call delete_prof(3, 'm', '1994-06-15');

select * from profil;