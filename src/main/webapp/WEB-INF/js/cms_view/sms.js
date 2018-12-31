jQuery(document).ready(function($){
	$('.numDel').click(function(){
		$(this).parents('li').remove();
	});
	$('.add').click(function() {
		var text = '<li><input type="text" /><a class="numDel">삭제</a></li>';
		$('.smsNumBox ol').append(text);
		
		$('.numDel').click(function(){
			$(this).parents('li').remove();
		});
	});
	
	var fileTarget = $('.filebox .upload-hidden');
	fileTarget.on('change', function(){ // 값이 변경되면
		if(window.FileReader){ // modern browser
			var filename = $(this)[0].files[0].name;
		} else { // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
		}
	// 추출한 파일명 삽입
	$(this).siblings('.upload-name').val(filename);
	});
	
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