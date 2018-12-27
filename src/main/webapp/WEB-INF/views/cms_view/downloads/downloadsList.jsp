<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../cms_include.jsp"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>interLink&amp;C</title>
<script type="text/javascript">
$(document).ready(function() {
			
			var totalData = $("#totalCnt").val();    // 총 데이터 수
		    var dataPerPage = 10;    // 한 페이지에 나타낼 데이터 수
		    var pageCount = 5;        // 한 화면에 나타낼 페이지 수
		    function paging(totalData, dataPerPage, pageCount, currentPage){
		        
		        console.log("currentPage : " + currentPage);
		        
		        var totalPage = Math.ceil(totalData/dataPerPage);    // 총 페이지 수
		        var pageGroup = Math.ceil(currentPage/pageCount);    // 페이지 그룹

		        
		        console.log("pageGroup : " + pageGroup);
		        
		        var last = pageGroup * pageCount;    // 화면에 보여질 마지막 페이지 번호
		        if(last > totalPage)
		            last = totalPage;
		        var first = last - (pageCount-1);    // 화면에 보여질 첫번째 페이지 번호
		        var next = last+1;
		        var prev = first-1;
		        
		        console.log("last : " + last);
		        console.log("first : " + first);
		        console.log("next : " + next);
		        console.log("prev : " + prev);
		 
		        var $pingingView = $("#paging");
		        
		        var html = "";
		        
		        if(prev > 0)
		            html += '<li class="portCount1">'+
		            '<a href="#" id="prev">' +
		            '<img alt="왼쪽" style="cursor:pointer;" src="resources/mainImg/download_board_arrow1.png">'+
		            '</a>'+
		            '</li>' ;
		        
		        for(var i=first; i <= last; i++){
		            html += '<li><a id="'+i+'" name="page_move" start_page="'+i+'">'+ i +'</a></li>';
		            
		        }
		        
		        if(last < totalPage)
		            html += '<li class="portCount2">'+
		            '<a href="#" id="next">' + 
		    		'<img alt="오른쪽" style="cursor:pointer;" src="resources/mainImg/download_board_arrow1.png">' +
		    		'</a>' +
		    		'</li>';
		        
		        $("#paging").html(html);    // 페이지 목록 생성
		        $("#paging a").css("color", "black");
		        $("#paging a#" + currentPage).css({"text-decoration":"none", 
		                                           "color":"red", 
		                                           "font-weight":"bold"});    // 현재 페이지 표시
		                                           
		        $("#paging a").click(function(){
		            
		            var item = $(this);
		            
		            var id = item.attr("id");
		            var selectedPage = item.text();
		            
		            if(id == "next")    selectedPage = next;
		            if(id == "prev")    selectedPage = prev;
		            
		            paging(totalData, dataPerPage, pageCount, selectedPage);
		        });
		                                           
		                                           
		                                           
		    }
		    
		    $("document").ready(function(){        
		        paging(totalData, dataPerPage, pageCount, 1);
		    });
		    
		  //하단 네비바 클릭 시 이동
			$(document).on("click","a[name='page_move']",function() {
						alert();
						var id_check = $(this).attr("id"); //해당 seq값을 가져오기위해 새로 추가
						var totalPage = $('#totalPage').val(); //다운로드 목록 전체 페이지 수
						var visiblePages = 10;//리스트 보여줄 페이지
						var sp = $('#servletPath').val();
						
						if(id_check == "page_num"){
						$('#startPage').val($(this).attr("start_page"));//보고 싶은 페이지
						var startPageList = $('#startPage').val();
						$('#startPageList').val(startPageList);
						var startPage = $('#startPageList').val(); 
						$('#visiblePages').val(visiblePages);
						if (sp == "/mainDownList" || sp == "/main_test") {
							
							$.ajax({ 
								type: 'get' , 
								url: '/mainDownList?startPage='+ startPage +'&visiblePages='+visiblePages ,
								dataType : 'text' ,
								success: function(data) { 
									$('#Context').remove();
									$('#pagination').empty();
									$('#a').html(data).trigger("create");
									history.go(-1);
									$("#pagination").append(pagination);
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
									$('#pagination').empty();
									$('#a').html(data).trigger("create");
									history.go(-1);
									$("#pagination").append(pagination);
								} 
							});

						}else if(id_check == "page_last"){
							$.ajax({ 
								type: 'get' , 
								url: '/mainDownList?startPage='+totalPage+'&visiblePages=10',
								dataType : 'text' , 
								success: function(data) {
									$('#Context').remove();
									$('#pagination').empty();
									$('#a').html(data).trigger("create");
									history.go(-1);
									$("#pagination").append(pagination);
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
</script>
</head>
<body>
<%@ include file="../cms_header.jsp"%>
<%@ include file="../cms_left_bar.jsp"%>
<div class="portfolioBody">
	<div class="portTitle">
		<img alt="이미지" src="resources/mainImg/diagonal_download.png">
		<a>DOWNLOADS</a>
	</div>
	<input type="hidden" id="startPageList" name="startPageList" value="${startPage}">
	<input type="hidden" id="totalPage" name="totalPage" value="${totalPage}">
	<input type="hidden" id="totalCnt" name="totalCnt" value="${totalCnt}">
	<form name="board_form"  method="get">
	<input type="hidden" id="board_division" name="board_division" value="${board_division}">
	<input type="hidden" id="startPage" name="startPage" value="">
	<input type="hidden" id="visiblePages" name="visiblePages" value="">
	<div class="portSerch">
	<input type="text" class="searchForm" id="sch_value" name="sch_value" value="${sch_value}" /><img alt="돋보기" style="cursor:pointer;" src="resources/cms/search.png" id="searchBtn">
	<input type="hidden" value="board_title" name="sch_type" />
	</div>
	</form>
	<div class="portTable">
		<table>
			<colgroup>
					<col style="width: 5%" />
					<col style="width: 50%" />
					<col style="width: 15%" />
					<col style="width: 10%" />
					<col style="width: 10%" />
					<col style="width: 10%" />
			</colgroup>
			<tr class="portTh">
				<td>No</td>
				<td>제목</td>
				<td>일자</td>
				<td>다운로드</td>
				<td>다운수</td>
				<td>조회수</td>
			</tr>
			<c:forEach var="board_list" items="${board_list}"  varStatus="status">
			<input type="hidden" id="filename" name="filename" value="${filename}">
			<tr class="portTd">
				<td><!--역순공식: 전체 레코드 수 - ( (현재 페이지 번호 - 1) * 한 페이지당 보여지는 레코드 수 + 현재 게시물 출력 순서 ) -->
                <c:set var="startpage" value="${startPage-1}" />
                <c:set var="statuscount" value="${status.count }" />
                ${totalCnt+1-(startpage*10+statuscount)}</td>
				<td class="title"><a href="/downloadsUpdate?board_division=${board_division}&board_seq=${board_list.board_seq}">${board_list.board_title}</a></td>
				<td>${board_list.board_registerdate}</td>
				<td>
				
				<!-- <img alt="" src="resources/mainImg/download_arrow_white.png"> -->
				<c:set var="boardlist" value="${board_list.file_sub_name}" />													
						<c:set var="split_file" value="${fn:split(board_list.file_sub_name,'|')}" />
						<c:if test="${board_list.file_cnt == 0}">
						X
						</c:if>
						<c:if test="${board_list.file_cnt == 1}">
						<c:forEach items="${split_file}" var="boardlist">
						<img alt="" src="resources/mainImg/download_arrow_white.png" id="downBtn" onclick="downFile('${boardlist}', '${board_list.board_seq}');">
						<br/>
						</c:forEach>
						</c:if>
						<c:if test="${board_list.file_cnt >= 2}">
						<img alt="" src="resources/mainImg/download_arrow_white.png" id="hidden_over" name="hidden_over" onclick="over('${board_list.board_seq}');" >		
						</c:if>
				</td>
				<td>${board_list.file_hit}</td>
				<td>${board_list.board_hit}</td>
			</tr>
					<tr id = "hidden${board_list.board_seq}" style="display: none;">
						<td align="center" colspan="7">			
							<c:set var="split_file_ori" value="${fn:split(board_list.file_ori_name,'|')}" />
							<c:forEach var="boardlist" items="${split_file}" varStatus="status">
							<c:set var="fileLength" value="${split_file_ori[status.index]}" />
							${fileLength}																
							<img alt="" src="resources/mainImg/download_arrow_white.png" style="width: 15px; height: 15px;"  id="downBtn" onclick="downFile('${boardlist}');">
							<br/>
							</c:forEach>
						</td>
					</tr>
			</c:forEach>
		</table>
	</div>
	
	<%-- <div class="portCount">
		<ul>
		<li class="portCount1">
		<img alt="왼쪽" style="cursor:pointer;" src="resources/mainImg/download_board_arrow2.png" onclick="location.href='/downloadsList?board_division=download&startPage=1&visiblePages=10';">
		<c:if test="${startPage != '1' }">
		<img alt="왼쪽" style="cursor:pointer;" src="resources/mainImg/download_board_arrow1.png" onclick="location.href='/downloadsList?board_division=download&startPage=${startPage-1}&visiblePages=10';">
		</c:if>
		</li>
		<li id="pagination"></li>
		<li class="portCount2">
		<c:if test="${totalPage != '1' && totalPage != startPage}">
		<img alt="오른쪽" style="cursor:pointer;" src="resources/mainImg/download_board_arrow1.png" onclick="location.href='/downloadsList?board_division=download&startPage=${startPage+1}&visiblePages=10';">
		</c:if>
		<img alt="오른쪽" style="cursor:pointer;" src="resources/mainImg/download_board_arrow2.png" onclick="location.href='/downloadsList?board_division=download&startPage=${totalPage}&visiblePages=10';">
		</li>
		</ul>
		<div class="btnList">
		<div class="btnDiv1">
		<a class="btn1" href="/downloadsWrite?board_division=download">WRITE</a>
		</div>
		</div>
	</div> --%>
	<div class="portCount">
	<ul id="paging">
	</ul>
	<div class="btnList">
		<div class="btnDiv1">
		<a class="btn1" href="/downloadsWrite?board_division=download">WRITE</a>
		</div>
		</div>
	</div>
</div>
</body>
</html>