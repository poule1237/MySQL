-- 데이터베이스(스키마) 리스트 보기
show databases;

-- web_db 접속
use web_db;

-- 테이블 리스트 보기
show tables;

-- 작가 테이블 데이터 조회
select *
from author;

-- 데이터 조회
select  author_id,
		author_name,
        author_desc
from author
;

-- 데이터 추가
insert into author
values(null, '기안84' , '패션왕')
;
insert into author
values(null, '유재석' , '압구정')
;

-- 데이터삭제
delete from author
where author_id = 4;

-- 데이터수정
update author 
set author_name = '침착맨', 
	author_desc = '방송인'
where author_id = 3
;







