-- Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами
select employee_name, monthly_salary from employees
inner join employee_salary  
on employees.id = employee_salary.employee_id
inner join salary 
on salary.id = employee_salary.salary_id;

-- Вывести всех работников у которых ЗП меньше 2000
select employee_name, monthly_salary from employees
inner join employee_salary  
on employees.id = employee_salary.employee_id
inner join salary 
on salary.id = employee_salary.salary_id 
where monthly_salary < 2000;

-- Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employee_name, monthly_salary from employees
right join employee_salary  
on employees.id = employee_salary.employee_id
inner join salary 
on salary.id = employee_salary.salary_id
where employee_name is null;

-- Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employee_name, monthly_salary from employees
right join employee_salary  
on employees.id = employee_salary.employee_id
inner join salary 
on salary.id = employee_salary.salary_id
where employee_name is null and monthly_salary < 2000;

-- Найти всех работников кому не начислена ЗП
select employee_name from employees
left join employee_salary
on employees.id = employee_salary.employee_id
where employee_salary.salary_id is null;

-- Вывести всех работников с названиями их должности
select employee_name, role_name from employees
inner join roles_employee
on employees.id = roles_employee.employee_id 
inner join roles
on roles_employee.role_id = roles.id;

-- Вывести имена и должность только Java разработчиков
select employee_name, role_name from employees
inner join roles_employee
on employees.id = roles_employee.employee_id 
inner join roles
on roles_employee.role_id = roles.id
where roles.role_name like '%Java developer%';

-- Вывести имена и должность только Python разработчиков
select employee_name, role_name from employees
inner join roles_employee
on  employees.id = roles_employee.employee_id 
inner join roles
on roles_employee.role_id = roles.id
where roles.role_name like '%Python%';

-- Вывести имена и должность всех QA инженеров
select employee_name, role_name from employees
inner join roles_employee
on employees.id = roles_employee.employee_id
inner join roles
on roles_employee.role_id = roles.id
where roles.role_name like '%QA%'

-- Вывести имена и должность ручных QA инженеров
select employee_name, role_name from employees
inner join roles_employee
on employees.id = roles_employee.employee_id
inner join roles
on roles_employee.role_id = roles.id
where roles.role_name like '%QA%'
and roles.role_name not like '%Automation%';

-- Вывести имена и должность автоматизаторов QA
select employee_name, role_name from employees
inner join roles_employee
on employees.id = roles_employee.employee_id
inner join roles
on roles_employee.role_id = roles.id
where roles.role_name like '%Automation%';

--  Вывести имена и зарплаты Junior специалистов
select employee_name, monthly_salary, role_name from employees
inner join roles_employee
on employees.id = roles_employee.employee_id
inner join roles
on roles_employee.role_id = roles.id
inner join employee_salary
on employee_salary.employee_id = roles_employee.employee_id
inner join salary
on salary.id = employee_salary.salary_id
where roles.role_name like '%Junior%';

--  Вывести имена и зарплаты Middle специалистов
select employee_name, monthly_salary, role_name from employees
inner join roles_employee
on employees.id = roles_employee.employee_id
inner join roles
on roles_employee.role_id = roles.id
inner join employee_salary
on employee_salary.employee_id = roles_employee.employee_id
inner join salary
on salary.id = employee_salary.salary_id
where roles.role_name like '%Middle%';

-- Вывести имена и зарплаты Senior специалистов
select employee_name, monthly_salary, role_name from employees
inner join roles_employee
on employees.id = roles_employee.employee_id
inner join roles
on roles_employee.role_id = roles.id
inner join employee_salary
on employee_salary.employee_id = roles_employee.employee_id
inner join salary
on salary.id = employee_salary.salary_id
where roles.role_name like '%Senior%';

-- Вывести зарплаты Java разработчиков
select monthly_salary, role_name from salary
inner join employee_salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employee_salary.employee_id = roles_employee.employee_id
inner join roles
on roles_employee.role_id = roles.id 
where roles.role_name like '%Java developer%';

-- Вывести зарплаты Python разработчиков
select monthly_salary, role_name from salary
inner join employee_salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employee_salary.employee_id = roles_employee.employee_id
inner join roles
on roles_employee.role_id = roles.id 
where roles.role_name like '%Python developer%';

-- Вывести имена и зарплаты Junior Python разработчиков
select employee_name, monthly_salary, role_name from employees
inner join employee_salary
on employees.id = employee_salary.employee_id 
inner join salary
on employee_salary.salary_id = salary.id
inner join roles_employee
on employees.id = roles_employee.employee_id 
inner join roles
on roles_employee.role_id = roles.id 
where roles.role_name like '%Junior Python%';

-- Вывести имена и зарплаты Middle JS разработчиков
select employee_name, monthly_salary, role_name from employees
inner join employee_salary
on employees.id = employee_salary.employee_id 
inner join salary
on employee_salary.salary_id = salary.id
inner join roles_employee
on employees.id = roles_employee.employee_id 
inner join roles
on roles_employee.role_id = roles.id 
where roles.role_name like '%Middle JavaScript%';

-- Вывести имена и зарплаты Senior Java разработчиков
select employee_name, monthly_salary, role_name from employees
inner join employee_salary
on employees.id = employee_salary.employee_id 
inner join salary
on employee_salary.salary_id = salary.id
inner join roles_employee
on employees.id = roles_employee.employee_id 
inner join roles
on roles_employee.role_id = roles.id 
where roles.role_name like '%Senior Java developer%';

-- Вывести зарплаты Junior QA инженеров
select monthly_salary, role_name from salary
inner join employee_salary
on salary.id = employee_salary.salary_id
inner join roles_employee
on employee_salary.employee_id = roles_employee.employee_id 
inner join roles
on roles_employee.role_id = roles.id 
where roles.role_name like '%Junior%';

-- Вывести среднюю зарплату всех Junior специалистов
select avg(monthly_salary) from salary
inner join employee_salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employee_salary.employee_id = roles_employee.employee_id 
inner join roles
on roles_employee.role_id = roles.id 
where roles.role_name like '%Junior%';

-- Вывести сумму зарплат JS разработчиков
select sum(monthly_salary) from salary
inner join employee_salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employee_salary.employee_id = roles_employee.employee_id 
inner join roles
on roles_employee.role_id = roles.id 
where roles.role_name like '%JavaScript%';

-- Вывести минимальную ЗП QA инженеров
select min(monthly_salary) from salary
inner join employee_salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employee_salary.employee_id = roles_employee.employee_id 
inner join roles
on roles_employee.role_id = roles.id 
where roles.role_name like '%QA%';

-- Вывести максимальную ЗП QA инженеров
select max(monthly_salary) from salary
inner join employee_salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employee_salary.employee_id = roles_employee.employee_id 
inner join roles
on roles_employee.role_id = roles.id 
where roles.role_name like '%QA%';

-- Вывести количество QA инженеров
select count(role_id) from roles_employee
inner join roles
on roles_employee.role_id = roles.id
where roles.role_name like '%QA%';

-- Вывести количество Middle специалистов
select count(role_id) from roles_employee
inner join roles
on roles_employee.role_id = roles.id
where roles.role_name like '%Middle%';

-- Вывести количество разработчиков
select count(role_id) from roles_employee
inner join roles
on roles_employee.role_id = roles.id
where roles.role_name like '%developer%';

-- Вывести фонд (сумму) зарплаты разработчиков
select sum(monthly_salary) from salary
inner join employee_salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employee_salary.employee_id = roles_employee.employee_id
inner join roles
on roles_employee.role_id = roles.id 
where roles.role_name like '%developer%';

-- Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, monthly_salary from employees
inner join roles_employee
on employees.id = roles_employee.employee_id 
inner join roles
on roles_employee.role_id = roles.id 
inner join employee_salary
on roles_employee.employee_id = employee_salary.employee_id 
inner join salary
on employee_salary.salary_id = salary.id
order by salary.monthly_salary asc;

-- Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employee_name, role_name, monthly_salary from employees
inner join roles_employee
on employees.id = roles_employee.employee_id 
inner join roles
on roles_employee.role_id = roles.id 
inner join employee_salary
on roles_employee.employee_id = employee_salary.employee_id 
inner join salary
on employee_salary.salary_id = salary.id
where salary.monthly_salary between 1700 and 2300
order by salary.monthly_salary asc;

-- Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employee_name, role_name, monthly_salary from employees
inner join roles_employee
on employees.id = roles_employee.employee_id 
inner join roles
on roles_employee.role_id = roles.id 
inner join employee_salary
on roles_employee.employee_id = employee_salary.employee_id 
inner join salary
on employee_salary.salary_id = salary.id
where salary.monthly_salary < 2300
order by salary.monthly_salary asc;

-- Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name, role_name, monthly_salary from employees
inner join roles_employee
on employees.id = roles_employee.employee_id 
inner join roles
on roles_employee.role_id = roles.id 
inner join employee_salary
on roles_employee.employee_id = employee_salary.employee_id 
inner join salary
on employee_salary.salary_id = salary.id
where salary.monthly_salary = 1100 or salary.monthly_salary = 1500 or salary.monthly_salary = 2000
order by salary.monthly_salary asc;








