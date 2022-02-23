import names
import random
import psycopg2
# Создаем соединение к БД
conn = psycopg2.connect(dbname='qa_ddl_26_140',
                        user= 'padawan_user_140',
                        password='123',
                        host='159.69.151.133',
                        port='5056')
cursor = conn.cursor()

# Создаем таблицу python_employees в БД
if conn:
    print('Connected---------create table python_employees!')
    create_query =  'create table python_employees(' \
                    'id serial primary key,' \
                    'employee_name varchar(50)' \
                    ');'
    cursor.execute(create_query)
    conn.commit()

# Добавляем  30 записей в таблицу python_employees ( имена генерируем автоматически)
for i in range(0, 30):
    if conn:
        print('--- insert values into python_employees!   iteration = ', i+1)
        name = names.get_full_name(None)
        employee_name = "'" + name + "'"
        create_query_1 =  'insert into public.python_employees(' \
                        'employee_name' \
                        ')' \
                        'values(' + employee_name + ');'
        cursor.execute(create_query_1)
        conn.commit()

# Создаем таблицу python_roles
if conn:
    print('Connected---------create table python_roles!')
    create_query_2 =  'create table python_roles(' \
                    'id serial primary key,' \
                    'role_name varchar(50)' \
                    ');'
    cursor.execute(create_query_2)
    conn.commit()

#  Генерируем список профессий
role_1 = ['Junior ', 'Middle ', 'Senior ']
role_2 = ['Phyton developer', 'Java developer', 'JavaScript developer', 'Manual QA', 'QA Automation']
role_3 = []
for q in role_1:
    for w in role_2:
        role_3.append(q + w)

role_3.append('Designer')
role_3.append('HR')
role_3.append('CEO')
role_3.append('Sales manager')
role_3.append('Designer')
k = 1

# Добавляем записи в таблицу python_roles
for m in role_3:
    if conn:
        print('--- insert values into  python_roles!  iteration = ', k)
        role_name = "'" + m + "'"
        create_query_3 =  'insert into public.python_roles(' \
                        'role_name' \
                        ')' \
                        'values(' + role_name + ');'
        cursor.execute(create_query_3)
        conn.commit()
    k += 1

# Создаем таблицу python_roles_employee
if conn:
    print('Connected---------create table python_roles_employee!')
    create_query_4 =  'create table python_roles_employee(' \
                    'id serial primary key,' \
                    'employee_id int not null unique, ' \
                    'role_id int not null,' \
                    'foreign key (employee_id) ' \
                        'references public.python_employees (id), ' \
                    'foreign key (role_id) ' \
                        'references public.python_roles (id) ' \
                    ');'
    cursor.execute(create_query_4)
    conn.commit()

# Генерируем уникальные id для столбца employee_id для таблицы python_roles_employee (значения должны быть уникальными)
emp_id = random.sample(range(1,21),20)
count = 1

# Добавляем записи в таблицу python_roles_employee
for i in emp_id:
    if conn:
        print('--- insert values into python_roles_employee .  iteration = ', count)
        a =  str(i)
        b =  str(random.randint(1,20))
        create_query_5 =  'insert into public.python_roles_employee(' \
                        'employee_id,' \
                        'role_id' \
                        ')' \
                        'values('+ a + ' , ' + b + ');'
        cursor.execute(create_query_5)
        conn.commit()
    count += 1

cursor.close()
conn.close()