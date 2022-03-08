<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wisdom Library</title>
<link href="css/style.css" rel="stylesheet" />
</head>
<body id="backgd">
	<div>
		<jsp:include page="navigation.jsp"></jsp:include>

		<section>
			<div id="bestbooks">
				<div id="bestbook" style="width: 80%;">
					<ul>
						<li>도서 검색</li>
					</ul>
					<div class="book">


						<table border="1" style="margin-bottom: 30px;">
							<tr class="table-title">
								<th width="150px" height="40px;">ISBN10</th>
								<th width="600px">도서명</th>
								<th width="300px">저자</th>
								<th width="200px">장르</th>
								<th width="300px">출판사</th>
								<th width="200px">해당 도서 페이지</th>
							</tr>

							<c:forEach var="list" items="${list}">
								<tr>
									<td height="30px;">${list.isbn}</td>
									<td>${list.booktitle}</td>
									<td>${list.author}</td>
									<td>${list.genre}</td>
									<td>${list.company}</td>
									<td><input type="button" value="자세히" class="basicSmallBtn" onclick="location.href='readMore.do?isbn=${list.isbn}';"></td>
								</tr>
							</c:forEach>
						</table>	
						<input type="button" value="뒤로" class="basicBigBtn" onclick="history.back();">
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>