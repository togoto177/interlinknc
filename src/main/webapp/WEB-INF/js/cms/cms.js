/*function login() {
	if($("#ad_id").val().length <1){
		alert("아이디를 입력해주세요.");
	}else if($("#user_pwd").val().length <1){
		alert("비밀번호를 입력해주세요.")
	}else{
		var loginSubmit = new ComSubmit("login_form");
		loginSubmit.setUrl("/loginTry");
		loginSubmit.submit();
	}
}*/
function login() {
	if($("#user_id").val().length <1){
		alert("아이디를 입력하세요.");
		this.focus();
	}else if($("#user_pwd").val().length <1){
		alert("비밀번호를 입력해주세요");
		this.focus();
	}else{
	var url = "/loginTry";
	var comSubmit = new ComSubmit("login_form");
	comSubmit.setUrl(url);
	comSubmit.submit();
	}
}
function userIdCheck() {
	var userid = "userid="+$("#ad_id").val();
	$.ajax({
        type : 'GET',
        data : userid,
        url : "userIdCheck",
        dataType: "json",
        success : function(data) {
            if (data.cnt > 0) {
                alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
            } else {
            	$("#idchek_hidden").val("1");
                alert("사용가능한 아이디입니다.");
            }
        },
        error : function(error) {
            alert("error : " + error);
        }
    });
}
function signUpFun() {
	if($("#ad_id").val().length <5){
		alert("아이디는 5자이상 입력하세요.");
		this.focus();
	}else if($("#ad_password").val().length <1 || $("#ad_password2").val().length <1){
		alert("비밀번호를 입력해주세요");
		this.focus();
	}else if($("#ad_name").val().length <1){
		alert("이름을 입력해주세요");
		this.focus();
	}else if($("#idchek_hidden").val()!="1"){
		alert("아이디 중복채크를 해주세요.");
		this.focus();
	}else{
		var url = "/sign_form_insert";
		var comSubmit = new ComSubmit("sign_form");
		comSubmit.setUrl(url);
		comSubmit.submit();
	}
}