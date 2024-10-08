-- member.sql

--회원 테이블 생성
CREATE TABLE member (
	id       VARCHAR(10)  NOT NULL, -- 아이디, 중복 안됨.
	passwd   VARCHAR(10)  NOT NULL, -- 패스워드
	mname    VARCHAR(20)  NOT NULL, -- 성명
	tel      VARCHAR(14)  NULL,     -- 전화번호
	email    VARCHAR(50)  NOT NULL  UNIQUE, -- 전자우편 주소, 중복 안됨
	zipcode  VARCHAR(7)   NULL,     -- 우편번호, 12345
	address1 VARCHAR(255) NULL,     -- 주소 1
	address2 VARCHAR(255) NULL,     -- 주소 2(나머지주소)
	job      VARCHAR(20)  NOT NULL, -- 직업
	mlevel   CHAR(2)      NOT NULL, -- 회원 등급, A1, B1, C1, D1, E1, F1
	mdate    DATE         NOT NULL, -- 가입일    
	PRIMARY KEY (id)
);

-- 회원등급 정보
A1: 관리자
B1: 중간 관리자
C1: 우수 사용자
D1: 일반 사용자 (기본)
E1: 비회원
F1: 탈퇴한 회원

-- 기존 회원 정보 저장(테스트용)
--행 추가
insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values('webmaster', '12341234', '웹마스터', '123-4567', 'webmaster@greenit.co.kr'
     , '12345', '서울시 강남구 역삼동', '삼원타워4층', 'A02', 'A1', sysdate );
     
insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values('greenit', '12341234', '웹마스터', '123-4567', 'greenit@greenit.co.kr'
     , '12345', '서울시 강남구 역삼동', '삼원타워4층', 'A02', 'D1', sysdate );
     
insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values('korea', '12341234', '웹마스터', '123-4567', 'korea@greenit.co.kr'
     , '12345', '서울시 종로구 관철동', '국일드림팰리스 5층', 'A02', 'F1', sysdate );
     
commit;

-- 로그인
-- 아이디/비밀번호가 일치하면 -> 회원 등급 가져오기
--> 회원 등급에 따라 접근 권한 범위가 다르기 때문
-- 단, 비회원과 탈퇴회원은 제외(불러오지 않음)
select mlevel
from member
where id = 'webmaster' and passwd = '12341234' and mlevel in ('A1', 'B1', 'C1', 'D1');
     
select mlevel
from member
where id = 'greenit' and passwd = '12341234' and mlevel in ('A1', 'B1', 'C1', 'D1');

select mlevel
from member
where id = 'korea' and passwd = '12341234' and mlevel in ('A1', 'B1', 'C1', 'D1');


--회원가입 시 아이디 중복확인
--primary key의 특성 : 고유성을 가진다, 중복될 수 없다
--count(id) = 0 이면 해당 id 값이 없다는 뜻 => 사용 가능한 아이디
--count(id) = 1 이면 해당 id 값이 있다는 뜻 => 사용 불가능한 아이디
select count(id) as cnt
from member
where id = ?

--회원가입
INSERT INTO member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, madate)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, "D1", sysdate)

--아이디/비밀번호 찾기 연습용 데이터 행 추가
--확인 가능한 메일 주소 정확히 기입
insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values('kimkim', '12341234', '김연아', '123-4567', 'dbalqh2@naver.com'
     , '12345', '서울시 종로구 인사동', '역삼빌딩8층', 'A02', 'D1', sysdate );

commit;

--아이디/비밀번호 찾기
1) 이름과 이메일을 입력 받아서 일치가 되면 id를 가져옴
select id
from member
where mname=? and email=?

2) 임시 비밀번호를 테이블에서 수정
update member
set passwd=?
where mname=? and email=?
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     