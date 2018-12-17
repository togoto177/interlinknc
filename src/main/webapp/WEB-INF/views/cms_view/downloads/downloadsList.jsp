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
</head>
<body>
<%@ include file="../cms_header.jsp"%>
<%@ include file="../cms_left_bar.jsp"%>
<div class="portfolioBody">
	<div class="portTitle">
		<img alt="이미지" src="resources/mainImg/diagonal_download.png">
		<a>DOWNLOADS</a>
	</div>
	<div class="portSerch">
		<input type="text" /><img alt="돋보기" src="resources/cms/search.png">
	</div>
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
			<tr class="portTd">
				<td>9</td>
				<td class="title"><a href="/downloadsUpdate">스마트카드v.1.0.1</a></td>
				<td>2019.04.21</td>
				<td><img alt="" src="resources/mainImg/download_arrow_white.png"></td>
				<td>999</td>
				<td>999</td>
			</tr>
			<tr class="portTd">
				<td>8</td>
				<td class="title"><a href="/downloadsUpdate">스마트카드v.1.0.1</a></td>
				<td>2019.04.21</td>
				<td><img alt="" src="resources/mainImg/download_arrow_white.png"></td>
				<td>999</td>
				<td>999</td>
			</tr>
			<tr class="portTd">
				<td>7</td>
				<td class="title"><a href="/downloadsUpdate">스마트카드v.1.0.1</a></td>
				<td>2019.04.21</td>
				<td><img alt="" src="resources/mainImg/download_arrow_white.png"></td>
				<td>999</td>
				<td>999</td>
			</tr>
			<tr class="portTd">
				<td>6</td>
				<td class="title"><a href="/downloadsUpdate">스마트카드v.1.0.1</a></td>
				<td>2019.04.21</td>
				<td><img alt="" src="resources/mainImg/download_arrow_white.png"></td>
				<td>999</td>
				<td>999</td>
			</tr>
			<tr class="portTd">
				<td>5</td>
				<td class="title"><a href="/downloadsUpdate">스마트카드v.1.0.1</a></td>
				<td>2019.04.21</td>
				<td><img alt="" src="resources/mainImg/download_arrow_white.png"></td>
				<td>999</td>
				<td>999</td>
			</tr>
			<tr class="portTd">
				<td>4</td>
				<td class="title"><a href="/downloadsUpdate">스마트카드v.1.0.1</a></td>
				<td>2019.04.21</td>
				<td><img alt="" src="resources/mainImg/download_arrow_white.png"></td>
				<td>999</td>
				<td>999</td>
			</tr>
			<tr class="portTd">
				<td>3</td>
				<td class="title"><a href="/downloadsUpdate">스마트카드v.1.0.1</a></td>
				<td>2019.04.21</td>
				<td><img alt="" src="resources/mainImg/download_arrow_white.png"></td>
				<td>999</td>
				<td>999</td>
			</tr>
			<tr class="portTd">
				<td>2</td>
				<td class="title"><a href="/downloadsUpdate">스마트카드v.1.0.1</a></td>
				<td>2019.04.21</td>
				<td><img alt="" src="resources/mainImg/download_arrow_white.png"></td>
				<td>999</td>
				<td>999</td>
			</tr>
			<tr class="portTd">
				<td>1</td>
				<td class="title"><a href="/downloadsUpdate">스마트카드v.1.0.1</a></td>
				<td>2019.04.21</td>
				<td><img alt="" src="resources/mainImg/download_arrow_white.png"></td>
				<td>999</td>
				<td>999</td>
			</tr>
		</table>
	</div>
	
	<div class="portCount">
		<ul>
		<li class="portCount1"><img alt="왼쪽" src="resources/mainImg/download_board_arrow2.png"><img alt="왼쪽" src="resources/mainImg/download_board_arrow1.png"></li>
		<li class="focus">1</li>
		<li>2</li>
		<li>3</li>
		<li>4</li>
		<li>5</li>
		<li class="portCount2"><img alt="왼쪽" src="resources/mainImg/download_board_arrow1.png"><img alt="왼쪽" src="resources/mainImg/download_board_arrow2.png"></li>
		</ul>
		<div class="btnList">
		<div class="btnDiv1">
		<a class="btn1" href="/downloadsWrite">WRITE</a>
		</div>
		</div>
	</div>
</div>
</body>
</html>