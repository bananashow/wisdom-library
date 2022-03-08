<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<div id="bestbook">
					<ul>
						<li>대여 도서</li>
					</ul>
					<br>
					<div class="book">
						<table border="1">
							<tr class="table-title">
								<th width="150px" height="40px;">ISBN10</th>
								<th width="400px">도서명</th>
								<th width="200px">대여일</th>
								<th width="200px">반납기한</th>
								<th width="200px">반납상태</th>
							</tr>

							<c:forEach var="rentList" items="${rentList}">
								<tr>
									<td height="30px;">${rentList.isbn}</td>
									<td>${rentList.booktitle}</td>
									<td>${rentList.rentaldate}</td>
									<td>${rentList.duedate}</td>
									<td id="returnState">${rentList.state}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>