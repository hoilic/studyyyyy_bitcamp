--221007 
--1����

select * from tab;
select * from user_sequences;
desc employees;

select * from employees;
select * from user_sequences;
SELECT * FROM jobs;

--ex1)
select employee_id,last_name, salary from employees;

--ex2)
select employee_id, last_name as "�� ��", salary as "�� ��" from employees;
select * from employees; --�� ������ �� �غ���

--ex3)
select employee_id as �����ȣ, last_name as "�� ��", salary*12 as "�� ��" from employees;

--ex4)
select first_name|| '  '|| last_name as "�� ��" from employees;

--����1)
select employee_id as �����ȣ, 
        first_name|| '  '|| last_name as "�� ��", 
        salary*12||'�޷�' as "�� ��" from employees;
--����2)
SELECT last_name||' is a '|| job_id as "Employee Detail" from employees; -- || ��ġ��

--ex5)
select distinct department_id from employees; -- distinct �ߺ�����

--ex6)
select last_name, hire_date, department_id 
from employees 
where department_id=10 or department_id=90;

--ex7)
select last_name, hire_date, salary
from employees
where salary>=2500 and salary<3500;

--����3)
select first_name||' '||last_name as �����,'$'|| salary as "�� ��", department_id as �μ��ڵ�
from employees
where (salary<=2500 or salary>=3000) and department_id=90;

--ex8)
select * from employees where last_name='King';
select * from employees where lower(last_name)='king';

--ex9)
select last_name, job_id, department_id
from employees
where job_id like '%MAN%';

--ex10)
select last_name, job_id, department_id
from employees
where job_id like 'IT%';

--ex11)
select last_name, salary, commission_pct
from employees
where commission_pct is not null;

select last_name, salary, commission_pct
from employees
where commission_pct is null;

--ex12)
select employee_id, last_name, job_id
from employees
where job_id='FI_MGR' or job_id='FI_ACCOUNT';

select employee_id, last_name, job_id
from employees
where job_id in('FI_MGR' ,'FI_ACCOUNT'); --in (  ,  ) �� or �� ���� ���̴�!!

--ex13) ) between������(and�������� �ٸ� ǥ��) : �ʰ�, �̸������� ����� �� ����
--�޿��� 10000�̻� 20000������ ����� �����ȣ, �̸�, �޿��� ����Ͻÿ� 
select employee_id, last_name, salary
from employees
where salary>=1000 and salary<=20000 order by 3;

select employee_id, last_name, salary
from employees
where salary between 10000 and 20000 order by 3;

--����4)] ����ID�� 'SA_REP' �̰ų� 'AD_PRES' �̸鼭 �޿��� 10,000�� �ʰ��ϴ� �������
-- �̸�, ����ID, �޿��� ����Ͻÿ�
select last_name as �̸�, job_id as ����ID, salary||'��' as �޿�
from employees
where job_id in('SA_REP', 'AD_PRES') and salary>10000;

--����5)
select distinct job_id from employees; --distinct �ߺ�����

--����6)
select employee_id as �����ȣ,
        first_name||' '||last_name as �̸�,
        hire_date as �Ի���
from employees
where hire_date like '05%'; -- hire date ǥ�� ����� yy�� mm�� dd��



-- 221011
-- 2����
SELECT * from tab;

-- ex1) �����, �μ�ID, �Ի����� �μ����� �������� �����Ͻÿ�
select last_name, department_id, hire_date 
from employees 
order by 2 desc;

--ex2) �����, �μ�ID, �Ի����� �μ����� �������� �����Ͻÿ� ���� �μ��� �������� �Ի��ϼ����� �����Ͻÿ�
select last_name, department_id, hire_date
from employees
order by 2 desc, 3 asc; 


select department_id from employees;-- �μ� ���
select count(department_id) from employees; --�μ����� ��106��
select DISTINCT department_id from employees; -- �ߺ��� ��ġ�� �� 12 ������ �μ�
select count (DISTINCT department_id) from employees; -- 11��, null ���� ���� -- distinct �� null ���� ���ش�.
select count (DISTINCT nvl(department_id, 0)) from employees; -- 12��, nvl �� ����ؼ� null ���� �����ض�
-- nvl �ȿ� null �� ������ �ȵȴ�???

-- ����1) 
select last_name as �̸� , salary*12 as ���� from employees
order by 2 desc;

-- ex1)�̸��� �ҹ��ڷ� �ٲ� �� �˻� 'Higgins'����� �����ȣ, �̸�, �μ���ȣ�� �˻��Ͻÿ�
select employee_id, last_name, department_id
from employees
where lower(last_name)='higgins';


-- ex2)10�� 3���� ���� ������ ���Ͻÿ�(mod)
select mod(10,3) from dual; -- dual �� ������ ���̺�

-- ex3)35765.357�� �ݿø�(round), ��ġ�� n�� �� n�� ����̸� (n+1)���� �ݿø��� �ǰ� n�� �����̸� n�� ��ġ���� �ݿø� �ȴ�
select round(35765.357, 2)from dual; -- 35765.36
select round(35765.357, 0)from dual; -- 35765
select round(35765.657, 0)from dual; -- 35766
select round(35765.357, -3)from dual; -- 36000
select round(35765.357, -4)from dual; -- 40000

-- ex4)35765.357�� ����(trunc) ��ġ�� n�� �� n�� ����̸� (n+1)���� ������ �ǰ� n�� �����̸� n�� ��ġ���� ���� �ȴ�
select trunc(35765.357, 2) from dual; -- 35765.35
select trunc(35765.357,0) from dual; --35765
select trunc(35765.357, -3) from dual; --35000

-- ex5) concat('���ڿ�1', '���ڿ�2) : ���ڿ��� ����(���ڿ�1+���ڿ�2)
select concat('Hello', 'World')from dual;

-- ex6) length('���ڿ�') : ���ڿ��� ���̸� ��ȯ / lengthb('���ڿ�') : ���ڿ��� byte �� ��ȯ
create table text(
str1 char(20),
str2 varchar2(20));

-- char : �������ڱ��� / varchar2 : �������ڱ���

insert into text(str1, str2) values('angel', 'anger');
insert into text(str1, str2) values('��õ��', '��õ��');
commit;
select lengthb(str1), lengthb(str2) from text;
select length(str1), length(str2) from text;

-- ex7)
select length('korea') from dual; -- 5
select length('�ڸ���') from dual; -- 3

select lengthb('korea') from dual; -- 5
select lengthb('�ڸ���') from dual; -- 9

-- ex8) ������ ���ڿ� ã�� : instr(ǥ����, ã�� ����, [��ġ]) ���: ��(��������), ����: ��
select instr('HelloWorld', 'W') from dual; -- 6
select instr('HelloWorld', 'o', -5) from dual; -- 5
select instr('HelloWorld', 'o', -1) from dual; -- 7

-- ����)2
select employee_id, 
concat(first_name,''||last_name) as NAME, 
length(concat(last_name, first_name)) as LENGTH 
from employees 
where substr(last_name,-1, 1) = 'n' ;

-- ex10) ������ ���� ������ ���� ���� ��� ��ġ�� �ִ����� ã�´� : width_bucket(ǥ����, �ּҰ�, �ִ밪, ����)

-- �ּ�-�ִ밪�� �����ϰ� 10���� ������ ���� �� ��ġ ã�� 0-100������ ������ ���� �� 74�� ���ԵǾ� �ִ� ������ ���° ���� ǥ���Ͻÿ�
select width_bucket(74, 0, 100, 10) from dual; -- 8

-- ex11) �������� : ltrim(��), rtrim(����), trim(����)
select rtrim('test ') || 'exam' from dual;

-- ex12) sysdate : �ý��ۿ� ������ �ð�ǥ��
select sysdate from dual;
select to_char(sysdate, 'YYYY"��" MM"��" DD"��"') as ���ó�¥ from dual;
select to_char(sysdate, 'HH"��" MI"��" SS"��"') as ���ó�¥ from dual;
select to_char(sysdate, 'HH24"��" MI"��" SS"��"') as ���ó�¥ from dual;

-- ex13) add_months(date, �޼�) : ��¥�� �޼� ���ϱ�
select add_months(sysdate, 7) from dual;

-- ex14) last_day(date) : �ش���� ������ ��
select last_day(sysdate) from dual;
select last_day('2004-02-01') from dual;
select last_day('2005-02-01') from dual;

-- ����3) ���ú��� �̹� �� ������ �� ���� ������ ���Ͻÿ�
select last_day(sysdate) - sysdate as "���� ��¥" from dual;

--ex15) months_between(date1, date2) : �� ��¥ ������ �� ��
select round(months_between('95-10-21', '94-10-20'), 0) from dual; -- �� �ڵ� ����ȯ

select last_name, to_char(salary, 'L99,999.00')
from employees
where last_name='King';

--ex16)
select to_char(to_date('97/9/30', 'YY-MM-DD') , 'YYYY-MON-DD') from dual; �� 2097
select to_char(to_date('97/9/30', 'RR-MM-DD') , 'RRRR-MON-DD') from dual; �� 1997

select to_char(to_date('17/9/30', 'YY-MM-DD') , 'YYYY-MON-DD') from dual; �� 2017
select to_char(to_date('17/9/30', 'RR-MM-DD') , 'RRRR-MON-DD') from dual; �� 2017

--����4)
select last_name, to_char(hire_date,'dd-mon-yyyy')as hire_date from employees where hire_date < '05-01-01'; 


--ex17) fm���� : ���İ� �����Ͱ� �ݵ�� ��ġ�ؾ���(fm - fm���̰��� ��ġ) /fm�� ǥ���ϸ� ���� ���� 0�� ��Ÿ���� �ʴ´�.
select last_name, hire_date from employees where hire_date='05/09/30';
select last_name, hire_date from employees where hire_date='05/9/30'; --05/09/30

select to_char(to_date('2011-03-01','YYYY-MM-DD'), 'YYYY-MM-DD') from dual; -- �� 2011-03-01
select to_char(to_date('2011-03-01','YYYY-MM-DD'), 'YYYY-fmMM-DD') from dual; -- �� 2011-3-1
select to_char(to_date('2011-03-01','YYYY-MM-DD'), 'YYYY-fmMM-fmDD') from dual; -- �� 2011-3-01

--ex18) count(�÷���), max(�÷���), min(�÷���), avg(�÷���), sum(�÷���) 
--�Լ� employees���̺��� �޿��� �ִ�, �ּ�, ���, ���� ���Ͻÿ�
--����) ����� �Ҽ���������, ���� ���ڸ����� �޸���� ��ǥ�� 
select max(salary),
min(salary),
trunc(avg(salary), 0),
to_char(sum(salary), 'L9,999,999') from employees;

-- ����5) Ŀ�̼�(commission_pct)�� ���� ���� ����� �ο����� ���Ͻÿ�
select commission_pct from employees where commission_pct is null;
select count(nvl(commission_pct, 0)) from employees where commission_pct is null;
select count(*) from employees where commission_pct is null;


-- ����6)
select employee_id as �����ȣ, last_name as �����, case
when salary<10000 then '�ʱ�'
when salary<20000 then '�߱�'
else '���'
end "����" 
from employees order by 3 , 2 ; -- �������� asc(��������) �������� desc

-- ����7)
select employee_id as �����ȣ, last_name as �̸�, salary as �޿�, nvl(commission_pct,0), 
to_char(salary*12+(salary*12*nvl(commission_pct,0)) ,'$9,999,999') as ���� 
from employees;

-- ����8)
select employee_ID, last_name, nvl(manager_id, 1000)
from employees;

-- ���ܹ���)
select sum(price) as �Ǹž� from sellings where created_at like '%2016-11%';

-- 221013

select to_char(trunc(avg(salary),0), '99,999') as ����޿���� from employees;

--ex5) inner join : ���� �ͳ����� ���� 
--������̺�� �μ����̺��� �μ��� ���� ��� �����ȣ, �μ���ȣ, �μ��̸��� ����Ͻÿ�

-- ���1(����Ŭ ���� ����)
select employee_id, employees.department_id, department_name
from employees, departments
where employees.department_id = departments.department_id;

-- ���2(����Ŭ ���� ����)
select employee_id,
    e.department_id,
    department_name
from employees e, departments d
where e.department_id = d.department_id;

-- ���3(Ansi ǥ��)
select employee_id, department_id, department_name
from employees
join departments using(department_id);

-- ����2) �μ����̺�(DEPARTMENTS d)�� ��ġ���̺�(LOCATIONS l)�� �����Ͽ� �μ��� ��ġ�� ���ø� �˾Ƴ��ÿ�
select department_id, city
from departments, locations
where departments.location_id = locations.location_id;

select department_id, city
from departments d, locations l
where d.location_id = l.location_id;

select department_id, city
from departments
join locations using(location_id);

-- ex6) outer join(left) : ���� ���̺��� ��� �����Ͽ� ���� 
-- ������̺�� �μ����̺��� �μ���ȣ�� ���� ����� �����Ͻÿ� �� 107���ڵ�

-- ���1(����Ŭ ���� ����)
select e.last_name, d.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+); --���� ���̺��� ��� ���ԵǾ� �����ѱ� ������ ���߶� + ���شٰ� ��������

--���2(Ansi ǥ��)
select last_name, department_id, department_name
from employees left join departments using(department_id);
-- departments �� ���� ���̺��� �����Ͽ� �����Ѵ� ��� ��������

-- ex7) outer join(right) : ������ ���̺��� ��� �����Ͽ� ����
-- ������̺�� �μ����̺��� �μ���ȣ�� ���� ����� �����Ͻÿ� �� 122 ���ڵ�
select e.last_name, d.department_id, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id;

select last_name, department_id, department_name
from employees right join departments using(department_id);



-- ex8) full join : ����, ������ ���̺��� ��� �����Ͽ� ����
--������̺�� �μ����̺��� �μ���ȣ�� ���� ����� �����Ͻÿ� �� 123���ڵ�

--���1(����Ŭ ���� ����) : ����
--���2(Ansiǥ��)
select last_name, department_id, department_name
from employees
full join departments using(department_id);



-- ex9) inner join : �� ���� �÷��� ��ġ �ϴ� ���
-- �μ�ID�� �Ŵ���ID�� ���� ����� ���� �Ͻÿ� �� 32 ���ڵ�
-- (���� ���̺� : departments, employees)
-- last_name department_id manager_id

-- ���1(����Ŭ ���� ����)
select e.last_name, d.department_id, d.manager_id 
from employees e, departments d
where e.department_id = d.department_id and e.manager_id = d.manager_id;

-- ���2(Ansiǥ��)
select last_name, department_id, manager_id
from employees
inner join departments using(department_id, manager_id);

-- ex10) ������ ������ �÷����� �ٸ� ��쿡 �������� �����ϱ�
 -- departments(location_id), locations2(loc_id)
 
 -- ���̺� ����
 create table locations2 as select*from locations;
 select * from locations2;
 alter table locations2 rename column location_id to loc_id;
 
 -- ���1(����Ŭ ���� ����)
select d.department_id, l.city
from departments d, locations2 l
where d.location_id=l.loc_id;

-- ���2(Ansi ǥ��)
select department_id, city
from departments
join locations2 on(location_id=loc_id);

-- ���3(Ansi ǥ��)
select department_id, city
from departments d
join locations2 l on(d.location_id=l.loc_id);


--ex14) n(����)���� ���̺��� ����
--����ID ���� ������� ����̸�, ��������, �μ��̸��� ����Ͻÿ�
--(EMPLOYEES, JOBS, DEPARTMENTS ���̺��� ����)

 select last_name, job_title, department_name
from employees
join departments using(department_id)
join jobs using(job_id);

-- ����3)
create table locations2 as select*from locations;
select * from locations2;
alter table locations2 rename column location_id to loc_id;
 
select last_name as ����̸�, city as ����, department_name as �μ��̸�
from employees
join departments using(department_id)
join locations2 on(location_id = loc_id)
where city = 'Seattle' or  city = 'Oxford' 
-- where city in(('Seattle', 'Oxford')
order by 2;
-- order by city;

-- ����4)
-- EMPLOYEES, LOCATIONS2, DEPARTMENTS, COUNTRIES

create table locations2 as select*from locations;
select * from locations2;
alter table locations2 rename column location_id to loc_id;

select  employee_id as �����ȣ , 
    last_name as ����̸�, department_name as �μ��̸�, city as ����, 
    street_address as �����ּ�, COUNTRY_NAME as �����̸� 
from employees
left join departments using(department_id)
join locations2 on(location_id = loc_id)
join COUNTRIES using(country_id)
where street_address like'%Ch%' 
    or  street_address like'%Sh%' 
    or street_address like'%Rd%'
order by 6, 4;

-- ex11) self ���� : �ڱ� �ڽ��� ���̺�� �����ϴ� ��� ����� �����ڸ� �����Ͻÿ�
select employee_id, manager_id, last_name from employees;
select employee_id, last_name from employees;

-- ���1
select e.employee_id as �����ȣ,
    e.last_name as ����̸�,
    m.last_name as ������
from employees e, employees m
where m.employee_id=e.manager_id;

-- ���2
select e.employee_id as �����ȣ,
    e.last_name as ����̸�,
    m.last_name as ������
from employees e
join employees m on(m.employee_id=e.manager_id);


-- ex12) cross join : ��� �࿡ ���� ������ ��� ������ �����ϴ� ����
select *from countries, locations;
select * from countries CROSS join locations;


-- ex13) Non Equijoin (�� ��ť����)
--�÷����� ���� ��찡 �ƴ� ������ ���ϴ��� ���θ� Ȯ�� �� ��
--on ( �÷��� between �÷���1 and �÷���2)

create table salgrade(
salvel varchar2(2),
lowst number, highst number); 

insert into salgrade values('A', 20000, 29999);
insert into salgrade values('B', 10000, 19999);
insert into salgrade values('C', 0, 9999);
commit;

select * from salgrade;

select last_name, salary, salvel
from employees
join salgrade on(salary between lowst and highst)
order by salary desc;


--ex14) n(����)���� ���̺��� ����
--����ID ���� ������� ����̸�, ��������, �μ��̸��� ����Ͻÿ�
--(EMPLOYEES, JOBS, DEPARTMENTS ���̺��� ����)

select last_name, job_title, department_name
from employees
join departments using(department_id)
join jobs using(job_id);

create table employees_role as select * from employees where 1=0; 
select * from employees;
select * from employees_role;

insert into employees_role values(101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568',
'1989-09-21', 'AD_VP', 17000.00, NULL, 100, 90);
insert into employees_role values(101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568',
'1989-09-21', 'AD_VP', 17000.00, NULL, 100, 90);
insert into employees_role values(101, 'Nee', 'Ko', 'NKOCHHAR', '515.123.4568',
'1989-09-21', 'AD_VP', 17000.00, NULL, 100, 90);
insert into employees_role values(200, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568',
'1989-09-21', 'AD_VP', 17000.00, NULL, 100, 90);
insert into employees_role values(200, 'Nee', 'Kochhar', 'NKOCHHAR', '515.123.4568',
'1989-09-21', 'AD_VP', 17000.00, NULL, 100, 90);
insert into employees_role values(300, 'GilDong', 'Hong', 'NKOCHHAR', '010-123-4567',
'2009-03-01', 'IT_PROG', 23000.00, NULL, 100, 90);


-- ex1) union 
-- employee_id, last_name�� ���� ��� �ߺ����� �Ͻÿ� �� 110 ���ڵ�
select employee_id, last_name from employees
union
select employee_id, last_name from employees_role;

-- ex2) union all
-- employee_id, last_name�� ���� ��� �ߺ��� ��� �Ͻÿ� �� 113 ���ڵ�
select employee_id, last_name from employees
union all
select employee_id, last_name from employees_role;

select salary from employees where department_id=10
union all
select salary from employees where department_id=30 order by 1;

-- ex3) minus
--employees_role�� �ߺ��Ǵ� ���ڵ�� �����ϰ� employees���� �ִ� �������� ���Ͻÿ�
--(��, employee_id, last_name�� ǥ��) �� 106 ���ڵ�

select employee_id, last_name from employees
minus
select employee_id, last_name from employees_role;

-- ex4) intersect
-- employees�� employees_role���� �ߺ��Ǵ� ���ڵ��� �������� ���Ͻÿ�
-- (��, employee_id, last_name�� ǥ��) �� 1 ���ڵ�

select employee_id, last_name from employees
intersect
select employee_id, last_name from employees_role;


-- [����1] employees�� employees_role���� ���ڵ��� �������� ���Ͻÿ�
-- ����1) ����̸�, ����ID, �μ�ID�� ǥ���Ͻÿ�
-- ����2) employees ������ �μ�ID�� 10�� ����� �˻�
-- employees_role������ ����ID�� IT_PROG�� �˻�
-- ����3) �ߺ��Ǵ� ���ڵ�� ����

select last_name as ����̸�, job_id as ����ID, department_id as �μ�ID 
from employees where department_id=10
union
select last_name, job_id, department_id from employees_role where job_id='IT_PROG';

-- ex5) SET operator�� IN operator����
-- job_title�� 'Stock Manager' �Ǵ� 'Programmer'�� ������� ������ job_title�� ǥ���Ͻÿ�

-- 221017

--5����

-- ex1)Neena ����� �μ����� �˾Ƴ��ÿ�
select department_id from employees where first_name='Neena';
select department_id from departments where department_id=90;

select department_name from departments
where department_id = (select department_id from employees where first_name='Neena');

--ex2)Neena ����� �μ����� Neena ������� �޿��� ���� �޴� ������� 
-- last_name, department_id, salary ���Ͻÿ� (90, 17000)
select last_name, department_id, salary
from employees
where department_id = (select department_id from employees where first_name='Neena')
 and salary > (select salary from employees where first_name='Neena');
 
 
 
 
 -- ����1) �����޿��� �޴� ������� �̸��� �޿��� ���Ͻÿ�
 
 select last_name, department_id, salary from employees order by 3;
 
 select last_name, salary 
 from employees 
 where salary = (select min(salary) from employees );
 
 
 
 
 -- ����2) �μ��� �޿� �հ� �� �ִ�޿��� �޴� �μ��� �μ���� �޿��հ踦 ���Ͻÿ�
select max(sum(salary)) from employees -- 304500, �μ��� �߿��� ���� ū ��
group by department_id;

select department_name, sum(salary) from employees
join departments using(department_id)
group by department_name
having sum(salary) = 304500;

select department_name, sum(salary) from employees
join departments using(department_id)
group by department_name
having sum(salary) = (select max(sum(salary)) from employees 
group by department_id);





-- ex3) Austin�� ���� �μ��̸鼭 ���� �޿��� �޴� ������� �̸�, �μ���, �޿��� ���Ͻÿ� (60�μ�, 4800�޷�)
select last_name, department_name, salary
from employees
left join departments using(department_id)
where department_id = (select department_id from employees where last_name='Austin')
 and
salary = (select salary from employees where last_name='Austin');




-- ex4) 'ST_MAN' ���޺��� �޿��� ���� 'IT_PROG' ������ last_name, job_id, salary �������� ��ȸ�Ͻÿ�

select last_name, job_id, salary
from employees
where job_id='ST_MAN'; --5800,6500,7900,8000,8200

select last_name, job_id, salary
from employees
where job_id = 'IT_PROG' and
 salary >any (select salary from employees where job_id='ST_MAN');
 
 -- ����3)'IT_PROG' ���� �� ���� ���� �޴� ����� �޿����� �� ���� �޿��� �޴� 'FI_ACCOUNT' �Ǵ�
-- 'SA_REP' ���� �������� ��ȸ�Ͻÿ�
-- ����1) �޿� ������ �������� �����Ͻÿ�
-- ����2) �޿��� ���ڸ� ���� �޸�(,) ��� ȭ����� '������ ���̽ÿ�
-- ����3) Ÿ��Ʋ�� �����, ����ID, �޿��� ǥ���Ͻÿ�

select last_name, job_id, salary
from employees
where job_id = 'IT_PROG'; -- 4200~9000

select last_name as �����, job_id as ����ID, to_char(salary, '999,999' )||'��' as �޿�
from employees
where job_id  in('FI_ACCOUNT','SA_REP') and
salary >= any(select salary from employees where job_id = 'IT_PROG') order by 3 desc;





-- ex5) 'IT_PROG'�� ���� �޿��� �޴� ������� �̸�, ����ID, �޿��� ���� ���Ͻÿ�

select last_name, job_id, salary
from employees
where salary in(select salary from employees where job_id='IT_PROG');




-- ex6) ��ü������ ���� �����ڿ� ������ �����ϴ� ǥ�ø� �Ͻÿ�

--���1
select employee_id as �����ȣ, last_name as �̸�, 
case
    when employee_id in (select manager_id from employees) then '������' 
    else '����' 
    end as ����
from employees
order by 3,1;

--���2
select employee_id as �����ȣ, last_name as �̸�, '������' as ����
from employees
where employee_id in (select manager_id from employees)
union
select employee_id as �����ȣ, last_name as �̸�, '����' as ����
from employees
where employee_id not in (select manager_id from employees where manager_id is not null)
order by 3,1;

--���3
select employee_id as �����ȣ, last_name as �̸�, '������' as ����
from employees e
where exists (select null from employees where e.employee_id=manager_id)
union
select employee_id as �����ȣ, last_name as �̸�, '����' as ����
from employees e
where not exists (select null from employees where e.employee_id=manager_id)
order by 3, 1;



-- ����4)] �ڱ� ����id(job_id)�� ��ձ޿��� �޴� �������� ��ȸ�Ͻÿ�
-- ����1) ��ձ޿��� 100���� ���� �����ϰ� �޿��� ���ڸ����� �޸�, $ǥ��
-- ����2) ����̸�(last_name), ����id(job_id), ����(job_title), �޿�(salary) �� ǥ���Ͻÿ�
-- ����3) �޿������� �������� �����Ͻÿ�

select job_id, trunc(avg(salary), -3) 
from employees group by job_id;

select last_name as ����̸�, 
        job_id as ����id, 
        job_title as ����,  
        to_char(salary,'$999,900') as  �޿�
from employees
join jobs using(job_id)
where (job_id, salary) in (select job_id, trunc(avg(salary), -3) 
from employees group by job_id) order by 4;

--221018
--5����

--ex7) group by rollup : a, b�� ����(Subtotal ���ϱ�)
--�μ���, ����ID�� �޿���ձ��ϱ�(���Ϻμ��� ���� ������ ��ձ޿�)
--����1) �ݿø��ؼ� �Ҽ� 2°�ڸ����� ���Ͻÿ�
--����2) ������ Job_title, Department_name, Avg_sal�� ǥ���Ͻÿ�

select department_name, job_title, round(avg(salary),2) as "Avg_sal"
from employees
join departments using(department_id)
join jobs using(job_id)
group by rollup(department_name, job_title);

--ex8) group by cube : a�� ���� �Ǵ� b�� ����
--�μ���, ����ID�� �޿���ձ��ϱ�(�μ��� �������� ��Ÿ���� ��ձ޿�) 

select department_name, job_title, round(avg(salary), 2) as "Avg_sal"
from employees
join departments using(department_id)
join jobs using(job_id)
group by cube(department_name, job_title);


--ex9) group by grouping sets
--������ ��ձ޿��� ��ü����� ��ձ޿��� �Բ� ���Ͻÿ�


select last_name,job_title, round(avg(salary), 2) as "Avg_sal"
from employees
join departments using(department_id)
join jobs using(job_id)
group by grouping sets((last_name),(job_title),()); -- �� () All Rows�� ��Ȱ All Rows : ��ü ���� ��Ÿ����

-- 221018
-- 6����


--ex1) ���̺� : test
create table test(
id number(5),
name char(10),
address varchar2(50));


-- ex2) ���̺� : user1
create table user1(
idx number primary key,
id varchar2(10) unique,
name varchar2(10) not null,
phone varchar2(15),
address varchar2(50),
score number(6,2) check(score >= 0 and score <= 100),
subject_code number(5),
hire_date date default sysdate,
marriage char(1) default 'N' check(marriage in('Y', 'N')));


--ex3) �������� Ȯ��
select constraint_name, constraint_type
from user_constraints --user_constraints : �������� 
where table_name='USER1';

select *
from user_constraints
where table_name='USER1';

-- ex4) ���̺�
create table user2(
idx number constraint PKIDX primary key,
id varchar2(10) constraint UNID unique,
name varchar2(10) constraint NOTNAME not null, 
phone varchar2(15),
address varchar2(50),
score number(6,2) constraint CKSCORE check(score >= 0 and score <= 100), --check �� ������ �־���Ѵ�.
subject_code number(5),
hire_date date default sysdate,
marriage char(1) default 'N' constraint CKMARR check(marriage in('Y','N'))); 
-- as�� �̸��� ���̵� ���������� constraint �� ����Ͽ� �̸� Ȯ��

-- ex5) �������� Ȯ��
select constraint_name, constraint_type
from user_constraints
where table_name='USER2';

select *
from user_constraints
where table_name='USER2';


--ex6) �߰�
insert into user1(idx,id,name,phone,address,score,subject_code,hire_date,marriage)
values(1,'aaa','kim','010-000-0000','����',75,100,'2010-08-01','Y');

insert into user1(idx,id,name,phone,address,score,subject_code,hire_date,marriage)
values(1,'aaa','kim','010-000-0000','����',75,100,'2010-08-01','Y');
�� ���Ἲ�������ǿ� ����(����: idx 1 �ߺ�)

insert into user1(idx,id,name,phone,address,score,subject_code,hire_date,marriage)
values(2,'aaa','kim','010-000-0000','����',75,100,'2010-08-01','Y');
�� ���Ἲ�������ǿ� ����(����: id aaa �ߺ�)

insert into user1(idx,id,name,phone,address,score,subject_code,hire_date,marriage)
values(2,'bbb','','010-000-0000','����',75,100,'2010-08-01','Y');
�� NULL�� ("HR"."USER1"."NAME") �ȿ� ������ �� �����ϴ�

insert into user1(idx,id,name,phone,address,score,subject_code,hire_date,marriage)
values(2,'bbb','lee','010-000-0000','����',120,100,'2010-08-01','Y');
�� üũ �������ǿ� ����Ǿ����ϴ�(����: score�� 0~100������ �� �̾����)

insert into user1(idx,id,name,phone,address,score,subject_code,hire_date,marriage)
values(2,'bbb','lee','010-000-0000','����',75,100,'2010-08-01','K');
�� üũ �������ǿ� ����Ǿ����ϴ�(����:marriage�� Y �Ǵ� N�̾����)

insert into user1(idx,id,name,phone,address,score,subject_code,hire_date,marriage)
values(2,'bbb','lee','010-000-0000','����',75,100,'2010-08-01','N');


-- ex7) ���̺� ��� Ȯ��
select * from tab;


-- ex8) ���̺��� ����Ȯ��
select * from user1;
select * from user2;


-- ex9) ���̺��� ���� Ȯ��
desc user1; (= describe user1)

-- ex10) ������ ��� Ȯ��
select * from user_sequences;

-- ex11) ���̺�� ���� : test �� user3
alter table test rename to user3;

-- ex12) �÷� �߰� : user3 �� phone varchar2(15)
alter table user3 add phone varchar2(15);
desc user3;

select *from user3;

-- ex13) �������� �߰� : user3 �� id�� unique, �������Ǹ� UID2
alter table user3 add constraint UID2 unique(id);

select constraint_name, constraint_type
from user_constraints
where table_name='USER3';

select *
from user_constraints
where table_name='USER3'; --��������Ȯ��

select constraint_name, constraint_type
from user_constraints
where table_name='USER3'; --�������ǵ��� ���� �̸����� Ȯ��

-- ex14) �������� ���� - alter table ���̺�� drop constraint �������Ǹ�;
alter table user3 drop constraint UID2;
alter table user3 DROP constraint SYS_C007693;

select *
from user_constraints
where table_name='USER3';

-- ex15) �÷� �߰� : user3 �� no number (PK ����)
alter table user3 add no number primary key;
desc user3;

from user_constraints
where table_name='USER3';

select constraint_name, constraint_type
from user_constraints
where table_name='USER3'; 


-- ex16) ���� ���� : user3 �� name char(10) �� varchar2(10)�� �ٲ�
alter table user3 modify name varchar2(10);
desc user3;


-- ex17) �÷� ���� : user3 �� address
alter table user3 drop column address;
desc user3;

select * from user3;

-- ex18) ���̺���� / ���������: user3
drop table user3;
purge recyclebin;  -- ������ ����

drop table user1 purge; -- �����뿡 ���� �ʰ� �ٷ� ����
select * from user1;

drop table user2;
show recyclebin; --������ ����

flashback table user2 to before drop; -- �����뿡�� �ǻ츮��
select * from user2;
select * from recyclebin; --�����뿡 ���̺� ���� �˻�

-- ex19) ������ ���� / ����
create sequence idx_sql increment by 2 start with 1 maxvalue 9 cycle nocache;
-- 1����~9���� 2�� �����ϴ� idx_sql �������� ������ 
select idx_sql.nextval from dual; -- ���� �������� ǥ��(nextval)
select idx_sql.currval from dual; -- ���� �������� ǥ��(currtval)
select * from user_sequences;

drop sequence idx_sql;




--221019
--6����

-- ex20) ���̺� ������ ������ ����
create table book(
no number primary key,
subject varchar2(50),
price number, year date);

create sequence no_seq increment by 1 start with 1 nocycle nocache;


insert into book(no, subject, price, year)
values(no_seq.nextval, '����Ŭ ������ �����ϱ�', 10000, sysdate);
insert into book(no, subject, price, year)
values(no_seq.nextval, '�ڹ� 3�� �ϼ�', 15000, '2007-03-01');
insert into book values(no_seq.nextval, 'JSP ���� �Ǳ�', 18000, '2010-01-01');

select * from book;

--ex21) ���̺� ������ ����
create table user3 as select * from user2 where 1=0;
desc user3;
select * from user3;

-- USER2���� ���������� 5���� ���δ�
select constraint_name, constraint_type, search_condition
from user_constraints
where table_name='USER2';

select constraint_name, constraint_type, search_condition
from user_constraints
where table_name='USER3';

-- ex22) ���̺�(idx �� bunho, name �� irum, address �� juso) �� �����ϰ� id�� bbb�� ���ڵ带 �����Ͻÿ�
�������̺� : user1 / �纻���̺� : user4

create table user1(
idx number primary key,
id varchar2(10) unique,
name varchar2(10) not null,
phone varchar2(15),
address varchar2(50),
score number(6,2) check(score >= 0 and score <= 100),
subject_code number(5),
hire_date date default sysdate,
marriage char(1) default 'N' check(marriage in('Y', 'N')));

create table user4(bunho, irum, juso)
as select idx, name, address from user1 where id='bbb';

select * from user1;
select * from user4;

--ex23) ���̺� ���� �� �� �߰�
--���̺�� : dept
--deptno number �� �⺻Ű, �������Ǹ�(DNO)
--dname varcahr2(30) �� �� ��� �ȵ�, �������Ǹ�(DNAME)
--���̺�� : emp
--empno number �� �⺻Ű, �������Ǹ�(ENO)
--ename varchar2(30) �� �� ��� �ȵ�, �������Ǹ�(ENAME)
--deptno number �� �ܷ�Ű, �������Ǹ�(FKNO), ������͸� �����ϰ� �����ϴ� �����ʹ� NULL�� �ٲ�

create table dept(
deptno number constraint DNO primary key,
dname varchar2(30) constraint DNAME not null);

create table emp(
empno number constraint ENO primary key,
ename varchar2(30) constraint ENAME not null,
deptno number, 
constraint FKNO foreign key(deptno) references dept on delete set null);
-- �������Ǹ� : constraint FKNO
-- �ܷ�Ű : foreign key(deptno) references dept
-- on delete set null : �����ϰ� �����͸� NULL �� �ٲ�

insert into dept(deptno, dname) values(10, '���ߺ�');
insert into dept(deptno, dname) values(20, '������');
insert into dept(deptno, dname) values(30, '������');
insert into dept(dname) values(40, '�渮��');
�� ORA-00913: ���� ���� �ʹ� �����ϴ�
insert into dept(deptno, dname) values(40, '�渮��');

select * from dept;

insert into emp(empno, ename, deptno) values(100, 'ȫ�浿', 10);
insert into emp(empno, ename, deptno) values(101, '���̾�', 20);
insert into emp(empno, ename, deptno) values(102, 'Ʃ��', 50);
�� 50���μ� ����(���Ἲ������������)-�θ�Ű�� �����ϴ�
insert into emp(empno, ename, deptno) values(103, '����ġ', 40);
insert into emp(empno, ename) values(105, '���ε�');
insert into emp(ename, deptno) values('��', 10); �� primary key�� NULL��� ����
-- primary key �� empno�� ������ ������ �Է½� �־���Ѵ�.
-- primary key  �� ���� ���� �ȵǰ� ������ ���翩�� �Ѵ� 
-- ename �� not null ���� ���� ���� �ϹǷ� ������ �Է½� �־�� �Ѵ�.
-- deptno �� �����ϴ� �����Ͱ�, null�� ��������� ������� �ȴ�.

commit;
--ex24) ����
delete from dept;
select * from dept;
rollback;
select * from dept;

delete from dept where deptno=40;
select * from dept; -- 40�� �μ� ����
select * from emp; -- 40�� �μ� �÷��� (null)�� ����

--ex25) ����(update)
--emp���̺� ���ε� ����� �μ���ȣ�� 30���� �����Ͻÿ�
update emp set deptno=30 where ename='���ε�';
select * from emp;
commit;





--221020