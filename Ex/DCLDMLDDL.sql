-- -----------------------------------------------
-- web 계정 복습
-- ----------------------------------------------

-- web 계정으로 로그인

-- web 사용 가능한 데이터베이스 조회 
show databases;

-- web_db 선택
use web_db;

-- 데이터 조회
show tables;

-- 테이블 삭제
drop table book;
drop table author;

-- 테이블 생성
create table author(
			 author_id int primary key,
			 author_name varchar(100) not null,
			 author_desc varchar(500)
);
create table book(
			 book_id int primary key,
             title varchar(100) not null,
             pubs varchar(100),
             pub_date datetime
);

-- 데이터입력

insert into author(author_id,author_name,author_desc) 
values(1,'이문열','서울');

insert into author
values(2,'정우성','서울');

insert into author
values(3,'유재석','');

insert into author
values(4,'이효리',null);

-- --------
insert into author(author_id,author_name)
values(5,'박명수');

insert into author(author_id,author_desc)
values(6,'농구선수');

-- author 데이터 조회
select *
from author;

show tables;

-- 계정 삭제
drop table author;
drop table book;

create table author(
	author_id int primary key auto_increment,
    author_name varchar(100) not null,
    author_desc varchar(500)
);

insert into author
values(null, '박명수','서울');

insert into author
values(null, '정우성','영화배우');



create table author(
	author_id 		int primary key auto_increment,
	author_name 	varchar(100) not null,
    author_desc 	varchar(500) 
);



create table book(
	book_id 	int primary key auto_increment,
    title 		varchar(100) not null,
    pubs 		varchar(100),
    pub_date 	datetime,
    author_id 	int,
    constraint book_fk foreign key(author_id)
    references author(author_id)
);


-- 작가 데이터 입력
insert into author
values(null,'이문열','경북 영양');

insert into author
values(null,'박경리','경상남도 통영');

-- 책 데이터 입력

insert into book
values(1, '삼국지' , '서울');

insert into book
values(null ,'우리들의 일그러진 영웅','다림','1988-02-22',1);

select *
from author;

select *
from book bo, author au
where bo.author_id = au.author_id;


update author
set author_desc = '서울'
where author_id = 1;

delete from book
where book_id = 1;

delete from author
where author_id = 2;


