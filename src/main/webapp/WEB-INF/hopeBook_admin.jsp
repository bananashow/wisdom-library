<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>��� ���� ��û ����Ʈ - ������ ������</title>
<link href="css/style.css" rel="stylesheet" />
</head>
<body id="backgd">
	<div>
		<jsp:include page="navigation.jsp"></jsp:include>

		<section>
			<div id="bestbooks">
				<div id="bestbook">
					<ul>
						<li>��� ���� ��û ����Ʈ</li>
					</ul>
					<div class="book">

						<table border="1">
							<tr class="table-title">
								<th width="150px" height="40px;">ISBN10</th>
								<th width="400px">������</th>
								<th width="200px">����</th>
								<th width="200px">��ũ</th>
							</tr>

							<c:forEach var="hList" items="${hList}">
								<tr>
									<td height="30px;">${hList.isbn}</td>
									<td>${hList.booktitle}</td>
									<td>${hList.author}</td>
									<td>${hList.link}</td>
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