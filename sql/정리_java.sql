-- 221004

create table 성적( 
name varchar(15), 
kor int, 
eng number, 
math number, 
tot number);

-- 1byte : 영문자, / 한글 - 2byte, Express 는 한글 1자 = 3byte

select * from 성적;

insert into 성적 values('홍길동', 89, 90, 78, 0); --'문자' , '문자열'
insert into 성적 values('프로도', 89, 85, 70, 0); --'문자' , '문자열'

rollback; -- 커밋 한곳까지만 복구된다.

drop table 성적;
delete from 성적;
select * from recyclebin;

create table sungjuk( 
name varchar(15), 
kor int, 
eng number, 
math number, 
tot number);

insert into sungjuk values('홍길동', 89, 90, 78, 0); --'문자' , '문자열'
insert into sungjuk values('프로도', 89, 85, 70, 0); --'문자' , '문자열'
select * from sungjuk;
drop table sungjuk;

flashback table sungjuk to before drop; --복원

create table 연산(
x int,
y number,
z number(10,3));

select * from 연산;
insert into 연산 (x, y, z) values(25, 36, 12.34567);
insert into 연산(x, y, z) values(25.34567, 3634567, 12.34567);
insert into 연산 (x, y) values(25.66, 36.88);

-- 221005
drop table dbtest;
create table dbtest(
name varchar2(15), -- char(고정형), varchar2(가변형)
age number,
height number(10,2),
logtime date);

select * from dbtest;

insert into dbtest(name,age,height,logtime) values('홍길동',25,185.567,sysdate);
insert into dbtest(name,age,height,logtime) values('Hong',30,175.56,sysdate);
insert into dbtest(name,age) values('희동이',3);
insert into dbtest(name,height) values('홍당무',168.89);
insert into dbtest values ('분홍신',5,123.5,sysdate);
insert into dbtest (name) values('진분홍');

commit;

select name, age from dbtest;
select name, age, height, logtime from dbtest; -- = select*from dbtest;

select*from dbtest where name = '홍길동'; -- 홍길동 검색
select*from dbtest where name = 'Hong'; -- 데이터는 대소문자 구별
select*from dbtest where lower(name) = 'hong'; -- 소문자로 검색
select*from dbtest where upper(name) = 'HONG'; -- 대문자로 검색

select*from dbtest where name like'%홍%'; --홍이라는 글자가 들어온거 다 나와라!
select*from dbtest where name like'홍%'; -- 첫글자가 홍으로 시작하는거 나와라!
select*from dbtest where name like'%홍'; -- 마지막 글자가 홍으로 시작하는거 나와라!
select*from dbtest where name like'_홍%'; -- 두번째 글자가 홍으로 시작하는거 나와라!
select*from dbtest where name like'__홍%'; -- 세번째 글자가 홍으로 시작하는거 나와라!

select*from dbtest where age is null; -- age 가 null 인거 나와라!
select*from dbtest where age is not null; -- age 가 not null 인거 나와라!
select*from dbtest where age = 30; -- age 가 30 인거 나와라!
select*from dbtest where name like '%홍%' and age>=20; -- 이름에 홍이들어가고 나이가 20살 이상인 레코드 검색

select*from dbtest;
update dbtest set age = age+1 where name like '홍길동'; -- 25살 + 1 이 26으로

delete dbtest where name = '홍길동';
rollback;
flashback table dbtest to before drop; --복원

create sequence test increment by 2 start with 1 maxvalue 9 cycle nocache;
select test.nextval from dual;
select test.currval from dual;

CREATE SEQUENCE test2 nocycle nocache;
select test2.NEXTVAL from dual;
select test2.currval from dual;
 
select*from user_sequences;

commit;
 
update dbtest set age = age+1 where name like '홍길동';

create table student(
name varchar2(15) , -- char(고정형), varchar2(가변형)
value varchar2(15),
code number);

drop table student;

create table student(
name varchar2(15) not null , -- char(고정형), varchar2(가변형)
value varchar2(15),
code number);

commit;
select*from student;


--221006

create table student(
name varchar2(15) not null , -- char(고정형), varchar2(가변형)
value varchar2(15),
code number);

select * from student;


--221013

create table member(
name varchar2(30) not null,
id varchar2(30) primary key, --기본키, unique, not null, 무결성 제약 조건
pwd varchar2(30) not null,
gender varchar2(3),
email1 varchar2(20),
email2 varchar2(20),
tel1 varchar2(10),
tel2 varchar2(10),
tel3 varchar2(10),
zipcode varchar2(10),
addr1 varchar2(100),
addr2 varchar2(100),
logtime date);

select * from member;

delete member where id='hong';
commit;


-- 221017
-- 오라클에는 hidden clumn

select * 
from (select rownum rn, tt.* from(select * from guestbook)tt)
where rn>=1 and rn<=3;


select count(*) from guestbook;

select *  from (select rownum rn, tt.* from (select seq, name, email, homepage, subject, content, logtime from guestbook order by seq desc) tt) 
where rn>=? and rn<=?;


-- 방명록 과제

create table guestbook(
seq number primary key, -- 시퀀스 객체로부터 값을 얻어온다
name varchar2(30),
email varchar2(30),
homepage varchar2(35),
subject varchar2(500) not null,
content varchar2(4000) not null,
logtime date);


select*from guestbook;
commit;

create SEQUENCE seq_guestbook nocycle NOCACHE;
commit;

select seq, name ,
email ,
homepage ,
subject ,
content ,
to_char(logtime, 'YYYY"년" MM"월" DD"일"')as logtime from guestbook;

commit;

TRUNCATE table guestbook; --비우기

select * from guestbook;
delete from guestbook where seq=12;
commit;