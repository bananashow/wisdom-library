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
						<li>���� �˻�</li>
					</ul>
					<div class="book">


					<form action="searchBook.do" name="myForm">
						<div class="searchBox">
							<select name="search" style="margin-top: 50px;">
								<option value="booktitle">������</option>
								<option value="author">����</option>
							</select>
							<input type="text" name="searchText" placeholder="�˻�� �Է��ϼ���" class="textBox">
							<input type="submit" value="ã��" class="basicBtn">
						</div>
					</form>


						<table border="1" style="margin-bottom: 30px;">
							<tr class="table-title">
								<th width="150px" height="40px;">ISBN10</th>
								<th width="600px">������</th>
								<th width="300px">����</th>
								<th width="200px">�帣</th>
								<th width="300px">���ǻ�</th>
								<th width="200px">�ش� ���� ������</th>
							</tr>

							<c:forEach var="list" items="${list}">
								<tr>
									<td height="30px;">${list.isbn}</td>
									<td>${list.booktitle}</td>
									<td>${list.author}</td>
									<td>${list.genre}</td>
									<td>${list.company}</td>
									<td><input type="button" value="�ڼ���" class="basicSmallBtn" onclick="location.href='readMore.do?isbn=${list.isbn}';"></td>
								</tr>
							</c:forEach>
						</table>	
												
						<%
							int totalPage = (int) request.getAttribute("totalPage");
							for(int i=1; i<=totalPage; i++) {
						%>
								<a href="bookSearch.do?nowPage=<%=i%>"><%=i%></a>
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