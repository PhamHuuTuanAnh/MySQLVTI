/* Assignments 2*/
/* Performer: Phạm Hữu Tuấn Anh*/

create database if not exists assignments22;
use assignments22;
/* create department*/
create table department (
DepartmentID tinyint primary key auto_increment,
DepartmentName varchar(50) not null unique
);
/* create Position*/
create table Position (
PositionID tinyint primary key auto_increment,
PositionName enum ('dev', 'test', 'scrum master', 'PM') /*enum chi dung cho string khong dung cho int*/
);
/* create Account*/

create table `Account` (
AccountID int primary key auto_increment,
Email varchar(50) not null unique,
Username varchar(50) not null unique,
Fullname varchar(50) not null unique,
DepartmentID tinyint not null,
PositionID tinyint not null,
CreateDate date not null,
constraint Account_department_fk  Foreign key (DepartmentID) REFERENCES Department(DepartmentID),
constraint Account_Position_fk foreign key (PositionID) REFERENCES Position (PositionID)
);
/* create  Group*/
create table `Group` (
GroupID tinyint primary key auto_increment,
GroupName varchar(50) not null unique,
CreatorID int not null unique,
CreateDate date not null,
constraint Account_CreatorID_fk Foreign key (CreatorID) REFERENCES Account (AccountID)
);
/* create  GroupAccount*/
create table GroupAccount (
GroupID tinyint primary key auto_increment,
AccountID int not null unique,
JoinDate date not null,
constraint Group_GroupID_fk Foreign key (GroupID) REFERENCES `Group` (GroupID),
constraint Account_Account_fk Foreign key (AccountID) REFERENCES Account (AccountID)
);
/* create  TypeQuestion*/
create table TypeQuestion (
TypeID int primary key auto_increment,
TypeName varchar(20) not null
);
/* create  CategoryQuestion*/
create table CategoryQuestion (
CategoryID int primary key auto_increment,
CategoryName varchar(20) not null
);
/* create  Question*/
create table Question (
QuestionID int primary key auto_increment,
Content varchar(255) not null,
CategoryID int not  null,
TypeID int not null,
CreatorID int not null unique,
CreateDate date not null,
constraint CategoryQuestion_CategoryID_fk Foreign key (CategoryID) REFERENCES CategoryQuestion (CategoryID),
constraint TypeQuestion_TypeID_fk Foreign key (TypeID) REFERENCES TypeQuestion (TypeID),
constraint Account_CreatorID_fk Foreign key (CreatorID) REFERENCES Account (AccountID)
);
/* create Answer*/
create table Answer (
AnswerID int primary key auto_increment,
Content Text not null,
QuestionID int not null,
isCorrect boolean not null,
constraint Question_QuestionID_fk Foreign key (QuestionID) REFERENCES Question (QuestionID)
);
/* create Exam*/
create table Exam (
ExamID int primary key auto_increment,
`code` varchar(20) not null,
Title varchar(20) not null,
CategoryID int not null,
Duration time not null,
CreatorID int not null unique,
CreateDate date not null,
constraint Account_CreatorID_fk Foreign key (CreatorID) REFERENCES Account (AccountID),
constraint CategoryQuestion_CategoryID_fk Foreign key (CategoryID) REFERENCES CategoryQuestion (CategoryID)
);
/* create ExamQuestion*/
create table  ExamQuestion (
ExamID int primary key auto_increment,
QuestionID int not null,
constraint Exam_ExamID_fk foreign key (ExamID) REFERENCES Exam (ExamID),
constraint Answer_QuestionID_fk Foreign key (QuestionID) REFERENCES Answer (QuestionID)
);