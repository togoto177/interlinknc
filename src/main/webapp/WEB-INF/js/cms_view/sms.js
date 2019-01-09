jQuery(document).ready(function($){
	$('.numDel').click(function(){
		$(this).parents('li').remove();
	});
	$('.result').click(function() {
		location.href = "smsResult.do";
	});
	$('.add').click(function() {
		var text = '<li><input placeholder="name" class="name" type="text" name="sms_userName" /><input placeholder="tell" class="tell) 010-1234-1234" name="sms_tell" type="text" id="numbersOnly" /><a class="numDel">삭제</a></li>';
		$('.smsNumBox ol').append(text);
		
		$('.numDel').click(function(){
			$(this).parents('li').remove();
		});
	});
	
	$('#numbersOnly').keyup(function () { 
        this.value = this.value.replace(/[^0-9]/g,'');
    });
    $('#numbersOnly').blur(function () { 
    	this.value = this.value.replace(/[^0-9]/g,'');
    });
    
    $('.smsTitle').click(function() {
    	var titleParents = $(this).parents();
    	var p = titleParents.next('.messagesTr');
    	if(p.is(":visible")){
    		p.hide();
    	}else{
    		p.show();
    	}
    });
	
	$('.send').click(function() {
		var divi = $('#division').val();
		
		for(var o=0; o<3; o++){
			var kfile = $('#searchForm2_'+o).val();
			if(kfile !="파일선택"){
				divi="M"
			}
		}
		
		
		var url = "/send_api.do";
		var comSubmit = new ComSubmit("send_api");
		comSubmit.setUrl(url);
		comSubmit.addParam("sms_division",divi);
		comSubmit.submit();
	});
	
	/* 파일명 추출(변화시 라벨에 입력) */
    var fileTarget = $('.filebox .upload-hidden'); 
    fileTarget.on('change', function(){ // 값이 변경되면
    	/* 파일 용량 체크 */
    	var filesize = $(this)[0].files[0].size / 1024;
    	if(filesize>500){
    		alert("파일용량이 초과하였습니다.\n500kb이하만 전송가능합니다.");	
    		if (navigator.userAgent.toLowerCase().indexOf("msie") != -1) {
    		       $(this).replaceWith( $(this).clone(true) );  // ie 일때 초기화
    		     } else {
    		      $(this).val("");
    		     }
    	}
    	console.log(filesize);
    	/* 파일 용량 체크  end */
    	if(window.FileReader){ // modern browser
    		var filename = $(this)[0].files[0].name;
    	} else { // old IE
    		var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
		} // 추출한 파일명 삽입
		
		/* 확장자로 이미지파일 만 전송 구분 */
		var hw = filename.split('.');
		/*console.log(hw);*/
		var or = hw.length-1;
		var hw1 = hw[or];
		/*console.log(hw1);*/
	 	if(hw1 != "jpg" && hw1 != "JPG"){
			alert("이미지 파일(jpg)만 전송가능합니다.");
			return 0;
		}
	 	/* 확장자로 이미지파일 만 전송 구분 end */
	 	
		$(this).siblings('.upload-name').val(filename);
	});
    /* 파일명 추출(변화시 라벨에 입력) end */
	
	/* 초기 메시지 카운트 */
	var content1 = $('#messages1').val();
	var dom=$('#messages1');
    var str=dom.val();
    var maxlength = 1990;
    var _byte=0;
    var strlength=0;
    var charStr='';
    var cutstr='';
    if(str.length<=0){ return; }
    for(var i=0;i<str.length;i++){
      charStr=str.charAt(i);
      if(escape(charStr).length>4){ _byte+=2; }else{  _byte++; }
      if(_byte<=maxlength){ strlength=i+1; }
    }
    $('#textarea_msg1').text(_byte+"/80");
    /* 초기 메시지 카운트 end */
	/*매세지 카운트*/
	$('#messages1').keyup(function (e){
		dom=$(this);
	    str=dom.val();
	    _byte=0;
	    strlength=0;
	    charStr='';
	    cutstr='';
	    if(str.length<=0){ return; }
	    for(var i=0;i<str.length;i++){
	      charStr=str.charAt(i);
	      if(escape(charStr).length>4){ _byte+=2; }else{ _byte++; }
	      if(_byte<=maxlength){ strlength=i+1; }
	    }
          
	    if(_byte>80){
		      $('#textarea_msg1').text(_byte+"/2000");
		      $('#textarea_msg1').css('background','#3f51b5');
		      $('#textarea_msg1').css('width','75px');
		      $('#division').val('L');
		      return;
		    }else{
		      $('#textarea_msg1').text(_byte+"/80");
		      $('#textarea_msg1').css('background','#e91e63');
		      $('#textarea_msg1').css('width','45px');
		      $('#division').val('S');
		    }
      });
	/*매세지 카운트 end*/
});