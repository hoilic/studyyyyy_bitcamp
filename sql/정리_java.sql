-- 221004

create table ����( 
name varchar(15), 
kor int, 
eng number, 
math number, 
tot number);

-- 1byte : ������, / �ѱ� - 2byte, Express �� �ѱ� 1�� = 3byte

select * from ����;

insert into ���� values('ȫ�浿', 89, 90, 78, 0); --'����' , '���ڿ�'
insert into ���� values('���ε�', 89, 85, 70, 0); --'����' , '���ڿ�'

rollback; -- Ŀ�� �Ѱ������� �����ȴ�.

drop table ����;
delete from ����;
select * from recyclebin;

create table sungjuk( 
name varchar(15), 
kor int, 
eng number, 
math number, 
tot number);

insert into sungjuk values('ȫ�浿', 89, 90, 78, 0); --'����' , '���ڿ�'
insert into sungjuk values('���ε�', 89, 85, 70, 0); --'����' , '���ڿ�'
select * from sungjuk;
drop table sungjuk;

flashback table sungjuk to before drop; --����

create table ����(
x int,
y number,
z number(10,3));

select * from ����;
insert into ���� (x, y, z) values(25, 36, 12.34567);
insert into ����(x, y, z) values(25.34567, 3634567, 12.34567);
insert into ���� (x, y) values(25.66, 36.88);

-- 221005
drop table dbtest;
create table dbtest(
name varchar2(15), -- char(������), varchar2(������)
age number,
height number(10,2),
logtime date);

select * from dbtest;

insert into dbtest(name,age,height,logtime) values('ȫ�浿',25,185.567,sysdate);
insert into dbtest(name,age,height,logtime) values('Hong',30,175.56,sysdate);
insert into dbtest(name,age) values('����',3);
insert into dbtest(name,height) values('ȫ�繫',168.89);
insert into dbtest values ('��ȫ��',5,123.5,sysdate);
insert into dbtest (name) values('����ȫ');

commit;

select name, age from dbtest;
select name, age, height, logtime from dbtest; -- = select*from dbtest;

select*from dbtest where name = 'ȫ�浿'; -- ȫ�浿 �˻�
select*from dbtest where name = 'Hong'; -- �����ʹ� ��ҹ��� ����
select*from dbtest where lower(name) = 'hong'; -- �ҹ��ڷ� �˻�
select*from dbtest where upper(name) = 'HONG'; -- �빮�ڷ� �˻�

select*from dbtest where name like'%ȫ%'; --ȫ�̶�� ���ڰ� ���°� �� ���Ͷ�!
select*from dbtest where name like'ȫ%'; -- ù���ڰ� ȫ���� �����ϴ°� ���Ͷ�!
select*from dbtest where name like'%ȫ'; -- ������ ���ڰ� ȫ���� �����ϴ°� ���Ͷ�!
select*from dbtest where name like'_ȫ%'; -- �ι�° ���ڰ� ȫ���� �����ϴ°� ���Ͷ�!
select*from dbtest where name like'__ȫ%'; -- ����° ���ڰ� ȫ���� �����ϴ°� ���Ͷ�!

select*from dbtest where age is null; -- age �� null �ΰ� ���Ͷ�!
select*from dbtest where age is not null; -- age �� not null �ΰ� ���Ͷ�!
select*from dbtest where age = 30; -- age �� 30 �ΰ� ���Ͷ�!
select*from dbtest where name like '%ȫ%' and age>=20; -- �̸��� ȫ�̵��� ���̰� 20�� �̻��� ���ڵ� �˻�

select*from dbtest;
update dbtest set age = age+1 where name like 'ȫ�浿'; -- 25�� + 1 �� 26����

delete dbtest where name = 'ȫ�浿';
rollback;
flashback table dbtest to before drop; --����

create sequence test increment by 2 start with 1 maxvalue 9 cycle nocache;
select test.nextval from dual;
select test.currval from dual;

CREATE SEQUENCE test2 nocycle nocache;
select test2.NEXTVAL from dual;
select test2.currval from dual;
 
select*from user_sequences;

commit;
 
update dbtest set age = age+1 where name like 'ȫ�浿';

create table student(
name varchar2(15) , -- char(������), varchar2(������)
value varchar2(15),
code number);

drop table student;

create table student(
name varchar2(15) not null , -- char(������), varchar2(������)
value varchar2(15),
code number);

commit;
select*from student;


--221006

create table student(
name varchar2(15) not null , -- char(������), varchar2(������)
value varchar2(15),
code number);

select * from student;


--221013

create table member(
name varchar2(30) not null,
id varchar2(30) primary key, --�⺻Ű, unique, not null, ���Ἲ ���� ����
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
-- ����Ŭ���� hidden clumn

select * 
from (select rownum rn, tt.* from(select * from guestbook)tt)
where rn>=1 and rn<=3;


select count(*) from guestbook;

select *  from (select rownum rn, tt.* from (select seq, name, email, homepage, subject, content, logtime from guestbook order by seq desc) tt) 
where rn>=? and rn<=?;


-- ���� ����

create table guestbook(
seq number primary key, -- ������ ��ü�κ��� ���� ���´�
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
to_char(logtime, 'YYYY"��" MM"��" DD"��"')as logtime from guestbook;

commit;

TRUNCATE table guestbook; --����

select * from guestbook;
delete from guestbook where seq=12;
commit;