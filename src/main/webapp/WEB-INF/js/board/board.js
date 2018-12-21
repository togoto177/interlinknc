	$(document).ready(function() {
			//게시물 등록 클릭
			$("#insert_view").click(function() {
				location.href = "portfolioWrite?board_division=" + $("#board_division").val();
			});
			
			$("#delete").click(function() {
				if (confirm("정말 삭제하시겠습니까??") == true){    //확인
				    location.href="board_delete?board_division="+$("#board_division").val()+"&board_seq="+$("#board_seq").val();
				}else{   //취소
				    return;
				}
				
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
			$("#pagination").append(pagination);
			//--페이지 셋팅

			//하단 네비바 클릭 시 이동
			$(document).on("click","a[name='page_move']",function() {

						var id_check = $(this).attr("id"); //해당 seq값을 가져오기위해 새로 추가
						var totalPage = $('#totalPage').val(); //다운로드 목록 전체 페이지 수
						var visiblePages = 10;//리스트 보여줄 페이지
						var sp = $('#servletPath').val();
						
						if(id_check == "page_num"){
						$('#startPage').val($(this).attr("start_page"));//보고 싶은 페이지
						var startPage = $('#startPage').val();
						$('#visiblePages').val(visiblePages);


						if (sp == "/mainDownList" || sp == "/main_test") {

							$.ajax({ 
								type: 'get' , 
								url: '/mainDownList?startPage='+ startPage +'&visiblePages='+visiblePages ,
								dataType : 'text' , 
								success: function(data) { 
									$('#Context').remove();
									$('#a').html(data);
								} 
							});
						}else{
							document.board_form.submit(); 
						}

						}if(id_check == "page_first"){
							$.ajax({ 
								type: 'get' , 
								url: '/mainDownList?startPage=1&visiblePages=10',
								dataType : 'text' , 
								success: function(data) { 
									$('#Context').remove();
									$('#a').html(data);
								} 
							});

						}else if(id_check == "page_last"){
							$.ajax({ 
								type: 'get' , 
								url: '/mainDownList?startPage='+totalPage+'&visiblePages=10',
								dataType : 'text' , 
								success: function(data) {
									$('#Context').remove();
									$('#a').html(data);
								} 
							});

						}else if(id_check == "2018"){
							$.ajax({ 
								type: 'get' , 
								url: '/mainPortList',
								async : false,
					    		data : {pf_year : id_check} ,
								dataType : 'text' , 
								success: function(data) { 
									$('#pf_context').remove();
									$('#portfolio').html(data).trigger("create");
								} 
							});

						}else if(id_check == "2009"){
							$.ajax({ 
								type: 'get' , 
								url: '/mainPortList',
								async : false,
					    		data : {pf_year : id_check} ,
								dataType : 'text' , 
								success: function(data) { 
									$('#pf_context').remove();
									$('#portfolio').html(data).trigger("create");
								} 
							});

						}else if(id_check == "2008"){
							$.ajax({ 
								type: 'get' , 
								url: '/mainPortList',
								async : false,
					    		data : {pf_year : id_check} ,
								dataType : 'text' , 
								success: function(data) { 
									$('#pf_context').remove();
									$('#portfolio').html(data).trigger("create");
								} 
							});

						}else if(id_check == "2007"){
							$.ajax({ 
								type: 'get' , 
								url: '/mainPortList',
								async : false,
					    		data : {pf_year : id_check} ,
								dataType : 'text' , 
								success: function(data) { 
									$('#pf_context').remove();
									$('#portfolio').html(data).trigger("create");
								} 
							});

						}
						


					});				
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
		var obj2 = $('#addfile_' + idx);
		if ($('#board_division').val() == "portfolio"){
			$('#newFile').attr('disabled', false);
		}
		$(obj).find('#flag').val("D");
		$(obj).hide();
		$(obj2).show();
		
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
		
	});
	
	

	