/**
 * myscript.js
 */

//게시판 글 작성 폼 유효성 검사
function bbsCheck(){
    //1) 작성자 칸 2글자 이상 입력
    let wname = $("#wname").val(); //id="wname" 인 태그의 value 값 가져오기
    wname = wname.trim();
    if(wname < 2){
        alert("작성자명을 2자 이상 입력해주시기 바랍니다.");
        $("#wname").focus();    //작성자 칸에 커서 생성
        return false;           //submit 하지 않음
    }//if end

    //2) 제목 2글자 이상 입력
    let subject = $("#subject").val();
    subject = subject.trim();
    if(subject < 2){
        alert("제목을 2자 이상 입력해주시기 바랍니다.");
        $("#subject").focus();
        return false;
    }//if end

    //3) 내용 3글자 이상 입력
    let content = $("#summernote").val();
    content = content.trim();
    if(content < 3){
        alert("내용을 3자 이상 입력해주시기 바랍니다.");
        $("#summernote").focus();
        return false;
    }//if end

    //4) 비밀번호 : 4자리 이상, 숫자만 입력
    let passwd = $("#passwd").val();
    passwd = passwd.trim();
    //isNaN() : 숫자로 변경 가능 = false, 숫자로 변환 불가능한 경우 = true
    if(passwd.length < 4 || isNaN(passwd)){
        alert("비밀번호를 4자리 이상 숫자로 입력해주시기 바랍니다.");
        $("#passwd").focus();
        return false;
    }//if end

    return true;    //onsubmit 호출 시 true 반환 -> 서버로 전송
}//bbsCheck() end

//게시글 삭제 시 비밀번호 입력 유효성 검사, 진행 여부
function pwCheck(){
	let passwd = $("#passwd").val();
    passwd = passwd.trim();
    //isNaN() : 숫자로 변경 가능 = false, 숫자로 변환 불가능한 경우 = true
    if(passwd.length < 4 || isNaN(passwd)){
        alert("비밀번호를 4자리 이상 숫자로 입력해주시기 바랍니다.");
        $("#passwd").focus();
        return false;
    }//if end
	
	let message = "삭제 후 내용은 복구되지 않습니다.\n계속 진행하시겠습니까?";
	if(confirm(message)){
		//확인 버튼을 눌렀을 경우
		return true; //삭제 서버로 전송
	} else {
		//취소 버튼을 눌렀을 경우
		return false; //서버로 전송하지 않음
	}//if end
	
}//pwCheck() end

//검색어를 검색했는지 확인 메소드
function searchCheck(){
	let word = $("#word").val();
	word = word.trim();
	if(word.length == 0){		 //검색어를 입력하지 않았으면
		alert("검색어를 입력해주세요");//서버로 전송하지 않음
		return false;
	}//if end
	
	return true; //검색어 입력시 서버(bbsList.jsp)로 전송
}//searchCheck() end

//로그인 유효성 검사
function loginCheck(){
	//1) 아이디 5~10글자 이내 인지 검사
	let id = $("#id").val();
	id = id.trim();
	if(!(id.length>=5 && id.length<=10)){
		alert("아이디를 5~10글자 이내로 입력해주세요");
		$("#id").focus();
		return false;
	}//if end
	
	//2) 비밀번호 5~10글자 이내 인지 검사
	let passwd = $("#passwd").val();
	passwd = passwd.trim();
	if(!(passwd.length>=5 && passwd.length<=10)){
		alert("비밀번호를 5~10글자 이내로 입력해주세요");
		$("#passwd").focus();
		return false;
	}//if end

	return true;
}//loginCheck() end

//회원가입 시 아이디 중복체크 여부
function idCheck(){
	//모달창
	//->부모창과 자식창이 한몸으로 구성되어 있음
	//->참조 https://www.w3schools.com/bootstrap/bootstrap_modal.asp
	
	//새창 만들기(팝업)
	//->부모창과 자식창이 별개로 구성되어 있음
	//->모바일에 기반을 둔 frontend단(SPA)에서는 사용하지 말것!!
	//->참조 https://www.w3schools.com/jsref/met_win_open.asp
	//window.open("파일명", "새창이름", "다양한옵션들")
	window.open("idCheckForm.jsp", "idwin", "width=400, height=350");
}//idCheck() end

//과제) 회원가입 시 이메일 중복체크 여부
function emailCheck(){
	window.open("emailCheckForm.jsp", "emailwin", "width=400, height=350");
}//emailCheck() end

//회원가입 유효성 검사
function memberCheck(){
	//1)아이디 5~10글자 인지?
	let id = $("#id").val();
	id = id.trim();
	if(!(id.length >= 5 && id.length <= 10)){
		alert("아이디를 5~10글자 이내로 입력해주세요");
		$("#id").focus();
		return false;
	}//if end

	//아이디명 금칙어 : guest
	//auth.jsp에서 로그인하지 않은 id는 "guest"로 저장
	if(id == "guest"){
		alert("guest는 사용 불가능한 ID입니다");
		return false;
	}//if end
	
    //2)비밀번호 5~10글자 인지?
	let passwd = $("#passwd").val();
	passwd = passwd.trim();
	if(!(passwd.length >= 5 && passwd.length <= 10)){
		alert("비밀번호를 5~10글자 이내로 입력해주세요");
		$("#passwd").focus();
		return false;
	}//if end
	
    //3)비밀번호와 비밀번호확인이 서로 일치하는지?
	let repasswd = $("#repasswd").val();
	repasswd = repasswd.trim();
	if(passwd.length < 5 || passwd != repasswd){
		alert("비밀번호를 다시 한번 확인해주세요");
		$("#repasswd").focus();
		return false;
	}//if end

    //4)이름 두글자 이상 인지?
	let mname = $("#mname").val();
	mname = mname.trim();
	if(mname.length < 2){
		alert("이름을 2글자 이상 입력해주세요");
		$("#mname").focus();
		return false;
	}//if end

    //5)이메일 5글자 인지?
	let email = $("#email").val();
	email = email.trim();
	if(email.length < 5){
		alert("이메일을 다시 한번 확인해주세요");
		$("#email").focus();
		return false;
	}//if end

    //6)직업을 선택했는지?
	let job = $("#job").val();
	if(job == "0"){
		alert("직업을 선택해주세요");
		return false;
	}//if end

	return true; //위 모든 조건 충족 시 submit
}//memberCheck() end

//아이디/비밀번호 찾기 유효성 검사
function findIDCheck(){
	//1) 이름 2글자 이상인지 확인
	let mname = $("#mname").val();
	mname = mname.trim();
	if(mname.length < 2){
		alert("이름을 2글자 이상 입력해주세요");
		$("#mname").focus();
		return false;
	}//if end
	
	//2)이메일 5글자 인지?
	let email = $("#email").val();
	email = email.trim();
	const pattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-za-z0-9\-]+/;
				
	if(pattern.test(email) === false){
		alert("이메일 형식에 맞지 않습니다");
		return false;
	}//if end

	return true;
}//loginCheck() end