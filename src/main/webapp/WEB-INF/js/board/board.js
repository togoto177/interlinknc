	$(document).ready(function() {
			
		/*$.ajax({ 
			type: 'get' , 
			url: '/mainDownList',
			dataType : 'text' ,
			success: function(data) { 
				$('#downLoadsList').html(data);
			} 
		});*/
		
		
		var totalData = $("#totalCnt").val();    // 총 데이터 수
	    var dataPerPage = 10;    // 한 페이지에 나타낼 데이터 수
	    var pageCount = "";        // 한 화면에 나타낼 페이지 수
	    if($("#totalPage").val() == "1"){
	    pageCount = 1;
	    }else if($("#totalPage").val() == "2"){
	    pageCount = 2;	
	    }else if($("#totalPage").val() == "3"){
		pageCount = 3;	
		}else if($("#totalPage").val() == "4"){
		pageCount = 4;	
		}else{
		pageCount = 5;	
		}
	    var sp = $('#servletPath').val();
	    var next = "";
	    var prev = "";
	    function paging(totalData, dataPerPage, pageCount, currentPage){
	    	var startPage = $('#startPageList').val(); //현재 페이지
	        console.log("currentPage : " + startPage);
	        
	        var totalPage = Math.ceil(totalData/dataPerPage);    // 총 페이지 수
	        var pageGroup = Math.ceil(startPage/pageCount);    // 페이지 그룹


	        console.log("pageGroup : " + pageGroup);
	        
	        var last = pageGroup * pageCount;    // 화면에 보여질 마지막 페이지 번호
	        if(last > totalPage){
	            last = totalPage;
	        }
	        var first = last - (pageCount-1);    // 화면에 보여질 첫번째 페이지 번호
	        
	        var next = last+1;
	        var prev = first-1;
	        
	        console.log("last : " + last);
	        console.log("first : " + first);
	        console.log("next : " + next);
	        console.log("prev : " + prev);
	 
	        var pingingView = $("#paging");
	        
	        var html = "";
	        	if(prev >= 5){
	        	html +=
	        		'<li class="downCntli1">' +
	        		'<a name="page_move" id="start" start_page="'+1+'">' +
	    			'<img alt="왼쪽" style="cursor:pointer;" src="resources/mainImg/download_board_arrow2.png">' +
	    			'</a>' +
	    			'<a name="page_move" id="prev" start_page="'+prev+'">' +
		            '<img alt="왼쪽" style="cursor:pointer;" src="resources/mainImg/download_board_arrow1.png">'+
		            '</a>'+
	    			'</li>';
	        	}
		        if (sp == "/mainDownList" || sp == "/main") {		
			        for(var i=first; i <= last; i++){
			        	html += '<li><a class="'+i+'" id="page_num" name="page_move" start_page="'+i+'" style="cursor:pointer;">'+ i +'</a></li>';
			        	
			        }
		        }else{
		        	for(var i=first; i <= last; i++){
		        		html += '<li><a id="'+i+'" name="page_move" start_page="'+i+'" style="cursor:pointer;">'+ i +'</a></li>';
		        		
		        	}
		        }    
	    	if(last < totalPage){
		        	html +=
	        		'<li class="downCntli2">' +
	        		'<a name="page_move" id="next" start_page="'+next+'">' + 
		    		'<img alt="오른쪽" style="cursor:pointer;" src="resources/mainImg/download_board_arrow1.png">' +
		    		'</a>' +
	        		'<a name="page_move" id="end" start_page="'+totalPage+'">' +
	    			'<img alt="오른쪽" style="cursor:pointer;" src="resources/mainImg/download_board_arrow2.png">' +
	    			'</a>' +
	    			'</li>';
	    	}
	        $("#paging").append(html);    // 페이지 목록 생성
            $("#paging a." + startPage).addClass("focus");    // 현재 페이지 표시
            $("#paging a#" + startPage).addClass("focus");    // 현재 페이지 표시
	        $("#paging a").click(function(){
	            
	            var item = $(this);
	            
	            var id = item.attr("id");
	            var selectedPage = item.text();
	            
	            if(id == "next")    selectedPage = next;
	            if(id == "prev")    selectedPage = prev;
	            if(id == "start")    selectedPage = 1;
	            if(id == "end")    selectedPage = totalPage;
	            
	            paging(totalData, dataPerPage, pageCount, selectedPage);
	        });
	                                           
	                                           
	                                           
	    }
	    
	    $(document).ready(function(){        
	        paging(totalData, dataPerPage, pageCount, 1);		        
	    });
	    
	    
	    
	    
	    
	    $(document).off("click", "a[name='page_move']").on("click","a[name='page_move']",function() {
			var id_check = $(this).attr("id"); //해당 seq값을 가져오기위해 새로 추가
			var totalPage = $('#totalPage').val(); //다운로드 목록 전체 페이지 수
			var visiblePages = 10;//리스트 보여줄 페이지
			var sp = $('#servletPath').val();
			$('#startPage').val($(this).attr("start_page"));//보고 싶은 페이지
			var startPageList = $('#startPage').val();
			$('#startPageList').val(startPageList);
			var startPage = $('#startPageList').val(); 
			$('#visiblePages').val(visiblePages);
			
			if (sp == "/mainDownList" || sp == "/main") {
				if(id_check == "page_num"){
				$.ajax({ 
					type: 'get' , 
					url: '/mainDownList?startPage='+ startPage +'&visiblePages='+visiblePages ,
					async : false,
					cache : false,
					dataType : 'text' ,
					success: function(data) { 
						$('#downLoadsList').empty();
						$('#downLoadsList').html(data).trigger("create");
						$.getScript("js/board/board.js"); 
						$.getScript("js/main/main.js"); 
					} 
				});
				}else if(id_check == "start"){
					$.ajax({ 
						type: 'get' , 
						url: '/mainDownList?startPage=1&visiblePages=10',
						async : false,
						cache : false,
						dataType : 'text' , 
						success: function(data) { 
							$('#downloads').remove();
							$('#downLoadsList').html(data).trigger("create");
							$.getScript("js/board/board.js");
							$.getScript("js/main/main.js"); 
						} 
					});

				}else if(id_check == "end"){
					$.ajax({ 
						type: 'get' , 
						url: '/mainDownList?startPage='+totalPage+'&visiblePages=10',
						async : false,
						cache : false,
						dataType : 'text' , 
						success: function(data) {
							$('#downloads').remove();
							$('#downLoadsList').html(data).trigger("create");
							$.getScript("js/board/board.js");
							$.getScript("js/main/main.js"); 
						} 
					});

				}else if(id_check == "next"){
					$.ajax({ 
						type: 'get' , 
						url: '/mainDownList?startPage='+startPage+'&visiblePages=10',
						async : false,
						cache : false,
						dataType : 'text' , 
						success: function(data) {
							$('#downloads').remove();
							$('#downLoadsList').html(data).trigger("create");
							$.getScript("js/board/board.js");
							$.getScript("js/main/main.js"); 
						} 
					});

				}else if(id_check == "prev"){
					$.ajax({ 
						type: 'get' , 
						url: '/mainDownList?startPage='+startPage+'&visiblePages=10',
						async : false,
						cache : false,
						dataType : 'text' , 
						success: function(data) {
							$('#downloads').remove();
							$('#downLoadsList').html(data).trigger("create");
							$.getScript("js/board/board.js");
							$.getScript("js/main/main.js"); 
						} 
					});

				}else if(id_check == "2018"){
					$.ajax({ 
						type: 'post' , 
						url: '/mainPortList',
						async : false,
						cache : false,
			    		data : {pf_year : id_check} ,
						dataType : 'text' , 
						success: function(data) { 
							$('#pf_context').remove();
							$('#portfolio').html(data).trigger("create");
						} 
					});

				}else if(id_check == "2009"){
					$.ajax({ 
						type: 'post' , 
						url: '/mainPortList',
						async : false,
						cache : false,
			    		data : {pf_year : id_check} ,
						dataType : 'text' , 
						success: function(data) { 
							$('#pf_context').remove();
							$('#portfolio').html(data).trigger("create");
						} 
					});

				}else if(id_check == "2008"){
					$.ajax({ 
						type: 'post' , 
						url: '/mainPortList',
						async : false,
						cache : false,
			    		data : {pf_year : id_check} ,
						dataType : 'text' , 
						success: function(data) { 
							$('#pf_context').remove();
							$('#portfolio').html(data).trigger("create");
						} 
					});

				}else if(id_check == "2007"){
					$.ajax({ 
						type: 'post' , 
						url: '/mainPortList',
						async : false,
						cache : false,
			    		data : {pf_year : id_check} ,
						dataType : 'text' , 
						success: function(data) { 
							$('#pf_context').remove();
							$('#portfolio').html(data).trigger("create");
						} 
					});

				}
			}else{
				document.board_form.submit();
			}

		});
		
			
			
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
			
			$("#searchBtn").click(function() {
				document.board_form.submit();
			
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
	
	//체크박스 전체 선택
	function all_check() { 
		
		var chk = $(this).prop("disabled");
		$('input:checkbox[name="check_box"]').each(function() {

			if (chk) {
				$('input[name="check_box"]').each(function() {
					var opt = $(this).prop("disabled");
					if (!opt) {
						$(this).attr("checked", true);
					}
				});
			} else {
				$("input[name='check_box']").attr("checked", false);
			}
		});
	};
	
	//파일선택시 텍스트 대체
	$(function(){
		$('.multi').change(function(){
			var fileValue = $('.multi').val().split("\\");
			var fileName = fileValue[fileValue.length-1];
			$('.upload_text').val(fileName);
		});
	});
	
	//게시판 체크박스 삭제
	function detailSubmit() { 
		//체크박스 선택에 따른 삭제 유무
		if(confirm("정말로 삭제 하시겠습니까?") == true) {
			if($('input:checkbox[id="checkOne"]').is(":checked") == true)  {
	           document.board_form.action='board_delete';
					alert("삭제 되었습니다.");
	          } else{
	            alert("삭제하실 목록을 체크하여 주십시오.")
	            return;
	             }
			}else{
				alert("취소 되었습니다.");
				return;
			}	
	document.board_form.submit();
	};
