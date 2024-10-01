--bbs.sql
● OracleDB

● 답변형 및 댓글형 게시판
	- 전체 목록	bbsList.jsp
	- 새 글 작성	bbsForm.jsp -> bbsIns.jsp
	- 상세보기		bbsRead.jsp
	- 글 삭제		bbsDel.jsp
	- 글 수정		bbsUpdate.jsp -> bbsUpdateProc.jsp
	- 답변 작성	bbsReply.jsp
	  -> 테이블 분리 권장
	- 검색
	- 페이징
------------------------------------------------------------

-- 테이블 삭제
drop table tb_bbs;

-- 테이블 생성
create table tb_bbs(
	bbsno    number(5)       not null -- 일련번호 -99999~99999
	,wname    varchar2(20)    not null -- 작성자
	,subject  varchar2(100)   not null -- 글 제목
	,content  varchar2(2000)  not null -- 글 내용
	,passwd   varchar2(10)    not null -- 글비밀번호 -> 글 수정/삭제 시 검사
	,readcnt  number(5)       default 0 not null -- 글 조회수
	,regdt    date            default  sysdate   -- 글 작성일
	,grpno    number(5)       not null  -- 글 그룹번호
	,indent   number(5)       default 0 -- 들여쓰기
	,ansnum   number(5)       default 0 -- 글 순서
	,ip       varchar2(15)    not null  -- 사용자 요청 PC의 IP
	,primary key(bbsno)                 -- bbsno 기본키 
);

--grpno, indent, ansnum : 답변, 댓글 게시판 시 사용
--grpno : 부모 글, 자식 글(서로 연관되는 관계의 글)이 공통으로 가지는 번호

-- 시퀀스 삭제
drop sequence bbs_seq;

-- 시퀀스 생성
create sequence bbs_seq;
------------------------------------------------------------

-- 새 글 작성
bbsno							: 시퀀스로 일련 번호
wname, subject, content, passwd : 사용자가 입력(form)
readcnt, regdt, indent, ansnum	: default 값 적용
ip								: request.getRemoteAddr() --사용자 PC의 IP 주소
grpno							: max(bbsno) +1

-- 그룹번호(grpno) 만들기
select max(bbsno) from tb_bbs;
-- max(bbsno)가 null 값이면 계산되지 않는다
select max(bbsno)+1 from tb_bbs;
-- nvl() 함수를 이용하여 max(bbsno)가 null 값이면 0으로 변환
select nvl(max(bbsno), 0) from tb_bbs;
-- nvl() 함수를 이용하여 max(bbsno)가 null 값이면 0으로 변환 그러고 나서 +1
select nvl(max(bbsno), 0)+1 from tb_bbs;

-- 행 추가
insert into tb_bbs(bbsno, wname, subject, content, passwd, ip, grpno)
values (bbs_seq.nextval, ?, ?, ?, ?, ?, ?, (select nvl(max(bbsno), 0)+1 from tb_bbs));

-- 전체 목록
select bbsno, wname, subject, readcnt, regdt, indent
from tb_bbs
order by grpno desc, ansnum asc;

-- 전체 행 개수
select count(*) from tb_bbs;

-- 상세보기
select * from tb_bbs where bbsno=?

-- 조회 수 증가
update tb_bbs
set readcnt = readcnt+1
where bbsno = ?

-- 행 삭제
-- 글 번호와 비밀번호가 일치하면 삭제
delete from tb_bbs
where bbsno = ? and passwd = ?

-- 행 수정
update tb_bbs
set wname=?, subject=?, content=?, ip=?
where bbsno=? and passwd=?

● 답변 작성 알고리즘
- 새 글 쓰기 : 부모글
- 답변 쓰기 : 자식글

- 그룹 번호(grpno)	 :부모글 그룹번호와 동일
- 들여쓰기 (indent) :부모글 들여쓰기 번호+1
- 글 순서(ansnum)	 :부모글 들여쓰기+1, 글 순서 재조정

번호 제목		그룹번호	들여쓰기	글순서
1	서울시		1		0		0
	→강남구		1		1		1
	→종로구		1		1		2
	→→관철동		1		2		3
	→→→수표교		1		2		4
	→→→국일관		1		2		5->6
	→→인사동		1		2		6->7
2	제주도		2		0		0
	→애월읍		2		1		1
	→서귀포		2		1		2
3	부산광역시		3		0		0

- 글 순서(ansnum) 재조정
update tb_bbs
set ansnum = ansnum+1
where grpno = 1 and ansnum >= 5

● 검색

-- 제목 + 내용에서 '검색어'가 있는지 검색
where subject like '%검색어%' or content like '%검색어%'
-- 제목에서 '검색어'가 있는지 검색
where subject like '%검색어%'
-- 내용에서 '검색어'가 있는지 검색
where content like '%검색어%'
-- 작성자명에서 '검색어'가 있는지 검색
where wname like '%검색어%'

● 페이징(paging) - rownum 줄 번호 활용
1)
SELECT bbsno, wname, subject, readcnt, regdt, indent
FROM tb_bbs
ORDER BY grpno DESC, ansnum ASC;

2) rownum 추가 - 줄번호가 같이 정렬됨
SELECT bbsno, wname, subject, readcnt, regdt, indent, ROWNUM
FROM tb_bbs
ORDER BY grpno DESC, ansnum ASC;

3) 1의 sql문을 셀프 조인한 뒤 줄번호 추가
SELECT bbsno, wname, subject, readcnt, regdt, indent, ROWNUM
FROM (
		SELECT bbsno, wname, subject, readcnt, regdt, indent
		FROM tb_bbs
		ORDER BY grpno DESC, ansnum ASC
	);

4) 줄 번호 1 ~ 5까지 조회(1페이지)
SELECT bbsno, wname, subject, readcnt, regdt, indent, ROWNUM
FROM (
		SELECT bbsno, wname, subject, readcnt, regdt, indent
		FROM tb_bbs
		ORDER BY grpno DESC, ansnum ASC
	)
WHERE ROWNUM >= 1 AND ROWNUM <= 5;

5) 줄 번호 6 ~ 10까지 조회(2페이지)
SELECT bbsno, wname, subject, readcnt, regdt, indent, ROWNUM
FROM (
		SELECT bbsno, wname, subject, readcnt, regdt, indent
		FROM tb_bbs
		ORDER BY grpno DESC, ansnum ASC
	)
WHERE ROWNUM >= 6 AND ROWNUM <= 10;

6) 줄 번호가 있는 3)의 테이블을 한 번 더 셀프조인 후, rownum 칼럼명을 r로 변경
SELECT * 
FROM (
	SELECT bbsno, wname, subject, readcnt, regdt, indent, ROWNUM AS rno
	FROM (
			SELECT bbsno, wname, subject, readcnt, regdt, indent
			FROM tb_bbs
			ORDER BY grpno DESC, ansnum ASC
		)
)
WHERE rno >= 6 AND rno <= 10;

7) 검색 + 페이징
	예) 제목에서 '검색어'가 있는 행을 검색해서 2페이지를(6~10행) 조회
SELECT * 
FROM (
	SELECT bbsno, wname, subject, readcnt, regdt, indent, ROWNUM AS rno
	FROM (
			SELECT bbsno, wname, subject, readcnt, regdt, indent
			FROM tb_bbs
			WHERE subject LIKE '%검색어%'
			ORDER BY grpno DESC, ansnum ASC
		)
)
WHERE rno >= 6 AND rno <= 10;

--SELECT * 
--FROM (
--	SELECT bbsno, wname, subject, readcnt, regdt, indent, ROWNUM AS rno
--	FROM (
--			SELECT bbsno, wname, subject, readcnt, regdt, indent
--			FROM tb_bbs
--			ORDER BY grpno DESC, ansnum ASC
--		)
--)
--WHERE rno >= 6 AND rno <= 10 AND subject LIKE '%모바일%';















