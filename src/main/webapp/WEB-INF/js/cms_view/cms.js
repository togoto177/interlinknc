jQuery(document).ready(function($){
	$(".portTable table tr").mouseover(function(){
		$(this).find("img").attr("src", "resources/download/download_arrow_lightviolet.png");
	}).mouseleave(function(){
		$(this).find("img").attr("src", "resources/mainImg/download_arrow_white.png");
    });
});

function login() {
	if($("#user_id").val().length <1){
		alert("아이디를 입력하세요.");
		this.focus();
	}else if($("#user_pwd").val().length <1){
		alert("비밀번호를 입력해주세요");
		this.focus();
	}else{
	var url = "/interlinknc/loginTry";
	var comSubmit = new ComSubmit("login_form");
	comSubmit.setUrl(url);
	comSubmit.submit();
	}
}
function userIdCheck() {
	var userid = "userid="+$("#ad_id").val();
	$.ajax({
        type : 'POST',
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
		var url = "/interlinknc/sign_form_insert";
		var comSubmit = new ComSubmit("sign_form");
		comSubmit.setUrl(url);
		comSubmit.submit();
	}
}
function logout() {
	location.href = "/interlinknc/logout";
}

//내정보수정 유효성
function admin_modify() { 
	var str_space = /\s/; //띄어쓰기체크
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; //이메일형식체크
	
	//연락처 유효성 검사
	if($("#ad_contact").val() == '' || $("#ad_contact").val() == null || str_space.exec($("#ad_contact").val()) ){
		$("#ad_contact").focus();
		$("#ad_contact").val('');
		alert("연락처를 입력해주세요.");
		return false;
	}
	var regNumber = /^\d{2,3}-\d{3,4}-\d{4}$/;
    var temp = $("#ad_contact").val();
    if(!regNumber.test(temp))
    {
    	$("#ad_contact").focus();
        $("#ad_contact").val("");
        alert("연락처를 알맞을 형식으로 입력해주세요.(-포함)" +'\n'+ "ex)010-0000-0000");
		return false;
		
    }
	
	//이메일 유효성 검사
	if($("#ad_email").val() == '' || $("#ad_email").val() == null || str_space.exec($("#ad_email").val()) ){
		$("#ad_email").focus();
		$("#ad_email").val('');
		alert("이메일을 입력해주세요.");
		return false;
	}
	if(exptext.test($("#ad_email").val()) == false) {
		$("#ad_email").focus();
		$("#ad_email").val('');
		alert("이메일형식이 바르지 않습니다."+'\n'+"ex)info@interlinknc.com");
		return false;
	}
	$("#admin_form").submit(); 
}

	function adminDeleteSubmit() { //사원 체크삭제
    	//체크박스 선택에 따른 삭제 유무
		if(confirm("정말로 삭제 하시겠습니까?") == true) {
			if($('input:checkbox[id="checkOne"]').is(":checked") == true)  {
	           document.admin_form.action='admin_delete';
					alert("삭제 되었습니다.");
	          } else{
	            alert("삭제하실 목록을 체크하여 주십시오.")
	            return;
	             }
			}else{
				alert("취소 되었습니다.");
				return;
			}	
    document.admin_form.submit();
  };
  
  //회원가입 대기자 삭제
  function waitDelete() { 
  	//체크박스 선택에 따른 삭제 유무
  	$("#ad_rank").remove();
		if(confirm("회원가입을 거절 하시겠습니까?") == true) {
			if($('input:checkbox[id="checkOne"]').is(":checked") == true)  {
	           document.wait_form.action='wait_delete';
					alert("리스트에서 제거 되었습니다.");
	          } else{
	            alert("삭제하실 목록을 체크하여 주십시오.")
	            return;
	             }
			}else{
				alert("취소 되었습니다.");
				return;
			}	
  document.wait_form.submit();
};

//회원가입 승인
function waitSubmit() { 
		if(confirm("해당 대기자들을 승인하시겠습니까?") == true) {
			if($('input:checkbox[id="checkOne"]').is(":checked")){
				var index = $('input:checkbox[name="chk"]').index(this);
				document.wait_form.action='wait_admit';
				alert("가입이 승인 되었습니다.");
				
	          } else{
	            alert("승인하실 목록을 체크하여 주십시오.")
	            return;
	             }
			}else{
				alert("취소 되었습니다.");
				return;
			}	
  document.wait_form.submit();
};	

//datepiker 포멧
$(function() { 

	  $('input:text[name="ad_hiredate"]').datepicker({
	    dateFormat: 'yy년 mm월 dd일'
	  });
	});

//패스워드변경 submit
function password_submit() {
	$("#password_modify").submit(); 
}






  