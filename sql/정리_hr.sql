--221007 
--1일차

select * from tab;
select * from user_sequences;
desc employees;

select * from employees;
select * from user_sequences;
SELECT * FROM jobs;

--ex1)
select employee_id,last_name, salary from employees;

--ex2)
select employee_id, last_name as "이 름", salary as "급 여" from employees;
select * from employees; --위 지문과 비교 해보기

--ex3)
select employee_id as 사원번호, last_name as "이 름", salary*12 as "연 봉" from employees;

--ex4)
select first_name|| '  '|| last_name as "이 름" from employees;

--문제1)
select employee_id as 사원번호, 
        first_name|| '  '|| last_name as "이 름", 
        salary*12||'달러' as "연 봉" from employees;
--문제2)
SELECT last_name||' is a '|| job_id as "Employee Detail" from employees; -- || 합치다

--ex5)
select distinct department_id from employees; -- distinct 중복제거

--ex6)
select last_name, hire_date, department_id 
from employees 
where department_id=10 or department_id=90;

--ex7)
select last_name, hire_date, salary
from employees
where salary>=2500 and salary<3500;

--문제3)
select first_name||' '||last_name as 사원명,'$'|| salary as "연 봉", department_id as 부서코드
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
where job_id in('FI_MGR' ,'FI_ACCOUNT'); --in (  ,  ) 은 or 과 같은 뜻이다!!

--ex13) ) between연산자(and연산자의 다른 표현) : 초과, 미만에서는 사용할 수 없다
--급여가 10000이상 20000이하인 사원의 사원번호, 이름, 급여를 출력하시오 
select employee_id, last_name, salary
from employees
where salary>=1000 and salary<=20000 order by 3;

select employee_id, last_name, salary
from employees
where salary between 10000 and 20000 order by 3;

--문제4)] 업무ID가 'SA_REP' 이거나 'AD_PRES' 이면서 급여가 10,000를 초과하는 사원들의
-- 이름, 업무ID, 급여를 출력하시오
select last_name as 이름, job_id as 업무ID, salary||'원' as 급여
from employees
where job_id in('SA_REP', 'AD_PRES') and salary>10000;

--문제5)
select distinct job_id from employees; --distinct 중복제거

--문제6)
select employee_id as 사원번호,
        first_name||' '||last_name as 이름,
        hire_date as 입사일
from employees
where hire_date like '05%'; -- hire date 표기 방법이 yy년 mm월 dd일



-- 221011
-- 2일차
SELECT * from tab;

-- ex1) 사원명, 부서ID, 입사일을 부서별로 내림차순 정렬하시오
select last_name, department_id, hire_date 
from employees 
order by 2 desc;

--ex2) 사원명, 부서ID, 입사일을 부서별로 내림차순 정렬하시오 같은 부서가 있을때는 입사일순으로 정렬하시오
select last_name, department_id, hire_date
from employees
order by 2 desc, 3 asc; 


select department_id from employees;-- 부서 목록
select count(department_id) from employees; --부서개수 총106개
select DISTINCT department_id from employees; -- 중복을 합치면 총 12 종류의 부서
select count (DISTINCT department_id) from employees; -- 11개, null 값을 빼서 -- distinct 는 null 값을 빼준다.
select count (DISTINCT nvl(department_id, 0)) from employees; -- 12개, nvl 을 사용해서 null 값을 포함해라
-- nvl 안에 null 을 넣으면 안된다???

-- 문제1) 
select last_name as 이름 , salary*12 as 연봉 from employees
order by 2 desc;

-- ex1)이름을 소문자로 바꾼 후 검색 'Higgins'사원의 사원번호, 이름, 부서번호를 검색하시오
select employee_id, last_name, department_id
from employees
where lower(last_name)='higgins';


-- ex2)10을 3으로 나눈 나머지 구하시오(mod)
select mod(10,3) from dual; -- dual → 가상의 테이블

-- ex3)35765.357을 반올림(round), 위치가 n일 때 n이 양수이면 (n+1)에서 반올림이 되고 n이 음수이면 n의 위치에서 반올림 된다
select round(35765.357, 2)from dual; -- 35765.36
select round(35765.357, 0)from dual; -- 35765
select round(35765.657, 0)from dual; -- 35766
select round(35765.357, -3)from dual; -- 36000
select round(35765.357, -4)from dual; -- 40000

-- ex4)35765.357을 내림(trunc) 위치가 n일 때 n이 양수이면 (n+1)에서 내림이 되고 n이 음수이면 n의 위치에서 내림 된다
select trunc(35765.357, 2) from dual; -- 35765.35
select trunc(35765.357,0) from dual; --35765
select trunc(35765.357, -3) from dual; --35000

-- ex5) concat('문자열1', '문자열2) : 문자열의 결합(문자열1+문자열2)
select concat('Hello', 'World')from dual;

-- ex6) length('문자열') : 문자열의 길이를 반환 / lengthb('문자열') : 문자열의 byte 를 반환
create table text(
str1 char(20),
str2 varchar2(20));

-- char : 고정문자길이 / varchar2 : 가변문자길이

insert into text(str1, str2) values('angel', 'anger');
insert into text(str1, str2) values('사천사', '사천사');
commit;
select lengthb(str1), lengthb(str2) from text;
select length(str1), length(str2) from text;

-- ex7)
select length('korea') from dual; -- 5
select length('코리아') from dual; -- 3

select lengthb('korea') from dual; -- 5
select lengthb('코리아') from dual; -- 9

-- ex8) 지정한 문자열 찾기 : instr(표현식, 찾는 문자, [위치]) 양수: 앞(생략가능), 음수: 뒤
select instr('HelloWorld', 'W') from dual; -- 6
select instr('HelloWorld', 'o', -5) from dual; -- 5
select instr('HelloWorld', 'o', -1) from dual; -- 7

-- 문제)2
select employee_id, 
concat(first_name,''||last_name) as NAME, 
length(concat(last_name, first_name)) as LENGTH 
from employees 
where substr(last_name,-1, 1) = 'n' ;

-- ex10) 임의의 값이 지정된 범위 내에 어느 위치에 있는지를 찾는다 : width_bucket(표현식, 최소값, 최대값, 구간)

-- 최소-최대값을 설정하고 10개의 구간을 설정 후 위치 찾기 0-100까지의 구간을 나눈 후 74가 포함되어 있는 구간이 몇번째 인지 표시하시오
select width_bucket(74, 0, 100, 10) from dual; -- 8

-- ex11) 공백제거 : ltrim(왼), rtrim(오른), trim(양쪽)
select rtrim('test ') || 'exam' from dual;

-- ex12) sysdate : 시스템에 설정된 시간표시
select sysdate from dual;
select to_char(sysdate, 'YYYY"년" MM"월" DD"일"') as 오늘날짜 from dual;
select to_char(sysdate, 'HH"시" MI"분" SS"초"') as 오늘날짜 from dual;
select to_char(sysdate, 'HH24"시" MI"분" SS"초"') as 오늘날짜 from dual;

-- ex13) add_months(date, 달수) : 날짜에 달수 더하기
select add_months(sysdate, 7) from dual;

-- ex14) last_day(date) : 해당달의 마지막 날
select last_day(sysdate) from dual;
select last_day('2004-02-01') from dual;
select last_day('2005-02-01') from dual;

-- 문제3) 오늘부터 이번 달 말까지 총 남은 날수를 구하시오
select last_day(sysdate) - sysdate as "남은 날짜" from dual;

--ex15) months_between(date1, date2) : 두 날짜 사이의 달 수
select round(months_between('95-10-21', '94-10-20'), 0) from dual; -- ← 자동 형변환

select last_name, to_char(salary, 'L99,999.00')
from employees
where last_name='King';

--ex16)
select to_char(to_date('97/9/30', 'YY-MM-DD') , 'YYYY-MON-DD') from dual; ← 2097
select to_char(to_date('97/9/30', 'RR-MM-DD') , 'RRRR-MON-DD') from dual; ← 1997

select to_char(to_date('17/9/30', 'YY-MM-DD') , 'YYYY-MON-DD') from dual; ← 2017
select to_char(to_date('17/9/30', 'RR-MM-DD') , 'RRRR-MON-DD') from dual; ← 2017

--문제4)
select last_name, to_char(hire_date,'dd-mon-yyyy')as hire_date from employees where hire_date < '05-01-01'; 


--ex17) fm형식 : 형식과 데이터가 반드시 일치해야함(fm - fm사이값만 일치) /fm를 표시하면 숫자 앞의 0을 나타나지 않는다.
select last_name, hire_date from employees where hire_date='05/09/30';
select last_name, hire_date from employees where hire_date='05/9/30'; --05/09/30

select to_char(to_date('2011-03-01','YYYY-MM-DD'), 'YYYY-MM-DD') from dual; -- ← 2011-03-01
select to_char(to_date('2011-03-01','YYYY-MM-DD'), 'YYYY-fmMM-DD') from dual; -- ← 2011-3-1
select to_char(to_date('2011-03-01','YYYY-MM-DD'), 'YYYY-fmMM-fmDD') from dual; -- ← 2011-3-01

--ex18) count(컬럼명), max(컬럼명), min(컬럼명), avg(컬럼명), sum(컬럼명) 
--함수 employees테이블에서 급여의 최대, 최소, 평균, 합을 구하시오
--조건) 평균은 소수이하절삭, 합은 세자리마다 콤마찍고 ￦표시 
select max(salary),
min(salary),
trunc(avg(salary), 0),
to_char(sum(salary), 'L9,999,999') from employees;

-- 문제5) 커미션(commission_pct)을 받지 않은 사원의 인원수를 구하시오
select commission_pct from employees where commission_pct is null;
select count(nvl(commission_pct, 0)) from employees where commission_pct is null;
select count(*) from employees where commission_pct is null;


-- 문제6)
select employee_id as 사원번호, last_name as 사원명, case
when salary<10000 then '초급'
when salary<20000 then '중급'
else '고급'
end "구분" 
from employees order by 3 , 2 ; -- 오름차순 asc(생략가능) 내림차순 desc

-- 문제7)
select employee_id as 사원번호, last_name as 이름, salary as 급여, nvl(commission_pct,0), 
to_char(salary*12+(salary*12*nvl(commission_pct,0)) ,'$9,999,999') as 연봉 
from employees;

-- 문제8)
select employee_ID, last_name, nvl(manager_id, 1000)
from employees;

-- 예외문제)
select sum(price) as 판매액 from sellings where created_at like '%2016-11%';

-- 221013

select to_char(trunc(avg(salary),0), '99,999') as 사원급여평균 from employees;

--ex5) inner join : 같은 것끼리만 조인 
--사원테이블과 부서테이블에서 부서가 같을 경우 사원번호, 부서번호, 부서이름을 출력하시오

-- 방법1(오라클 전용 구문)
select employee_id, employees.department_id, department_name
from employees, departments
where employees.department_id = departments.department_id;

-- 방법2(오라클 전용 구문)
select employee_id,
    e.department_id,
    department_name
from employees e, departments d
where e.department_id = d.department_id;

-- 방법3(Ansi 표준)
select employee_id, department_id, department_name
from employees
join departments using(department_id);

-- 문제2) 부서테이블(DEPARTMENTS d)과 위치테이블(LOCATIONS l)을 연결하여 부서가 위치한 도시를 알아내시오
select department_id, city
from departments, locations
where departments.location_id = locations.location_id;

select department_id, city
from departments d, locations l
where d.location_id = l.location_id;

select department_id, city
from departments
join locations using(location_id);

-- ex6) outer join(left) : 왼쪽 테이블은 모두 포함하여 조인 
-- 사원테이블과 부서테이블에서 부서번호가 같은 사원을 조인하시오 → 107레코드

-- 방법1(오라클 전용 구문)
select e.last_name, d.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+); --왼쪽 테이블은 모두 포함되어 있으닌까 우측이 모잘라서 + 해준다고 생각하자

--방법2(Ansi 표준)
select last_name, department_id, department_name
from employees left join departments using(department_id);
-- departments 의 왼쪽 테이블을 포함하여 조인한다 라고 생각하자

-- ex7) outer join(right) : 오른쪽 테이블은 모두 포함하여 조인
-- 사원테이블과 부서테이블에서 부서번호가 같은 사원을 조인하시오 → 122 레코드
select e.last_name, d.department_id, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id;

select last_name, department_id, department_name
from employees right join departments using(department_id);



-- ex8) full join : 왼쪽, 오른쪽 테이블을 모두 포함하여 조인
--사원테이블과 부서테이블에서 부서번호가 같은 사원을 조인하시오 → 123레코드

--방법1(오라클 전용 구문) : 없다
--방법2(Ansi표준)
select last_name, department_id, department_name
from employees
full join departments using(department_id);



-- ex9) inner join : 두 개의 컬럼이 일치 하는 경우
-- 부서ID와 매니저ID가 같은 사원을 연결 하시오 → 32 레코드
-- (관련 테이블 : departments, employees)
-- last_name department_id manager_id

-- 방법1(오라클 전용 구문)
select e.last_name, d.department_id, d.manager_id 
from employees e, departments d
where e.department_id = d.department_id and e.manager_id = d.manager_id;

-- 방법2(Ansi표준)
select last_name, department_id, manager_id
from employees
inner join departments using(department_id, manager_id);

-- ex10) 내용은 같은데 컬럼명이 다른 경우에 조인으로 연결하기
 -- departments(location_id), locations2(loc_id)
 
 -- 테이블 복사
 create table locations2 as select*from locations;
 select * from locations2;
 alter table locations2 rename column location_id to loc_id;
 
 -- 방법1(오라클 전용 구문)
select d.department_id, l.city
from departments d, locations2 l
where d.location_id=l.loc_id;

-- 방법2(Ansi 표준)
select department_id, city
from departments
join locations2 on(location_id=loc_id);

-- 방법3(Ansi 표준)
select department_id, city
from departments d
join locations2 l on(d.location_id=l.loc_id);


--ex14) n(여러)개의 테이블은 조인
--업무ID 같은 사원들의 사원이름, 업무내용, 부서이름을 출력하시오
--(EMPLOYEES, JOBS, DEPARTMENTS 테이블을 조인)

 select last_name, job_title, department_name
from employees
join departments using(department_id)
join jobs using(job_id);

-- 문제3)
create table locations2 as select*from locations;
select * from locations2;
alter table locations2 rename column location_id to loc_id;
 
select last_name as 사원이름, city as 도시, department_name as 부서이름
from employees
join departments using(department_id)
join locations2 on(location_id = loc_id)
where city = 'Seattle' or  city = 'Oxford' 
-- where city in(('Seattle', 'Oxford')
order by 2;
-- order by city;

-- 문제4)
-- EMPLOYEES, LOCATIONS2, DEPARTMENTS, COUNTRIES

create table locations2 as select*from locations;
select * from locations2;
alter table locations2 rename column location_id to loc_id;

select  employee_id as 사원번호 , 
    last_name as 사원이름, department_name as 부서이름, city as 도시, 
    street_address as 도시주소, COUNTRY_NAME as 나라이름 
from employees
left join departments using(department_id)
join locations2 on(location_id = loc_id)
join COUNTRIES using(country_id)
where street_address like'%Ch%' 
    or  street_address like'%Sh%' 
    or street_address like'%Rd%'
order by 6, 4;

-- ex11) self 조인 : 자기 자신의 테이블과 조인하는 경우 사원과 관리자를 연결하시오
select employee_id, manager_id, last_name from employees;
select employee_id, last_name from employees;

-- 방법1
select e.employee_id as 사원번호,
    e.last_name as 사원이름,
    m.last_name as 관리자
from employees e, employees m
where m.employee_id=e.manager_id;

-- 방법2
select e.employee_id as 사원번호,
    e.last_name as 사원이름,
    m.last_name as 관리자
from employees e
join employees m on(m.employee_id=e.manager_id);


-- ex12) cross join : 모든 행에 대해 가능한 모든 조합을 생성하는 조인
select *from countries, locations;
select * from countries CROSS join locations;


-- ex13) Non Equijoin (넌 이큐조인)
--컬럼값이 같은 경우가 아닌 범위에 속하는지 여부를 확인 할 때
--on ( 컬럼명 between 컬럼명1 and 컬럼명2)

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


--ex14) n(여러)개의 테이블은 조인
--업무ID 같은 사원들의 사원이름, 업무내용, 부서이름을 출력하시오
--(EMPLOYEES, JOBS, DEPARTMENTS 테이블을 조인)

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
-- employee_id, last_name이 같을 경우 중복제거 하시오 → 110 레코드
select employee_id, last_name from employees
union
select employee_id, last_name from employees_role;

-- ex2) union all
-- employee_id, last_name이 같을 경우 중복을 허용 하시오 → 113 레코드
select employee_id, last_name from employees
union all
select employee_id, last_name from employees_role;

select salary from employees where department_id=10
union all
select salary from employees where department_id=30 order by 1;

-- ex3) minus
--employees_role과 중복되는 레코드는 제거하고 employees에만 있는 사원명단을 구하시오
--(단, employee_id, last_name만 표시) → 106 레코드

select employee_id, last_name from employees
minus
select employee_id, last_name from employees_role;

-- ex4) intersect
-- employees와 employees_role에서 중복되는 레코드의 사원명단을 구하시오
-- (단, employee_id, last_name만 표시) → 1 레코드

select employee_id, last_name from employees
intersect
select employee_id, last_name from employees_role;


-- [문제1] employees와 employees_role에서 레코드의 사원명단을 구하시오
-- 조건1) 사원이름, 업무ID, 부서ID을 표시하시오
-- 조건2) employees 에서는 부서ID가 10인 사원만 검색
-- employees_role에서는 업무ID가 IT_PROG만 검색
-- 조건3) 중복되는 레코드는 제거

select last_name as 사원이름, job_id as 업무ID, department_id as 부서ID 
from employees where department_id=10
union
select last_name, job_id, department_id from employees_role where job_id='IT_PROG';

-- ex5) SET operator과 IN operator관계
-- job_title이 'Stock Manager' 또는 'Programmer'인 사원들의 사원명과 job_title을 표시하시오

-- 221017

--5일차

-- ex1)Neena 사원의 부서명을 알아내시오
select department_id from employees where first_name='Neena';
select department_id from departments where department_id=90;

select department_name from departments
where department_id = (select department_id from employees where first_name='Neena');

--ex2)Neena 사원의 부서에서 Neena 사원보다 급여를 많이 받는 사원들의 
-- last_name, department_id, salary 구하시오 (90, 17000)
select last_name, department_id, salary
from employees
where department_id = (select department_id from employees where first_name='Neena')
 and salary > (select salary from employees where first_name='Neena');
 
 
 
 
 -- 문제1) 최저급여를 받는 사원들의 이름과 급여를 구하시오
 
 select last_name, department_id, salary from employees order by 3;
 
 select last_name, salary 
 from employees 
 where salary = (select min(salary) from employees );
 
 
 
 
 -- 문제2) 부서별 급여 합계 중 최대급여를 받는 부서의 부서명과 급여합계를 구하시오
select max(sum(salary)) from employees -- 304500, 부서별 중에서 가장 큰 값
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





-- ex3) Austin과 같은 부서이면서 같은 급여를 받는 사원들의 이름, 부서명, 급여를 구하시오 (60부서, 4800달러)
select last_name, department_name, salary
from employees
left join departments using(department_id)
where department_id = (select department_id from employees where last_name='Austin')
 and
salary = (select salary from employees where last_name='Austin');




-- ex4) 'ST_MAN' 직급보다 급여가 많은 'IT_PROG' 직급의 last_name, job_id, salary 직원들을 조회하시오

select last_name, job_id, salary
from employees
where job_id='ST_MAN'; --5800,6500,7900,8000,8200

select last_name, job_id, salary
from employees
where job_id = 'IT_PROG' and
 salary >any (select salary from employees where job_id='ST_MAN');
 
 -- 문제3)'IT_PROG' 직급 중 가장 많이 받는 사원의 급여보다 더 많은 급여를 받는 'FI_ACCOUNT' 또는
-- 'SA_REP' 직급 직원들을 조회하시오
-- 조건1) 급여 순으로 내림차순 정렬하시오
-- 조건2) 급여는 세자리 마다 콤마(,) 찍고 화폐단위 '원’을 붙이시오
-- 조건3) 타이틀은 사원명, 업무ID, 급여로 표시하시오

select last_name, job_id, salary
from employees
where job_id = 'IT_PROG'; -- 4200~9000

select last_name as 사원명, job_id as 업무ID, to_char(salary, '999,999' )||'원' as 급여
from employees
where job_id  in('FI_ACCOUNT','SA_REP') and
salary >= any(select salary from employees where job_id = 'IT_PROG') order by 3 desc;





-- ex5) 'IT_PROG'와 같은 급여를 받는 사원들의 이름, 업무ID, 급여를 전부 구하시오

select last_name, job_id, salary
from employees
where salary in(select salary from employees where job_id='IT_PROG');




-- ex6) 전체직원에 대한 관리자와 직원을 구분하는 표시를 하시오

--방법1
select employee_id as 사원번호, last_name as 이름, 
case
    when employee_id in (select manager_id from employees) then '관리자' 
    else '직원' 
    end as 구분
from employees
order by 3,1;

--방법2
select employee_id as 사원번호, last_name as 이름, '관리자' as 구분
from employees
where employee_id in (select manager_id from employees)
union
select employee_id as 사원번호, last_name as 이름, '직원' as 구분
from employees
where employee_id not in (select manager_id from employees where manager_id is not null)
order by 3,1;

--방법3
select employee_id as 사원번호, last_name as 이름, '관리자' as 구분
from employees e
where exists (select null from employees where e.employee_id=manager_id)
union
select employee_id as 사원번호, last_name as 이름, '직원' as 구분
from employees e
where not exists (select null from employees where e.employee_id=manager_id)
order by 3, 1;



-- 문제4)] 자기 업무id(job_id)의 평균급여를 받는 직원들을 조회하시오
-- 조건1) 평균급여는 100단위 이하 절삭하고 급여는 세자리마다 콤마, $표시
-- 조건2) 사원이름(last_name), 업무id(job_id), 직무(job_title), 급여(salary) 로 표시하시오
-- 조건3) 급여순으로 오름차순 정렬하시오

select job_id, trunc(avg(salary), -3) 
from employees group by job_id;

select last_name as 사원이름, 
        job_id as 업무id, 
        job_title as 직무,  
        to_char(salary,'$999,900') as  급여
from employees
join jobs using(job_id)
where (job_id, salary) in (select job_id, trunc(avg(salary), -3) 
from employees group by job_id) order by 4;

--221018
--5일차

--ex7) group by rollup : a, b별 집계(Subtotal 구하기)
--부서별, 직무ID별 급여평균구하기(동일부서에 대한 직무별 평균급여)
--조건1) 반올림해서 소수 2째자리까지 구하시오
--조건2) 제목은 Job_title, Department_name, Avg_sal로 표시하시오

select department_name, job_title, round(avg(salary),2) as "Avg_sal"
from employees
join departments using(department_id)
join jobs using(job_id)
group by rollup(department_name, job_title);

--ex8) group by cube : a별 집계 또는 b별 집계
--부서별, 직무ID별 급여평균구하기(부서를 기준으로 나타내는 평균급여) 

select department_name, job_title, round(avg(salary), 2) as "Avg_sal"
from employees
join departments using(department_id)
join jobs using(job_id)
group by cube(department_name, job_title);


--ex9) group by grouping sets
--직무별 평균급여와 전체사원의 평균급여를 함께 구하시오


select last_name,job_title, round(avg(salary), 2) as "Avg_sal"
from employees
join departments using(department_id)
join jobs using(job_id)
group by grouping sets((last_name),(job_title),()); -- ← () All Rows의 역활 All Rows : 전체 행을 나타낸다

-- 221018
-- 6일차


--ex1) 테이블 : test
create table test(
id number(5),
name char(10),
address varchar2(50));


-- ex2) 테이블 : user1
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


--ex3) 제약조건 확인
select constraint_name, constraint_type
from user_constraints --user_constraints : 제약조건 
where table_name='USER1';

select *
from user_constraints
where table_name='USER1';

-- ex4) 테이블
create table user2(
idx number constraint PKIDX primary key,
id varchar2(10) constraint UNID unique,
name varchar2(10) constraint NOTNAME not null, 
phone varchar2(15),
address varchar2(50),
score number(6,2) constraint CKSCORE check(score >= 0 and score <= 100), --check 는 조건이 있어야한다.
subject_code number(5),
hire_date date default sysdate,
marriage char(1) default 'N' constraint CKMARR check(marriage in('Y','N'))); 
-- as로 이름을 붙이듯 제약조건은 constraint 를 사용하여 이름 확인

-- ex5) 제약조건 확인
select constraint_name, constraint_type
from user_constraints
where table_name='USER2';

select *
from user_constraints
where table_name='USER2';


--ex6) 추가
insert into user1(idx,id,name,phone,address,score,subject_code,hire_date,marriage)
values(1,'aaa','kim','010-000-0000','서울',75,100,'2010-08-01','Y');

insert into user1(idx,id,name,phone,address,score,subject_code,hire_date,marriage)
values(1,'aaa','kim','010-000-0000','서울',75,100,'2010-08-01','Y');
→ 무결성제약조건에 위배(이유: idx 1 중복)

insert into user1(idx,id,name,phone,address,score,subject_code,hire_date,marriage)
values(2,'aaa','kim','010-000-0000','서울',75,100,'2010-08-01','Y');
→ 무결성제약조건에 위배(이유: id aaa 중복)

insert into user1(idx,id,name,phone,address,score,subject_code,hire_date,marriage)
values(2,'bbb','','010-000-0000','서울',75,100,'2010-08-01','Y');
→ NULL을 ("HR"."USER1"."NAME") 안에 삽입할 수 없습니다

insert into user1(idx,id,name,phone,address,score,subject_code,hire_date,marriage)
values(2,'bbb','lee','010-000-0000','서울',120,100,'2010-08-01','Y');
→ 체크 제약조건에 위배되었습니다(이유: score가 0~100사이의 수 이어야함)

insert into user1(idx,id,name,phone,address,score,subject_code,hire_date,marriage)
values(2,'bbb','lee','010-000-0000','서울',75,100,'2010-08-01','K');
→ 체크 제약조건에 위배되었습니다(이유:marriage가 Y 또는 N이어야함)

insert into user1(idx,id,name,phone,address,score,subject_code,hire_date,marriage)
values(2,'bbb','lee','010-000-0000','서울',75,100,'2010-08-01','N');


-- ex7) 테이블 목록 확인
select * from tab;


-- ex8) 테이블의 내용확인
select * from user1;
select * from user2;


-- ex9) 테이블의 구조 확인
desc user1; (= describe user1)

-- ex10) 시퀀스 목록 확인
select * from user_sequences;

-- ex11) 테이블명 변경 : test → user3
alter table test rename to user3;

-- ex12) 컬럼 추가 : user3 → phone varchar2(15)
alter table user3 add phone varchar2(15);
desc user3;

select *from user3;

-- ex13) 제약조건 추가 : user3 → id에 unique, 제약조건명 UID2
alter table user3 add constraint UID2 unique(id);

select constraint_name, constraint_type
from user_constraints
where table_name='USER3';

select *
from user_constraints
where table_name='USER3'; --제약조건확인

select constraint_name, constraint_type
from user_constraints
where table_name='USER3'; --제약조건들의 종류 이름으로 확인

-- ex14) 제약조건 삭제 - alter table 테이블명 drop constraint 제약조건명;
alter table user3 drop constraint UID2;
alter table user3 DROP constraint SYS_C007693;

select *
from user_constraints
where table_name='USER3';

-- ex15) 컬럼 추가 : user3 → no number (PK 설정)
alter table user3 add no number primary key;
desc user3;

from user_constraints
where table_name='USER3';

select constraint_name, constraint_type
from user_constraints
where table_name='USER3'; 


-- ex16) 구조 변경 : user3 → name char(10) 를 varchar2(10)로 바꿈
alter table user3 modify name varchar2(10);
desc user3;


-- ex17) 컬럼 삭제 : user3 → address
alter table user3 drop column address;
desc user3;

select * from user3;

-- ex18) 테이블삭제 / 휴지통비우기: user3
drop table user3;
purge recyclebin;  -- 휴지통 비우기

drop table user1 purge; -- 휴지통에 넣지 않고 바로 삭제
select * from user1;

drop table user2;
show recyclebin; --휴지통 보기

flashback table user2 to before drop; -- 휴지통에서 되살리기
select * from user2;
select * from recyclebin; --휴지통에 테이블 정보 검색

-- ex19) 시퀀스 생성 / 삭제
create sequence idx_sql increment by 2 start with 1 maxvalue 9 cycle nocache;
-- 1에서~9사이 2씩 증가하는 idx_sql 시퀀스르 만들어라 
select idx_sql.nextval from dual; -- 다음 시퀀스값 표시(nextval)
select idx_sql.currval from dual; -- 현재 시퀀스값 표시(currtval)
select * from user_sequences;

drop sequence idx_sql;




--221019
--6일차

-- ex20) 테이블 생성과 시퀀스 적용
create table book(
no number primary key,
subject varchar2(50),
price number, year date);

create sequence no_seq increment by 1 start with 1 nocycle nocache;


insert into book(no, subject, price, year)
values(no_seq.nextval, '오라클 무작정 따라하기', 10000, sysdate);
insert into book(no, subject, price, year)
values(no_seq.nextval, '자바 3일 완성', 15000, '2007-03-01');
insert into book values(no_seq.nextval, 'JSP 달인 되기', 18000, '2010-01-01');

select * from book;

--ex21) 테이블 구조만 복사
create table user3 as select * from user2 where 1=0;
desc user3;
select * from user3;

-- USER2에는 제약조건이 5개가 보인다
select constraint_name, constraint_type, search_condition
from user_constraints
where table_name='USER2';

select constraint_name, constraint_type, search_condition
from user_constraints
where table_name='USER3';

-- ex22) 테이블(idx → bunho, name → irum, address → juso) 을 복사하고 id가 bbb인 레코드를 복사하시오
원본테이블 : user1 / 사본테이블 : user4

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

--ex23) 테이블 생성 후 행 추가
--테이블명 : dept
--deptno number → 기본키, 제약조건명(DNO)
--dname varcahr2(30) → 널 허용 안됨, 제약조건명(DNAME)
--테이블명 : emp
--empno number → 기본키, 제약조건명(ENO)
--ename varchar2(30) → 널 허용 안됨, 제약조건명(ENAME)
--deptno number → 외래키, 제약조건명(FKNO), 대상데이터를 삭제하고 참조하는 데이터는 NULL로 바꿈

create table dept(
deptno number constraint DNO primary key,
dname varchar2(30) constraint DNAME not null);

create table emp(
empno number constraint ENO primary key,
ename varchar2(30) constraint ENAME not null,
deptno number, 
constraint FKNO foreign key(deptno) references dept on delete set null);
-- 제약조건명 : constraint FKNO
-- 외래키 : foreign key(deptno) references dept
-- on delete set null : 삭제하고 데이터를 NULL 로 바꿔

insert into dept(deptno, dname) values(10, '개발부');
insert into dept(deptno, dname) values(20, '영업부');
insert into dept(deptno, dname) values(30, '관리부');
insert into dept(dname) values(40, '경리부');
→ ORA-00913: 값의 수가 너무 많습니다
insert into dept(deptno, dname) values(40, '경리부');

select * from dept;

insert into emp(empno, ename, deptno) values(100, '홍길동', 10);
insert into emp(empno, ename, deptno) values(101, '라이언', 20);
insert into emp(empno, ename, deptno) values(102, '튜브', 50);
→ 50번부서 없음(무결성제약조건위배)-부모키가 없습니다
insert into emp(empno, ename, deptno) values(103, '어피치', 40);
insert into emp(empno, ename) values(105, '프로도');
insert into emp(ename, deptno) values('콘', 10); → primary key는 NULL허용 안함
-- primary key 인 empno는 무조건 데이터 입력시 있어야한다.
-- primary key  는 같은 값도 안되고 유일한 존재여야 한다 
-- ename 도 not null 으로 값이 들어가야 하므로 데이터 입력시 있어야 한다.
-- deptno 는 참조하는 데이터고, null도 허용임으로 비워져도 된다.

commit;
--ex24) 삭제
delete from dept;
select * from dept;
rollback;
select * from dept;

delete from dept where deptno=40;
select * from dept; -- 40번 부서 삭제
select * from emp; -- 40번 부서 컬럼에 (null)이 들어간다

--ex25) 수정(update)
--emp테이블 프로도 사원의 부서번호를 30으로 수정하시오
update emp set deptno=30 where ename='프로도';
select * from emp;
commit;





--221020