/* Assignments 1*/
/* Performer: Phạm Hữu Tuấn Anh*/

/* Quest 1*/
create database if not exists assignments1;
use assignments1;
/* create  trainee*/
create table trainee(
trainee_id int primary key auto_increment,
full_name varchar(50) not null,
birth_date date not null,
gender ENUM ('male', 'female', 'unknown') not null,
ET_IQ tinyint CHECK (ET_IQ >= 0 AND ET_IQ <= 20) not null,
ET_Gmath tinyint  CHECK (ET_Gmath >= 0 AND ET_Gmath <= 20) not null,
ET_English tinyint  CHECK (ET_English >= 0 AND ET_English <= 50) not null,
Training_Class VARCHAR(100) not null,
Evaluation_notes Text
);
/* Quest 2 - Add column*/
alter table trainee
add column VTI_Account varchar(50) not null unique;
