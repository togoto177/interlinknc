	$(document).ready(function() {
			//게시물 등록 클릭
			$("#insert_view").click(function() {
				location.href = "cms_board_insert?board_division=" + $("#board_division").val();
			});
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
				
				var startPage = $('#startPage').val(); //현재 페이지
				var totalPage = $('#totalPage').val(); //전체 페이지
				//--페이지 셋팅
				
				var pagination = "";

				//--페이지네이션에 항상 10개가 보이도록 조절
				var forStart = 0;
				var forEnd = 0;

				if ((startPage - 5) < 1) {
					forStart = 1;
				} else {
					forStart = startPage - 5;
				}

				if (forStart == 1) {

					if (totalPage > 9) {
						forEnd = 10;
					} else {
						forEnd = totalPage;
					}

				} else {

					if ((startPage + 4) > totalPage) {

						forEnd = totalPage;

						if (forEnd > 9) {
							forStart = forEnd - 9
						}

					} else {
						forEnd = startPage + 4;
					}
				}
				//--페이지네이션에 항상 10개가 보이도록 조절

				//전체 페이지 수를 받아 돌린다.
				for (var i = forStart; i <= forEnd; i++) {
					if (startPage == i) {
						
						pagination  +=  '<a class="focus" name="page_move" id="page_num" start_page="'+i+'" disabled>'
								+ i + '</a>';
					} else {
						pagination += ' <a name="page_move" id="page_num" start_page="'+i+'" style="cursor:pointer;" >'
								+ i + '</a>';
					}
				}
				//하단 페이지 부분에 붙인다.
				$("#pagination").append('' + pagination + '');
				//--페이지 셋팅

				$("#searchBtn").click(function() {
					document.board_form.submit();
				
				});
				

				//하단 네비바 클릭 시 이동
				$(document).on("click","a[name='page_move']",function() {
					
							var id_check = $(this).attr("id"); //해당 seq값을 가져오기위해 새로 추가
							var totalPage = $('#totalPage').val(); //다운로드 목록 전체 페이지 수
							var visiblePages = 10;//리스트 보여줄 페이지
							
							if(id_check == "page_num"){
							$('#startPage').val($(this).attr("start_page"));//보고 싶은 페이지
							var startPage = $('#startPage').val();
							$('#visiblePages').val(visiblePages);
							
							var wow = $('#wow').val();
							
							if (wow == "/test" || wow == "/main1") {
								
								$.ajax({ 
									type: 'get' , 
									url: '/test?startPage='+ startPage +'&visiblePages='+visiblePages ,
									dataType : 'text' , 
									success: function(data) { 
										$('#Context').remove();
										$('#downloads').html(data);
									} 
								});
							}else{
								document.board_form.submit(); 
							}
							
							}if(id_check == "page_first"){
								$.ajax({ 
									type: 'get' , 
									url: '/test?startPage=1&visiblePages=10',
									dataType : 'text' , 
									success: function(data) { 
										$('#Context').remove();
										$('#downloads').html(data);
									} 
								});
								
							}else if(id_check == "page_last"){
								$.ajax({ 
									type: 'get' , 
									url: '/test?startPage='+totalPage+'&visiblePages=10',
									dataType : 'text' , 
									success: function(data) {
										$('#Context').remove();
										$('#downloads').html(data);
									} 
								});
								
							}
						

						});
				
				
				var i = $("#hidden_type").val();
				$("#sch_type > option[value='"+i+"']").attr("selected","selected");

			
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
	
	
	//기존 파일 제거버튼
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
		if(file_name[1] == "download"){
			location.href="boardFileDown?file_name="+encodeURI(file_name[0])+"&board_division="+file_name[1]+"&file_seq="+file_name[2];
		}else if(file_name[1] == "portfolio"){
			location.href="boardFileDown?file_name="+encodeURI(file_name[0])+"&board_division="+file_name[1];
		}


	}
	//수정폼에서 기존 업로드된 파일 삭제시 id 값 c --> d로 변환시킴
	function delFile(idx){
		
		var obj = $('#flist_' + idx);
		if ($('#board_division').val() == "portfolio"){
			$('#newFile').attr('disabled', false);
		}
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
			var status = this.value;
			if (status == "1") {
				alert("답변상태가 '확인'으로 변경 되었습니다.");
			}else{
				alert("답변상태가 '미확인'으로 변경 되었습니다.");
			}
			$("#board_form").submit(); 
	});
		
	})
	
	
		$(document).ready(function() {
		// 네이버 에디터  
		var oEditors = [];
		
		nhn.husky.EZCreator.createInIFrame({
		    oAppRef: oEditors,
		    elPlaceHolder: "board_content",
		    sSkinURI: "util/naver_edit/SmartEditor2Skin.html",
		    fCreator: "createSEditor2",
		    htParams : { // 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
		    bUseToolbar : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
		    bUseVerticalResizer : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
		    bUseModeChanger : true, 
		    }


		});
		 
		$(document).on("click","#save",function(e){

			if (confirm("글을 등록 하시겠습니까?") == true){    //확인
				// 제목 유효성 검사
				if($("#board_title").val() == '' || $("#board_title").val() == null || $("#board_title").val().indexOf(" ") >= 0){
				    alert("제목을 입력해주세요.");
				    return false;
				}
				if($("#board_title").val().length > 21){
				    alert("제목은 20자이상 입력할 수 없습니다.");
				    return false;
				}
			
				
				if($("#board_division").val() == 'portfolio'){
					// 구분 유효성 검사
					if($("#pf_division").val() == '' || $("#pf_division").val() == null || $("#pf_division").val().indexOf(" ") >= 0){
						alert("구분을 입력해주세요.");
						return false;
					}
					if($("#pf_division").val().length > 10){
						alert("구분은 10자이상 입력할 수 없습니다.");
						return false;
					}
					// 사업기간 유효성 검사
					if($("#business_period").val() == '' || $("#business_period").val() == null || $("#business_period").val().indexOf(" ") >= 0){
						alert("사업기간을 입력해주세요.");
						return false;
					}
					// 발주처 유효성 검사
					if($("#buyer").val() == '' || $("#buyer").val() == null || $("#buyer").val().indexOf(" ") >= 0){
						alert("발주처를 입력해주세요.");
						return false;
					}
					// 발주처 유효성 검사
					if($("#link").val() == '' || $("#link").val() == null || $("#link").val().indexOf(" ") >= 0){
						alert("연결주소를 입력해주세요.");
						return false;
					}
				
					// 파일 유효성 검사
					if($("input[type=file]").val() == '' || $("input[type=file]").val() == null){
						alert("포트폴리오 사진을 선택해주세요.");
					    return false;
					}
				}
				

			// id가 smarteditor인 textarea에 에디터에서 대입 
			oEditors.getById["board_content"].exec("UPDATE_CONTENTS_FIELD", []); 
			// 이부분에 에디터 validation 검증
			$("#board_form").submit(); 
			}else{   
			    return;
			}
		
		  });
	});
	

	