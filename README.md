# jsp_study_OracleDB
## myweb 개인 프로젝트 1차 푸시
- 답글형 게시판 제작

1.jsp 파일들 공통 코드 -> __ssi.jsp__

2.새 글 작성 -> bbsForm.jsp -> __bbsIns.jsp__

3.작성 글 목록 -> __bbsList.jsp__

4.작성 게시글 자세히 보기 -> __bbsRead.jsp__

4-1.글 수정 -> __bbsUpdate.jsp__ -> __bbsUpdateProc.jsp__

4-2.글 삭제 -> __bbsDel.jsp__ -> __bbsDelProc.jsp__

4-3.답글 달기 -> __bbsReply.jsp__ -> __bbsReplyProc.jsp__

## myweb 개인 프로젝트 2차 푸시
+ bbsList.jsp 파일에 검색 기능 추가
- 제목+내용, 제목, 내용, 작성자명 구분
- 검색어에 따른 게시글 조회
- 검색 후 다른 활동 후 뒤로 가기 할 경우 검색 상태 유지

## myweb 개인 프로젝트 -bbs 테이블 3차 푸시
-bbs 테이블 페이징 작업
-bbsList.jsp 에서 글 목록 페이징, 한 페이지 당 5개의 글이 보이도록
-col, word, nowPage, recordPerPage
-col : 검색 범위(제목+내용, 제목, 내용, 작성자)
-word : 검색어
-nowPage : 현재 띄우고 있는 페이지 수
-recordPerPage : 한 페이지에 띄울 글 개수

-BbsDAO Class의 list3() 메소드
-페이징 구현 메소드