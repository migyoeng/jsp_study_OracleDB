package net.member;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import net.utility.DBClose;
import net.utility.DBOpen;
import net.utility.MyAuthenticator;

public class MemberDAO { //Data Access Object 데이터 비즈니스 로직 구현
	
	//field
	private DBOpen dbOpen = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	StringBuilder sql = null;
	
	//constructor
	public MemberDAO() {
		dbOpen = new DBOpen();	//db 연결 인스턴스 생성
	}//end
	
	//method
	
	//아이디/비밀번호 일치 시 회원 등급 반환 메소드
	public String loginProc(MemberDTO memberDto) {
		String mlevel = null;
		
		try {
			con = dbOpen.getConnection();
			
			sql = new StringBuilder();
			
			sql.append(" SELECT mlevel");
			sql.append(" FROM member");
			sql.append(" WHERE id=? AND passwd=?");
			sql.append(" AND mlevel in ('A1', 'B1', 'C1', 'D1')");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, memberDto.getId());
			pstmt.setString(2, memberDto.getPasswd());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mlevel = rs.getString("mlevel");
			}//if end
			
		} catch (Exception e) {
			System.out.println("로그인 실패: " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}//try end
		
		return mlevel;
	}//loginProc() end
	
	//아이디 중복 확인
	public int duplecateID(String id) {
		int cnt = 0;
		
		try {
			con = dbOpen.getConnection();
			
			sql = new StringBuilder();
			
			sql.append(" SELECT count(id) AS cnt");
			sql.append(" FROM member");
			sql.append(" WHERE id = ?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			}//if end
		} catch (Exception e) {
			System.out.println("아이디 중복 확인 실패: " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}//try end
		
		
		return cnt;
	}//duplecateID() end
	
	//이메일 중복 확인
	public int duplecateEmail(String email) {
		int cnt = 0;
		
		try {
			con = dbOpen.getConnection();
			
			sql = new StringBuilder();
			
			sql.append(" SELECT count(email) AS cnt");
			sql.append(" FROM member");
			sql.append(" WHERE email = ?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			}//if end
		} catch (Exception e) {
			System.out.println("이메일 중복 확인 실패: " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}//try end
		
		
		return cnt;
	}//duplecateID() end
		
	//회원가입
	public int create(MemberDTO memberDto) {
		int cnt = 0;
		
		try {
			con = dbOpen.getConnection();
			sql = new StringBuilder();
			
			sql.append(" INSERT INTO member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)");
			sql.append(" VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 'D1', sysdate)");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, memberDto.getId());
			pstmt.setString(2, memberDto.getPasswd());
			pstmt.setString(3, memberDto.getMname());
			pstmt.setString(4, memberDto.getTel());
			pstmt.setString(5, memberDto.getEmail());
			pstmt.setString(6, memberDto.getZipcode());
			pstmt.setString(7, memberDto.getAddress1());
			pstmt.setString(8, memberDto.getAddress2());
			pstmt.setString(9, memberDto.getJob());
			
			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("회원가입 실패: " + e);
		} finally {
			DBClose.close(con, pstmt);
		}//try end
		
		return cnt;
	}//create() end
		
	//아이디/비밀번호 찾기
	//이름, 이메일과 일치하는 회원의 id 값 가져오기
	public boolean findID(MemberDTO memberDto) {
		boolean flag = false;
		
		try {
			con = dbOpen.getConnection();
			sql = new StringBuilder();
			sql.append(" SELECT id");
			sql.append(" FROM member");
			sql.append(" WHERE mname=? AND email=?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, memberDto.getMname());
			pstmt.setString(2, memberDto.getEmail());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//조회된 레코드가 있으면
				//1) 아이디 값 가져오기
				String id = rs.getString("id");
				
				//2) 임시 비밀번호 발급
				//	-> 대문자, 소문자, 숫자 랜덤 10글자 생성
				String[] ch = {
                       "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
                       "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
                       "0","1","2","3","4","5","6","7","8","9"
               };
			
				//ch 배열에서 랜덤으로 10글자 가져오기
				StringBuilder tempPW = new StringBuilder();//임시 비밀번호를 담을 인스턴스 변수
				for(int i=0; i<10; i++) {
					int num = (int)(Math.random()*ch.length);
					tempPW.append(ch[num]);
				}//for end
				
				//3) 발급 받은 2)의 임시비밀번호로 테이블 수정
				sql = new StringBuilder();
				
				sql.append(" UPDATE member");
				sql.append(" SET passwd=?");
				sql.append(" WHERE mname=? AND email=?");
				
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, tempPW.toString());
				pstmt.setString(2, memberDto.getMname());
				pstmt.setString(3, memberDto.getEmail());
				
				int cnt = pstmt.executeUpdate();
				if(cnt == 1) {
					//테이블이 수정됐다면
					
					//4) 1)의 아이디와 2)의 임시비밀번호(tempPW)를 웹메일 전송
					//메일 내용
					String content = "아이디와 임시 비밀번호 발급<br>";
					content += "임시 비밀번호로 로그인 한 후, 회원 정보에서 비밀번호를 변경하실 수 있습니다.";
					content += "<hr>";
					content += "<table>";
					content += "<tr>";
					content += "<th style='width: 200px; background-color: #f0f0f0; border-bottom: 1px solid'>아이디</th>";
					content += "<th style='width: 200px; background-color: #f0f0f0; border-bottom: 1px solid'>임시 비밀번호</th>";
					content += "</tr>";
					content += "<tr>";
					content += "<td style='text-align: center'>" + id + "</td>";
					content += "<td style='font-weight: bold; font-size: 18px; text-align: center'>" + tempPW.toString() + "</td>";
					content += "</tr>";
					content += "</table>";
					
					String mailServer = "mw-002.cafe24.com"; //cafe24 메일 서버
					Properties props = new Properties();
					props.put("mail.smtp.host", mailServer);
					props.put("mail.smtp.auth", true);
					
					Authenticator myAuth = new MyAuthenticator(); //다형성
					Session sess = Session.getInstance(props, myAuth);
					
					InternetAddress[] address = {new InternetAddress(memberDto.getEmail())};
					//메일 관련 정보
					Message msg = new MimeMessage(sess);
					//받는 사람
					msg.setRecipients(Message.RecipientType.TO, address);
					//보내는 사람
					msg.setFrom(new InternetAddress("webmaster@greenit.co.kr"));
					//메일 제목
					msg.setSubject("MyWeb 아이디/임시 비밀번호 발급");
					//메일 내용
					msg.setContent(content, "text/html; charset=UTF-8");
					//메일 전송 날짜/시간
					msg.setSentDate(new Date());
					//메일 전송
					Transport.send(msg);
					
					//아이디 찾기 + 임시 비밀번호 발급 + 임시 비밀번호 db 수정까지 완료
					flag = true;
				}//if end
			}//if end
		} catch (Exception e) {
			System.out.println("이름,이메일과 일치하는 id 조회 실패: " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}//try end
		
		return flag;
	}//findID() end
		
	/*
	 * //아이디/비밀번호 찾기 //이름, 이메일과 일치하는 회원의 id 값 가져오기
	 * public String findID(String mname, String email) {
	 * String id = null;
	 * 
	 * try { con = dbOpen.getConnection(); sql = new StringBuilder();
	 * sql.append(" SELECT id"); sql.append(" FROM member");
	 * sql.append(" WHERE mname=? AND email=?");
	 * 
	 * pstmt = con.prepareStatement(sql.toString()); pstmt.setString(1, mname);
	 * pstmt.setString(2, email);
	 * 
	 * rs = pstmt.executeQuery(); if(rs.next()) { //조회된 레코드가 있으면 id =
	 * rs.getString("id"); }//if end } catch (Exception e) {
	 * System.out.println("이름,이메일과 일치하는 id 조회 실패: " + e); } finally {
	 * DBClose.close(con, pstmt, rs); }//try end
	 * 
	 * return id; }//findID() end
	 */
}//class end
