	$(document).ready(function() {
		
			$("#list").click(function() {
				location.href = "cms_board?board_division=" + $("#board_division").val();
			});
			
			$("#modify").click(function() {
				location.href="cms_board_update?board_division="+$("#board_division").val()+"&board_seq="+$("#board_seq").val();
			});
			
			$("#delete").click(function() {
				location.href="cms_board_delete?board_division="+$("#board_division").val()+"&board_seq="+$("#board_seq").val();
			});
			
			$("#preview").click(function() {
				location.href="cms_board_body?board_division="+$("#board_division").val()+"&board_seq="+$("#preview").val();
			});
			
			$("#nextview").click(function() {
				location.href="cms_board_body?board_division="+$("#board_division").val()+"&board_seq="+$("#nextview").val();
			});
			
			$("#customer_select").val("${board_body.board_division}").attr("selected", "selected");
			
				
	});
	/* 파일추가버튼 */
	function addbt() {
		var fileIndex = $(".addtable").children().length+1-1;
		$("#addtd").append(
				'<tr id="file_up' + fileIndex + '"><td><img id="blah" src="#" alt="your image" /></td><td>' + 
				'<input style="width: 100%;" type="file" name="uploadfile[' + fileIndex + ']" id="file_up' + fileIndex + '"  />' +
				'</td>' +'<td align="right"><button name="file_up' + fileIndex + '" type="button" onclick="delbt(this.name)">-</button>' +
				'</td></tr>');
		
	}
	
	/* 추가된 파일 제거버튼  */
	function delbt(thisname) {
		
		var file_del = thisname;
		
	 	if (/(MSIE|Trident)/.test(navigator.userAgent)) { 
			// ie 일때 input[type=file] init.
			$("input[id=" + file_del + "]").replaceWith( $("input[id=" + file_del + "]").clone(true) );
			$("tr[id=" + file_del + "]").hide();
		} else {
			 // other browser 일때 input[type=file] init.
			$("input[id=" + file_del + "]").val(""); 
		    $("tr[id=" + file_del + "]").hide();	 
		}
		
	}
	
	
	/* 기존 파일 제거버튼 */
	function delbt_ori(thisname) {
		
		var file_del = thisname;
		
	 	if (/(MSIE|Trident)/.test(navigator.userAgent)) { 
			// ie 일때 input[type=file] init.
			$("input[id=" + file_del + "]").replaceWith( $("input[id=" + file_del + "]").clone(true) );
			$("input[id=" + file_del + "]").remove();
			$("td[id=" + file_del + "]").append(
					'<input type="file"  name="uploadfile[0]"  required="required" id="file_up0" />');
		} else {
			 // other browser 일때 input[type=file] init.
			$("input[id=" + file_del + "]").val(""); 
		    $("input[id=" + file_del + "]").remove();
		    $("td[id=" + file_del + "]").append(
			'<input type="file"  name="uploadfile[0]"  required="required" id="file_up0" />');
		}
		
	}

	//목록 첨부파일 열기
	function over(fileNamee){
		
		var con = document.getElementById("hidden"+fileNamee);
		
		if(con.style.display=='none'){
	        con.style.display = '';
	    }else{
	        con.style.display = 'none';
	    } 
	}
	//파일 다운로드
	function downFile(fileName){
		
		var file_name = fileName.split('*');
		
		if($("#board_division").val() == "download"){
			location.href="boardFileDown?file_name="+encodeURI(file_name[0])+"&board_division=download&file_seq="+file_name[1];
		}else if($("#board_division").val() == "download"){
			location.href="boardFileDown?file_name="+encodeURI(file_name[0])+"&board_division=download&file_seq="+file_name[1];
		}else if($("#board_division").val() == "portfolio"){
			location.href="boardFileDown?file_name="+encodeURI(file_name[0])+"&board_division=portfolio";
		}


	}
	//수정폼에서 기존 업로드된 파일 삭제시 id 값 c --> d로 변환시킴
	function delFile(idx){
		
		var obj = $('#flist_' + idx);

		$(obj).find('#flag').val("D");
		$(obj).hide();
	}
	
	//파일 버튼 교체 스크립트
	$(function(){          
		$('#newFile').click(function(e){
			e.preventDefault();             
			$('input[type=file]').last().click();               
		});                         
	});
	
	//customer 상태 선택만해도 변경되게
	$(function() {
		$('#status').change(function() {
			var s = this.value;
			if (s == "1") {
				alert("답변상태가 '확인'으로 변경 되었습니다.");
			}else{
				alert("답변상태가 '미확인'으로 변경 되었습니다.");
			}
			
			$("#board_form").submit(); 
	});
		
	})
	