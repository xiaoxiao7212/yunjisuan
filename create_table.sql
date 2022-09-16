1.课程表
create table course
(
  cno char(8) primary key,
  cname varchar(20) not null,
  cpno char(8),
  ccredit decimal(2,0),
  constraint fk_course_cpno foreign key(cpno) references course(cno)
);

2.系部表
create table department
(
  dno char(2) primary key,
  dname varchar(20) not null
);

3.学生表
create table student
(
  sno char(10) primary key,
  sname varchar(10) not null,
  ssex char(2) check(ssex in('男','女')) default '男',
  sbirth date,
  dno char(2),
  sselnum decimal(4,0),
  constraint fk_student_dno foreign key(dno) references department(dno)on update cascade on delete cascade
);

4.教师表
create table teacher
(
  tno char(4) primary key,
  tname varchar(10) not null,
  dno char(2),
  tbirth datetime,
  ttitle varchar(6),
  sal decimal(5,0),
  constraint fk_teacher_dno foreign key(dno) references department(dno) on update cascade on delete cascade
);

5.成绩表
create table sc
(
  sno char(10),
  cno char(8),
  grade decimal(4,1),
  primary key(sno,cno),
  constraint fk_sc_sno foreign key(sno) references student(sno) on update cascade on delete cascade,
  constraint fk_sc_cno foreign key(cno) references course(cno) on update cascade on delete cascade
);

insert into course
values('01010210','程序设计语言',null,6);
insert into course
values('01010310','数据结构','01010210',6);
insert into course
values('01010610','数据库原理','01010310',4);
insert into course
values('01011111','实用数据库技术','01010610',3);
insert into course
values('01011510','操作系统','01010210',6);
insert into course
values('01020210','通信原理',null,2);

insert into department
values('01','计算机系');
insert into department
values('02','信息技术');
insert into department
values('03','电气工程');
insert into department
values('04','自动化');

insert into student
values('9906070101','丁一','男','1980-10-10','01',2);
insert into student
values('9906070102','方可','女','1982-06-10','01',5);
insert into student
values('9906020101','奚佳毅','男','1981-05-20','02',2);
insert into student
values('9906020201','钟然','女','1983-03-15','02',2);
insert into student
values('9906030101','李会全','男','1981-01-31','03',2);
insert into student
values('9906040101','何畅','男','1985-07-16','04',2);

insert into teacher
values('0101','贾宝岩','01','1966-06-06','教授',5500);
insert into teacher
values('0102','章飞龙','01','1963-05-05','副教授',4500);
insert into teacher
values('0201','赵月','02','1970-05-06','副教授',5200);
insert into teacher
values('0301','李光磊','03','1966-01-08','讲师',3000);
insert into teacher
values('0401','曹良','04','1966-12-01','讲师',3500);

insert into sc
values('9906070101','01010210',85);
insert into sc
values('9906070101','01010610',78);
insert into sc
values('9906070102','01010210',91);
insert into sc
values('9906070102','01010310',null);
insert into sc
values('9906070102','01010610',77);
insert into sc
values('9906070102','01011111',null);
insert into sc
values('9906070102','01011510',null);
insert into sc
values('9906020101','01010210',82.5);
insert into sc
values('9906020101','01010310',78.5);
insert into sc
values('9906020201','01010610',72);
insert into sc
values('9906020201','01011510',83);
insert into sc
values('9906030101','01010210',77);
insert into sc
values('9906030101','01010310',58);
insert into sc
values('9906040101','01011510',null);
insert into sc
values('9906040101','01010310',88);

