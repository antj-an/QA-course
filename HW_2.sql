
-- Создать таблицу employees: id. serial,  primary key; employee_name. Varchar(50), not null
create table employees(
	id serial primary key,
	employee_name varchar(50) not null
)

-- Наполнить таблицу employee 70 строками
insert into employees(employee_name)
values('Jeffrey Atkins'), 
	('Kelly Turner'),
	('Miguel Perez'),
	('Billy Bradley'),
	('Tony Coleman'),
	('Melvin Perez'),
	('Dorothy Bell'),
	('Dorothy Bell'),
      ('George Davis'),
      ('David Ramirez'),
      ('Peggy Perry'),
      ('Kathleen Lewis'),
      ('James Reynolds'),
      ('James Gonzalez'),
      ('Mildred Henderson'),
      ('Perry Perkins'),
      ('Thomas Anderson'),
	('William Jefferson'),
      ('Carol Barnes'),
      ('Kevin Long'),
      ('Thomas Sanchez'),
      ('Helen Porter'),
      ('James Wright'),
      ('Dianne Jones'),
      ('Thomas Soto'),
      ('Shirley Morgan'),
      ('Audrey Hamilton'),
      ('Mildred Smith'),
      ('Michael Hines'),
      ('Louise Byrd'),
      ('Paul Hudson'),
      ('Irma Salazar'),
      ('Nancy Ford'),
      ('Sheila Perez'),
      ('Wanda Jenkins'),
      ('Raymond Robertson'),
      ('Ronald Washington'),
      ('Tommy Price'),
      ('Chris Rodriguez'),
      ('Jacqueline Smith'),
      ('Lucille Barnett'),
      ('Gordon Robinson'),
      ('Ivan Washington'),
      ('John Parker'),
      ('Ronald Jenkins'),
      ('James Schmidt'),
      ('Chris Baker'),
      ('Daisy Wright'),
      ('Laurie Roy'),
      ('Alfred Johnson'),
      ('Sylvia Anderson'),
      ('Paul Butler'),
      ('Elizabeth Romero'),
      ('Wanda Cooper'),
      ('James Hernandez'),
      ('Frank Clark'),
      ('Ronald Murray'),
      ('John Harris'),
      ('Michele Simon'),
      ('Glady Davis'),
      ('Steve Porter'),
      ('John Taylor'),
      ('Michael Williams'),
      ('Pauline Garcia'),
      ('Emily Dunn'),
      ('Gregory Robertson'),
      ('Antonio Gutierrez'),
      ('Lynn Barnes'),
      ('Debra Hayes'),
      ('Yvonne Cummings');



-- Создать таблицу salary: id. Serial  primary key; monthly_salary. Int, not null
create table salary(
	id serial primary key,
	monthly_salary int not null
)

-- Наполнить таблицу salary 15 строками:
insert into salary(monthly_salary)
values(1000),
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


-- Создать таблицу employee_salary: id. Serial  primary key; employee_id. Int, not null, unique; salary_id. Int, not null
create table employee_salary(
	id serial primary key,
	employee_id int  not null unique,
	salary_id int not null
)

-- Наполнить таблицу employee_salary 40 строками: в 10 строк из 40 вставить несуществующие employee_id
insert into employee_salary(employee_id, salary_id)
values (16, 13), 
	 (36, 10), 
       (39, 8), 
       (34, 10), 
       (15, 4), 
       (37, 14), 
       (17, 7), 
       (1, 3), 
       (10, 10), 
       (23, 10), 
       (28, 13), 
       (3, 14), 
       (13, 6), 
       (35, 14), 
       (9, 1), 
       (32, 8), 
       (30, 15), 
       (6, 14), 
       (33, 13), 
       (19, 13), 
       (38, 7), 
       (8, 11), 
       (21, 1), 
       (24, 9), 
       (5, 7), 
       (20, 7), 
       (2, 8),
       (4, 13),
       (11, 6),
       (14, 11), 
       (89, 2), 
       (77, 13), 
       (99, 9), 
       (91, 14), 
       (100, 4), 
       (81, 1), 
       (78, 7), 
       (94, 12), 
       (86, 15), 
       (79, 2);
      
 



-- Создать таблицу roles: id. Serial  primary key; role_name. int, not null, unique
create table roles(
	id serial  primary key,
	role_name int not null unique
)

-- Поменять тип столба role_name с int на varchar(30)
alter table roles alter column role_name type varchar(50);

-- Наполнить таблицу roles 20 строками
insert into roles(role_name)
values ('Junior Python developer'),
       ('Middle Python developer'),
       ('Senior Python developer'),
       ('Junior Java developer'),
       ('Middle Java developer'),
       ('Senior Java developer'),
       ('Junior JavaScript developer'),
       ('Middle JavaScript developer'),
       ('Senior JavaScript developer'),
       ('Junior Manual QA engineer'),
       ('Middle Manual QA engineer'),
       ('Senior Manual QA engineer'),
       ('Project Manager'),
       ('Designer'),
       ('HR'),
       ('CEO'),
       ('Sales manager'), 
       ('Junior Automation QA engineer'),
       ('Middle Automation QA engineer'),
       ('Senior Automation QA engineer');




-- Создать таблицу roles_employee: id. Serial  primary key; employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id); role_id. Int, not null (внешний ключ для таблицы roles, поле id)
create table roles_employee(
	id serial  primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key(employee_id)
		references employees(id),
	foreign key(role_id)
		references roles(id)
)


-- Наполнить таблицу roles_employee 40 строками
insert into roles_employee(employee_id, role_id)
values (16, 1), 
	 (36, 11), 
       (39, 2), 
       (34, 12), 
       (15, 3), 
       (37, 13), 
       (17, 4), 
       (1, 14), 
       (10, 5), 
       (23,15), 
       (28, 6), 
       (3, 16), 
       (13, 7), 
       (35, 17), 
       (9, 18), 
       (32, 8), 
       (30, 19), 
       (6, 14), 
       (33, 20), 
       (19, 13), 
       (38, 7), 
       (8, 11), 
       (21, 1), 
       (24, 9), 
       (5, 7), 
       (20, 7), 
       (2, 8),
       (4, 13),
       (11, 6),
       (14, 1),
       (48, 7), 
       (68, 11), 
       (70, 10), 
       (54, 12), 
       (55, 7), 
       (62, 7), 
       (42, 8),
       (64, 13),
       (61, 6),
       (44, 1);