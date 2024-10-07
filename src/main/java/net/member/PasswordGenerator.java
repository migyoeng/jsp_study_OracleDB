package net.member;

import java.security.SecureRandom;

public class PasswordGenerator {
	//임시 비밀번호 랜덤 발급 클래스
	//허용 문자
	private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	//임시 비밀번호 길이
	private static final int PASSWORD_LENGTH = 10;
	
	//랜덤 비밀번호 부여 메소드
	public static String generateRandomPassword() {
		SecureRandom random = new SecureRandom(); //SecureRandom 인스턴스 생성
		StringBuilder password = new StringBuilder(PASSWORD_LENGTH);
		
		for(int i=0; i<PASSWORD_LENGTH; i++) {
			int index = random.nextInt(CHARACTERS.length());
			password.append(CHARACTERS.charAt(index));
		}//for end
		
		return password.toString();
	}//generateRandomPassword() end
}//class end
