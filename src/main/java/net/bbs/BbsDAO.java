package net.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;

public class BbsDAO { //Data Access Object
	//field
	private DBOpen dbOpen = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuilder sql = null;
	
	//constructor
	public BbsDAO() {
		dbOpen = new DBOpen();
	}//end
	
	//method
	
	//새 글 추가 메소드
	public int create(BbsDTO bbsDto) {
		int cnt = 0;
		
		try {
			con = dbOpen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" INSERT INTO tb_bbs(bbsno, wname, subject, content, passwd, ip, grpno)");
			sql.append(" VALUES (bbs_seq.nextval, ?, ?, ?, ?, ?, (select nvl(max(bbsno), 0)+1 FROM tb_bbs))");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, bbsDto.getWname());
			pstmt.setString(2, bbsDto.getSubject());
			pstmt.setString(3, bbsDto.getContent());
			pstmt.setString(4, bbsDto.getPasswd());
			pstmt.setString(5, bbsDto.getIp());
			
			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("글 추가 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt);
		}//try end
		
		return cnt;
	}//insert() end
	
	//글 목록 보여주는 메소드
	public ArrayList<BbsDTO> list(){
		ArrayList<BbsDTO> list = null;
		
		try {
			con = dbOpen.getConnection();
			sql = new StringBuilder();
			
			sql.append(" SELECT bbsno, wname, subject, readcnt, regdt, indent");
			sql.append(" FROM tb_bbs");
			sql.append(" ORDER BY grpno DESC, ansnum ASC");
			
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				list = new ArrayList<BbsDTO>();
				do {
					BbsDTO bbsDto = new BbsDTO();
					bbsDto.setBbsno(rs.getInt("bbsno"));
					bbsDto.setWname(rs.getString("wname"));
					bbsDto.setSubject(rs.getString("subject"));
					bbsDto.setReadcnt(rs.getInt("readcnt"));
					bbsDto.setRegdt(rs.getString("regdt"));
					bbsDto.setIndent(rs.getInt("indent"));
					
					list.add(bbsDto); //list에 추가
				} while(rs.next());
			} else {
				list = null;
			}//if end
			
		} catch (Exception e) {
			System.out.println("글 목록 조회 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}//try end
		
		return list;
	}//list() end
	
	//총 게시글 개수 조회
	public int count() {
		int cnt = 0;
		
		try {
			con = dbOpen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" SELECT COUNT(*) as cnt");
			sql.append(" FROM tb_bbs");
			
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("cnt"); //행 개수(count(*))를 int cnt에 저장
			}//if end
			
		} catch (Exception e) {
			System.out.println("글 개수 조회 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}//try end
		
		return cnt;
	}//count() end
	
	//게시글 상세보기
	public BbsDTO read(int bbsno) {
		BbsDTO bbsDto = null;
		
		try {
			con = dbOpen.getConnection();
			sql = new StringBuilder();
			
			sql.append(" SELECT bbsno, wname, subject, content, readcnt, regdt, ip, grpno, indent, ansnum");
			sql.append(" FROM tb_bbs");
			sql.append(" WHERE bbsno=?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bbsDto = new BbsDTO();
				bbsDto.setBbsno(rs.getInt("bbsno"));
				bbsDto.setWname(rs.getString("wname"));
				bbsDto.setSubject(rs.getString("subject"));
				bbsDto.setContent(rs.getString("content"));
				bbsDto.setReadcnt(rs.getInt("readcnt"));
				bbsDto.setRegdt(rs.getString("regdt"));
				bbsDto.setIp(rs.getString("ip"));
				bbsDto.setGrpno(rs.getInt("grpno"));
				bbsDto.setIndent(rs.getInt("indent"));
				
			}//if end
			
		} catch (Exception e) {
			System.out.println("글 상세조회 실패: " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}//try end
		
		return bbsDto;
	}//read() end
	
	//조회 수 증가
	public void incrementCnt(int bbsno) {
		try {
			con = dbOpen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" UPDATE tb_bbs");
			sql.append(" SET readcnt = readcnt+1");
			sql.append(" WHERE bbsno = ?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("조회 수 증가 실패 : " + e);
		} finally {
			DBClose.close(con,pstmt);
		}//try end
	}//increment() end
	
	//게시글 삭제
	public int delete(BbsDTO bbsDto) {
		int cnt = 0;
		
		try {
			con = dbOpen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" DELETE FROM tb_bbs");
			sql.append(" WHERE bbsno = ? AND passwd = ?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsDto.getBbsno());
			pstmt.setString(2, bbsDto.getPasswd());
			
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("글 삭제 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt);
		}//try end
		
		return cnt;
	}//delete() end
	
	//게시글 수정
	public int updateProc(BbsDTO bbsDto) {
		int cnt = 0;
		
		try {
			con = dbOpen.getConnection();
			sql = new StringBuilder();
			
			sql.append(" UPDATE tb_bbs");
			sql.append(" SET wname=?, subject=?, content=?, ip=?");
			sql.append(" WHERE bbsno=? AND passwd=?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, bbsDto.getWname());
			pstmt.setString(2, bbsDto.getSubject());
			pstmt.setString(3, bbsDto.getContent());
			pstmt.setString(4, bbsDto.getIp());
			pstmt.setInt(5, bbsDto.getBbsno());
			pstmt.setString(6, bbsDto.getPasswd());
			
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("행 수정 실패: " + e);
		} finally {
			DBClose.close(con, pstmt);
		}//try end
		
		return cnt;
	}//updateProc() end
	
	//검색 메소드
	public int reply(BbsDTO bbsDto) {
		int cnt = 0;
		
		try {
			con = dbOpen.getConnection();
			
			sql = new StringBuilder();
			
			//1) 부모 글에 대한 정보 가져오기(그룹번호 동일, 들여쓰기+1, 글 순서 조정) - select문
			int grpno = 0;	//그룹 번호
			int indent = 0;	//들여쓰기 번호
			int ansnum = 0;	//글 순서 번호
			
			sql.append(" SELECT grpno, indent, ansnum");
			sql.append(" FROM tb_bbs");
			sql.append(" WHERE bbsno = ?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsDto.getBbsno());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				grpno = rs.getInt("grpno");			//그룹 번호 : 부모글의 그룹번호와 동일 값 가져오기
				indent = rs.getInt("indent")+1;		//들여쓰기 번호 : 부모글에 +1
				ansnum = rs.getInt("ansnum")+1;		//글 순서 : 부모글 글 순서 +1
			}//if end
			
			//2) 글 순서 조정(update문)
			sql.delete(0, sql.length()); //1)에서 작성한 sql문 지우기
			
			sql.append(" UPDATE tb_bbs");
			sql.append(" SET ansnum = ansnum + 1");
			sql.append(" WHERE grpno = ? AND ansnum >= ?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);
			pstmt.executeUpdate();
			
			//3) 답글 추가(insert문)
			sql.delete(0, sql.length());
			
			sql.append(" INSERT INTO tb_bbs(bbsno, wname, subject, content, passwd, ip, grpno, indent, ansnum)");
			sql.append(" VALUES (bbs_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, bbsDto.getWname());
			pstmt.setString(2, bbsDto.getSubject());
			pstmt.setString(3, bbsDto.getContent());
			pstmt.setString(4, bbsDto.getPasswd());
			pstmt.setString(5, bbsDto.getIp());
			pstmt.setInt(6, grpno);
			pstmt.setInt(7, indent);
			pstmt.setInt(8, ansnum);
			
			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("답변 글 작성 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}//try end
		
		return  cnt;
	}//reply() end
	
	//검색된 글 수
	public int count2(String col, String word) {
		int cnt = 0;
		
		try {
			con = dbOpen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" SELECT COUNT(*) as cnt");
			sql.append(" FROM tb_bbs");
			
			if(word.length() >= 1) { //검색어가 존재하는지?
				String search = "";
				if(col.equals("subject_content")) {
					search += " WHERE subject LIKE '%" + word + "%' ";
					search += " OR content LIKE '%" + word + "%'";
				} else if(col.equals("subject")) {
					search += " WHERE subject LIKE '%" + word + "%' ";
				} else if(col.equals("content")) {
					search += " WHERE content LIKE '%" + word + "%' ";
				} else if(col.equals("wname")) {
					search += " WHERE wname LIKE '%" + word + "%' ";
				}//if end
				
				sql.append(search);
				
			}//if end
			
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("cnt"); //행 개수(count(*))를 int cnt에 저장
			}//if end
			
		} catch (Exception e) {
			System.out.println("글 개수 검색 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}//try end
		
		return cnt;
	}//count2() end
	
	//검색한 글 목록 조회 메소드
	public ArrayList<BbsDTO> list2(String col, String word){
		ArrayList<BbsDTO> list = null;
		
		try {
			con = dbOpen.getConnection();
			sql = new StringBuilder();
			
			sql.append(" SELECT bbsno, wname, subject, readcnt, regdt, indent");
			sql.append(" FROM tb_bbs");
			
			if(word.length()>=1) {//검색어가 존재 한다면
	            String search = "";
	            if(col.equals("subject_content")) {
	               search += " WHERE subject LIKE '%" + word + "%' ";
	               search += " OR content LIKE '%" + word + "%'";
	            }else if(col.equals("subject")) {
	               search += " WHERE subject LIKE '%" + word + "%' ";
	            }else if(col.equals("content")) {
	               search += " WHERE content LIKE '%" + word + "%' ";
	            }else if(col.equals("wname")) {
	               search += " WHERE wname LIKE '%" + word + "%' ";
	            }
	            
	            sql.append(search);
	         }//if end

			sql.append(" ORDER BY grpno DESC, ansnum ASC");
			
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				list = new ArrayList<BbsDTO>();
				do {
					BbsDTO bbsDto = new BbsDTO();
					bbsDto.setBbsno(rs.getInt("bbsno"));
					bbsDto.setWname(rs.getString("wname"));
					bbsDto.setSubject(rs.getString("subject"));
					bbsDto.setReadcnt(rs.getInt("readcnt"));
					bbsDto.setRegdt(rs.getString("regdt"));
					bbsDto.setIndent(rs.getInt("indent"));
					
					list.add(bbsDto); //list에 추가
				} while(rs.next());
			} else {
				list = null;
			}//if end
			
		} catch (Exception e) {
			System.out.println("검색 글 목록 조회 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}//try end
		
		return list;
	}//list2() end
	
	//페이징 글 목록 조회 메소드
	public ArrayList<BbsDTO> list3(String col, String word, int nowPage, int recordPerPage){
		ArrayList<BbsDTO> list = null;
		
		//페이지당 출력할 행의 갯수(10개를 기준)
        //1 페이지 : WHERE r>=1  AND r<=10;
        //2 페이지 : WHERE r>=11 AND r<=20;
        //3 페이지 : WHERE r>=21 AND r<=30;
        int startRow = ((nowPage-1) * recordPerPage) + 1;
        int endRow   = nowPage * recordPerPage;
		
		try {
			con = dbOpen.getConnection();
			sql = new StringBuilder();
			
			word = word.trim(); //검색어 좌우 공백 제거
			if(word.length() == 0) {
				//검색어가 없으면
				sql.append(" SELECT * ");
				sql.append(" FROM (");
				sql.append("		SELECT bbsno, wname, subject, readcnt, regdt, indent, ROWNUM AS rno");
				sql.append("		FROM (");
				sql.append("				SELECT bbsno, wname, subject, readcnt, regdt, indent");
				sql.append("				FROM tb_bbs");
				sql.append("				ORDER BY grpno DESC, ansnum ASC");
				sql.append("		)");
				sql.append(" )");
				sql.append(" WHERE rno >= " + startRow + " AND rno <= " + endRow);		
			} else {
				//검색어가 있으면
				sql.append(" SELECT * ");
				sql.append(" FROM (");
				sql.append(" 	SELECT bbsno, wname, subject, readcnt, regdt, indent, ROWNUM AS rno");
				sql.append(" 	FROM (");
				sql.append(" 			SELECT bbsno, wname, subject, readcnt, regdt, indent");
				sql.append(" 			FROM tb_bbs");
				
				String search = "";
	            if(col.equals("subject_content")) {
	            	//제목 + 내용에서 검색
	               search += " WHERE subject LIKE '%" + word + "%' ";
	               search += " OR content LIKE '%" + word + "%'";
	            }else if(col.equals("subject")) {
	            	//제목에서 검색
	               search += " WHERE subject LIKE '%" + word + "%' ";
	            }else if(col.equals("content")) {
	            	//내용에서 검색
	               search += " WHERE content LIKE '%" + word + "%' ";
	            }else if(col.equals("wname")) {
	            	//작성자명에서 검색
	               search += " WHERE wname LIKE '%" + word + "%' ";
	            }//if end
	            sql.append(search);
	            
				sql.append(" 			ORDER BY grpno DESC, ansnum ASC");
				sql.append(" 		)");
				sql.append(" )");
				sql.append(" WHERE rno >= " + startRow + " AND rno <= " + endRow);
			}//if end
			
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				list = new ArrayList<BbsDTO>();
				do {
					BbsDTO bbsDto = new BbsDTO();
					bbsDto.setBbsno(rs.getInt("bbsno"));
					bbsDto.setWname(rs.getString("wname"));
					bbsDto.setSubject(rs.getString("subject"));
					bbsDto.setReadcnt(rs.getInt("readcnt"));
					bbsDto.setRegdt(rs.getString("regdt"));
					bbsDto.setIndent(rs.getInt("indent"));
					
					list.add(bbsDto); //list에 추가
				} while(rs.next());
			} else {
				list = null;
			}//if end
			
		} catch (Exception e) {
			System.out.println("글 목록 조회 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}//try end
		
		return list;
	}//list() end

}//class end
