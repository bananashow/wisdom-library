<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wisdom Library</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="css/admin_style.css" rel="stylesheet" />
</head>
<body id="backgd">
	<div>
		<jsp:include page="admin_navigation.jsp"></jsp:include>

		<section>
			<div id="bestbooks">
				<div id="bestbook">
					<ul>
						<li>��� ���� ��û ���</li>
					</ul>
					<div class="book">

						<table border="1" class="longTable" style="margin-bottom: 30px;">
							<tr class="table-title">
								<th width="70px;">��ȣ</th>
								<th height="40px;" width="120px;">��û��</th>
								<th width="150px;">��û�� ���̵�</th>
								<th>ISBN10</th>
								<th width="300px;">������</th>
								<th>����</th>
								<th width="220px;">��ũ</th>
								<th>���ſϷ�</th>
							</tr>

							<c:forEach var="hopeList" items="${hopeList}">
								<tr>
									<td height="30px;">${hopeList.hnum}</td>
									<td>${hopeList.requestdate}</td>
									<td>${hopeList.id}</td>
									<td>${hopeList.isbn}</td>
									<td>${hopeList.booktitle}</td>
									<td>${hopeList.author}</td>
									<td><a href="${hopeList.link}">${hopeList.link}</a></td>
									<td><input type="button" value="����" id="hopedelete" class="basicSmallBtn" onclick="location.href='admin_memberHopeBookDelete.do?hnum=${hopeList.hnum}';"></td>
								</tr>
							</c:forEach>
						</table>
						
						<%
							int totalPage = (int) request.getAttribute("totalPage");
							for(int i=1; i<=totalPage; i++) {
						%>
								<a href="admin_memberHopeBook.do?nowPage=<%=i%>"><%=i%></a>
						<%		
							}
						%>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>