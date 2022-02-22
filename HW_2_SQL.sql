
--	Создать таблицу employees
-- id. serial,  primary key,
-- employee_name. Varchar(50), not null

create table employees(
	id serial primary key,
	employee_name varchar(50) not null
);

--	Наполнить таблицу employee 70 строками.
insert into employees (employee_name)
values ('Dima'),
		('Svetlana'),
		('Alex'),
		('Kate'),
		('Polina'),
		('Klim'),
		('Vadim'),
		('Ivan'),
		('Natasha'),
		('Andrey'),
		('Anna'),
		('Kristina'),
		('Dasha'),
		('Pavel'),
		('Maksim'),
		('Yana'),
		('Vova'),
		('Tatsiana'),
		('Klim'),
		('Vadim'),
		('Ivan'),
		('Natasha'),
		('Andrey'),
		('Anna'),
		('Kristina'),
		('Dasha'),
		('Pavel'),
		('Maksim'),
		('Yana'),
		('Vova'),
		('Tatsiana'),
		('Dima'),
		('Svetlana'),
		('Alex'),
		('Kate'),
		('Polina'),
		('Kristina'),
		('Dasha'),
		('Pavel'),
		('Maksim'),
		('Yana'),
		('Vova'),
		('Tatsiana'),
		('Dima'),
		('Svetlana'),
		('Alex'),
		('Kate'),
		('Polina'),
		('Kristina'),
		('Dasha'),
		('Pavel'),
		('Maksim'),
		('Yana'),
		('Vova'),
		('Tatsiana'),
		('Dima'),
		('Svetlana'),
		('Alex'),
		('Kate'),
		('Polina'),
		('Vova'),
		('Tatsiana'),
		('Dima'),
		('Svetlana'),
		('Alex'),
		('Kate'),
		('Polina'),
		('Kristina'),
		('Dasha'),
		('Pasha');

select * from employees;

-- Создать таблицу salary
-- id. Serial  primary key,
-- monthly_salary. Int, not null

create table salary (
	id serial primary key,
	monthly_salary int not null
);

-- Наполнить таблицу salary 16 строками:

insert into salary (monthly_salary) 
values  (1000),
		(1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400),
		(2500);

select * from salary;


-- Создать таблицу employee_salary
-- id. Serial  primary key,
-- employee_id. Int, not null, unique
-- salary_id. Int, not null

create table employee_salary (
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null 
);

-- Наполнить таблицу employee_salary 40 строками:
-- в 10 строк из 40 вставить несуществующие employee_id

insert into employee_salary (employee_id, salary_id)
values  (3, 7),
		(2, 5),
		(1, 3),
		(4, 10),
		(6, 12),
		(8, 4),
		(7, 13),
		(9, 1),
		(5, 2),
		(10, 11);
		(13, 7),
		(12, 5),
		(11, 3),
		(14, 10),
		(16, 12),
		(18, 4),
		(17, 13),
		(19, 1),
		(15, 2),
		(20, 11);
		(73, 7),
		(72, 5),
		(71, 3),
		(74, 10),
		(76, 12),
		(78, 4),
		(77, 13),
		(79, 1),
		(75, 2),
		(80, 11);
		(43, 7),
		(42, 5),
		(41, 3),
		(54, 10),
		(56, 12),
		(58, 4),
		(57, 13),
		(59, 1),
		(55, 2),
		(50, 11);
	
select * from employee_salary;


-- Создать таблицу roles
-- id. Serial  primary key,
-- role_name. int, not null, unique

create table roles (
	id serial primary key,
	role_name int not null unique
);


-- 8)	Поменять тип столба role_name с int на varchar(30)
alter table roles 
alter column role_name type varchar(30) using role_name::varchar(30);

-- Наполнить таблицу roles 20 строками:
insert into roles (role_name)
values  ('Junior Phyton developer'),
		('Middle Phyton developer'),
		('Senior Phyton developer'),
		('Junior Java developer'),
		('Middle Java developer'),
		('Senior Java developer'),
		('Junior JavaScript developer'),
		('Middle JavaScript developer'),
		('Senior JavaScript developer'),
		('Junior Manual QA developer'),
		('Middle Manual QA developer'),
		('Senior Manual QA developer'),
		('Project Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales Manager'),
		('Junior QA Automation developer'),
		('Middle QA Automation developer'),
		('Senior QA Automation developer');
		
select * from roles;
-- Создать таблицу roles_employee
-- id. Serial  primary key,
-- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- role_id. Int, not null (внешний ключ для таблицы roles, поле id)

create table roles_employee (
		id serial primary key,
		employee_id  int not null unique, 
		role_id int not null,
		foreign key (employee_id) 
			references employees (id),
		foreign key (role_id) 
			references roles (id)
			);
		
-- 	Наполнить таблицу roles_employee 40 строками:
insert into roles_employee (employee_id, role_id)
values  (1, 7),
		(2, 5),
		(3, 3),
		(4, 10),
		(5, 12),
		(6, 4),
		(7, 13),
		(8, 1),
		(12, 2),
		(13, 11),
		(9, 5),
		(10, 3),
		(11, 10),
		(15, 12),
		(16, 14),
		(17, 13),
		(18, 11),
		(20, 2),
		(19, 15),
		(22, 5),
		(23, 3),
		(24, 10),
		(25, 12),
		(26, 4),
		(27, 13),
		(28, 1),
		(32, 2),
		(33, 11),
		(52, 5),
		(43, 3),
		(44, 10),
		(55, 12),
		(66, 4),
		(67, 13),
		(68, 1),
		(62, 2),
		(70, 11),	
		(36, 7),
		(35, 5),
		(38, 3);
		
select * from roles_employee;