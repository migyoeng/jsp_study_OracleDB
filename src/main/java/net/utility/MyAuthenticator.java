package net.utility;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthenticator extends Authenticator { //javax.mail 패키지 내 Authenticator
	//사용하고자 하는 메일 서버(SMTP, POP3)에서 인증받은 계정 + 암호 등록
	//field
	private PasswordAuthentication pa;
	
	//constructor
	public MyAuthenticator() {
		pa = new PasswordAuthentication("soldesk@pretyimo.cafe24.com", "soldesk6901"); //인스턴스를 통해 ID, 비번 등록
	}//end
	
	//method
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}//getPasswordAuthentication() end
	
}//class end
