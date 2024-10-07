package net.member;

public class MemberDTO { //Data Transfer Object 데이터 전송 객체
	//field
	private String id; //아이디, 중복 안됨.
	private String passwd; //패스워드
	private String mname; //성명
	private String tel; //전화번호
	private String email; //전자우편 주소, 중복 안됨
	private String zipcode; //우편번호, 12345
	private String address1; //주소 1
	private String address2; //주소 2(나머지 주소, 상세 주소)
	private String job; //직업
	private String mlevel; //회원 등급, A1, B1, C1, D1, E1, F1
	private String mdate; //가입 날짜
	
	//default constructor
	public MemberDTO() {} //end

	//method - getter/setter
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getMlevel() {
		return mlevel;
	}

	public void setMlevel(String mlevel) {
		this.mlevel = mlevel;
	}

	public String getMdate() {
		return mdate;
	}

	public void setMdate(String mdate) {
		this.mdate = mdate;
	}

	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", passwd=" + passwd + ", mname=" + mname + ", tel=" + tel + ", email=" + email
				+ ", zipcode=" + zipcode + ", address1=" + address1 + ", address2=" + address2 + ", job=" + job
				+ ", mlevel=" + mlevel + ", mdate=" + mdate + "]";
	}
	
}//class end
