--pds.sql

--포토 갤러리

--tb_pds 테이블 생성
CREATE TABLE tb_pds (
   pdsno      NUMBER         NOT NULL
  ,wname      VARCHAR2(100)  NOT NULL
  ,subject    VARCHAR2(250)  NOT NULL
  ,regdate    DATE           NOT NULL
  ,passwd     VARCHAR2(15)   NOT NULL
  ,readcnt    NUMBER         DEFAULT 0
  ,filename   VARCHAR2(250)  NOT NULL   --파일명
  ,filesize   NUMBER         DEFAULT 0  --파일크기
  ,PRIMARY KEY(pdsno)
);

--tb_pds 테이블 생성(MariaDB ver)
CREATE TABLE tb_pds (
   pdsno      INT			NOT NULL
  ,wname      VARCHAR(100)  NOT NULL
  ,subject    VARCHAR(250)  NOT NULL
  ,regdate    DATE			DEFAULT now()
  ,passwd     VARCHAR(15)	NOT NULL
  ,readcnt    INT			DEFAULT 0
  ,filename   VARCHAR(250)  NOT NULL   --파일명
  ,filesize   INT			DEFAULT 0  --파일크기
  ,PRIMARY KEY(pdsno)
);

--시퀀스 생성
create sequence pds_seq;

--행 추가
pdsno : 시퀀스로 일련 번호 생성
wname, subject, passwd : 사용자 직접 입력(form)
regdate : sysdate
filename, filesize : 첨부파일 관련 정보

insert into tb_pds(pdsno, wname, subject, passwd, filename, filesize, regdate)
values (pds_seq.nextval, ?, ?, ?, ?, ?, sysdate);