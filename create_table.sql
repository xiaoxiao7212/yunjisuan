1.�γ̱�
create table course
(
  cno char(8) primary key,
  cname varchar(20) not null,
  cpno char(8),
  ccredit decimal(2,0),
  constraint fk_course_cpno foreign key(cpno) references course(cno)
);

2.ϵ����
create table department
(
  dno char(2) primary key,
  dname varchar(20) not null
);

3.ѧ����
create table student
(
  sno char(10) primary key,
  sname varchar(10) not null,
  ssex char(2) check(ssex in('��','Ů')) default '��',
  sbirth date,
  dno char(2),
  sselnum decimal(4,0),
  constraint fk_student_dno foreign key(dno) references department(dno)on update cascade on delete cascade
);

4.��ʦ��
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

5.�ɼ���
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
values('01010210','�����������',null,6);
insert into course
values('01010310','���ݽṹ','01010210',6);
insert into course
values('01010610','���ݿ�ԭ��','01010310',4);
insert into course
values('01011111','ʵ�����ݿ⼼��','01010610',3);
insert into course
values('01011510','����ϵͳ','01010210',6);
insert into course
values('01020210','ͨ��ԭ��',null,2);

insert into department
values('01','�����ϵ');
insert into department
values('02','��Ϣ����');
insert into department
values('03','��������');
insert into department
values('04','�Զ���');

insert into student
values('9906070101','��һ','��','1980-10-10','01',2);
insert into student
values('9906070102','����','Ů','1982-06-10','01',5);
insert into student
values('9906020101','�ɼ���','��','1981-05-20','02',2);
insert into student
values('9906020201','��Ȼ','Ů','1983-03-15','02',2);
insert into student
values('9906030101','���ȫ','��','1981-01-31','03',2);
insert into student
values('9906040101','�γ�','��','1985-07-16','04',2);

insert into teacher
values('0101','�ֱ���','01','1966-06-06','����',5500);
insert into teacher
values('0102','�·���','01','1963-05-05','������',4500);
insert into teacher
values('0201','����','02','1970-05-06','������',5200);
insert into teacher
values('0301','�����','03','1966-01-08','��ʦ',3000);
insert into teacher
values('0401','����','04','1966-12-01','��ʦ',3500);

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

