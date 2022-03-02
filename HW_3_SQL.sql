-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select  employees.employee_name, salary.monthly_salary  
from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary_id = salary.id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.
select  employees.employee_name, salary.monthly_salary  
from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary_id = salary.id
where salary.monthly_salary < 2000 
order by salary.monthly_salary;

 -- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
-- Вариант 1
select * 
from (select  employee_salary.employee_id , employees.employee_name  from employee_salary 
left join employees on employee_salary.employee_id = employees.id) as A
where A.employee_name is null;
-- Вариант 2
select employee_salary.id, employee_salary.employee_id , employees.employee_name  from employee_salary 
left join employees on employee_salary.employee_id = employees.id
where employee_name is null;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employee_salary.id, employee_salary.salary_id, employees.employee_name, salary.monthly_salary  from employee_salary 
left join employees on employee_salary.employee_id = employees.id
join salary on salary_id = salary.id
where employee_name is null and monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.
select employees.id,  employees.employee_name, employee_salary.salary_id  from employee_salary 
right join employees on employee_salary.employee_id = employees.id
where salary_id is null
order by id asc;

-- 6. Вывести всех работников с названиями их должности.
select employees.id,  employees.employee_name, roles.role_name  from employees
join roles_employee on employees.id = roles_employee.employee_id
join  roles on role_id = roles.id
order by id asc;

-- 7. Вывести имена и должность только Java разработчиков.
 select employees.id,  employees.employee_name, roles.role_name  from employees
join roles_employee on employees.id = roles_employee.employee_id
join  roles on role_id = roles.id
where role_name like '%Java %'
order by id asc;

-- 8. Вывести имена и должность только Python разработчиков.
 select employees.id,  employees.employee_name, roles.role_name  from employees
join roles_employee on employees.id = roles_employee.employee_id
join  roles on role_id = roles.id
where role_name like '%Phyton%'
order by id asc;

-- 9. Вывести имена и должность всех QA инженеров.
 select employees.id,  employees.employee_name, roles.role_name  from employees
join roles_employee on employees.id = roles_employee.employee_id
join  roles on role_id = roles.id
where role_name like '%QA%'
order by id asc;

-- 10. Вывести имена и должность ручных QA инженеров.
 select employees.id,  employees.employee_name, roles.role_name  from employees
join roles_employee on employees.id = roles_employee.employee_id
join  roles on role_id = roles.id
where role_name like '%Manual QA%'
order by id asc;

-- 11. Вывести имена и должность автоматизаторов QA
 select employees.id,  employees.employee_name, roles.role_name  from employees
join roles_employee on employees.id = roles_employee.employee_id
join  roles on role_id = roles.id
where role_name like '%QA Auto%'
order by id asc;

-- 12. Вывести имена и зарплаты Junior специалистов
select roles_employee.id, employee_name, role_name,  salary.monthly_salary  from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id
left join employee_salary on roles_employee.employee_id = employee_salary.employee_id
left join salary on employee_salary.salary_id = salary.id 
where role_name like '%Jun%'
order by 1;

-- 13. Вывести имена и зарплаты Middle специалистов
 select roles_employee.id, employee_name, role_name,  salary.monthly_salary  from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id
left join employee_salary on roles_employee.employee_id = employee_salary.employee_id
left join salary on employee_salary.salary_id = salary.id 
where role_name like '%Mid%'
order by 1;

-- 14. Вывести имена и зарплаты Senior специалистов
 select roles_employee.id, employee_name, role_name,  salary.monthly_salary  from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id
left join employee_salary on roles_employee.employee_id = employee_salary.employee_id
left join salary on employee_salary.salary_id = salary.id 
where role_name like '%Sen%'
order by 1;

-- 15. Вывести зарплаты Java разработчиков
  select roles_employee.id, employee_name, role_name,  salary.monthly_salary  from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id
left join employee_salary on roles_employee.employee_id = employee_salary.employee_id
left join salary on employee_salary.salary_id = salary.id 
where role_name like '%Java%'
order by 1;

--Вариант 2 без имен:
   select roles_employee.id,  role_name,  salary.monthly_salary  from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id
left join employee_salary on roles_employee.employee_id = employee_salary.employee_id
left join salary on employee_salary.salary_id = salary.id 
where role_name like '%Java%'
order by 1;

-- 16. Вывести зарплаты Python разработчиков
  select roles_employee.id, employee_name, role_name,  salary.monthly_salary  from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id
left join employee_salary on roles_employee.employee_id = employee_salary.employee_id
left join salary on employee_salary.salary_id = salary.id 
where role_name like '%Phyton%'
order by 1;

--Вариант 2 без имен:
  select roles_employee.id,  role_name,  salary.monthly_salary  from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id
left join employee_salary on roles_employee.employee_id = employee_salary.employee_id
left join salary on employee_salary.salary_id = salary.id 
where role_name like '%Phyton%'
order by 1;

-- 17. Вывести имена и зарплаты Junior Python разработчиков
  select roles_employee.id, employee_name, role_name,  salary.monthly_salary  from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id
left join employee_salary on roles_employee.employee_id = employee_salary.employee_id
left join salary on employee_salary.salary_id = salary.id 
where role_name like '%Junior Phyton%'
order by 1;

-- 18. Вывести имена и зарплаты Middle JS разработчиков
  select roles_employee.id, employee_name, role_name,  salary.monthly_salary  from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id
left join employee_salary on roles_employee.employee_id = employee_salary.employee_id
left join salary on employee_salary.salary_id = salary.id 
where role_name like '%Middle JavaS%'
order by 1;

-- 19. Вывести имена и зарплаты Senior Java разработчиков
  select roles_employee.id, employee_name, role_name,  salary.monthly_salary  from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id
left join employee_salary on roles_employee.employee_id = employee_salary.employee_id
left join salary on employee_salary.salary_id = salary.id 
where role_name like '%Senior Java%'
order by 1;

-- 20. Вывести зарплаты Junior QA инженеров
  select roles_employee.id, employee_name, role_name,  salary.monthly_salary  from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id
left join employee_salary on roles_employee.employee_id = employee_salary.employee_id
left join salary on employee_salary.salary_id = salary.id 
where role_name like '%Jun%QA%'
order by 1;

--вариант 2 (без имени)
  select roles_employee.id,  role_name,  salary.monthly_salary  from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id
left join employee_salary on roles_employee.employee_id = employee_salary.employee_id
left join salary on employee_salary.salary_id = salary.id 
where role_name like '%Jun%QA%'
order by 1;

-- 21. Вывести среднюю зарплату всех Junior специалистов
--выводим все
  select salary.monthly_salary from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%Junior%';

--выводим среднее значение
  select round(avg(salary.monthly_salary), 2) from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%Junior%';

-- 22. Вывести сумму зарплат JS разработчиков

--выводим все
  select salary.monthly_salary from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%JavaS%';

--выводим сумму

  select sum(salary.monthly_salary) from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%JavaS%';

-- 23. Вывести минимальную ЗП QA инженеров
--выводим все зп
 select salary.monthly_salary from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%QA%';

-- выводим минимальную 
 select min(salary.monthly_salary) from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%QA%';

-- 24. Вывести максимальную ЗП QA инженеров
 select max(salary.monthly_salary) from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%QA%';

-- 25. Вывести количество QA инженеров
select count(salary.monthly_salary) from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%QA%';

-- 26. Вывести количество Middle специалистов.
select count(salary.monthly_salary) from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%Middle%';

-- 27. Вывести количество разработчиков
  select count(salary.monthly_salary) from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%developer%';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(salary.monthly_salary) from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%developer%';

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employees.id, employees.employee_name, roles.role_name, salary.monthly_salary from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
order by monthly_salary ;

--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employees.id, employees.employee_name, roles.role_name, salary.monthly_salary from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where monthly_salary between 1700 and 2300
order by monthly_salary ;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employees.id, employees.employee_name, roles.role_name, salary.monthly_salary from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where monthly_salary < 2300
order by monthly_salary ;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employees.id, employees.employee_name, roles.role_name, salary.monthly_salary from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where monthly_salary in(1100, 1500, 2000)
order by monthly_salary ; 

