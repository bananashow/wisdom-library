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
				<div id="bestbook">
					<ul>
						<li>공지사항</li>
					</ul>
					<br>
					<div class="book">
						<table border="1" style="margin-bottom: 30px;">
							<tr class="table-title">
								<th width="100px" height="40px;">No</th>
								<th width="700px">제목</th>
								<th width="300px">작성일</th>
							</tr>

							<c:forEach var="nList" items="${nList}">
								<tr>
									<td height="30px;">${nList.nnum}</td>
									<td><a href="noticeReadMore.do?nnum=${nList.nnum}">${nList.title}</a></td>
									<td>${nList.writeday}</td>
								</tr>
							</c:forEach>
						</table>
						<%
							int totalPage = (int) request.getAttribute("totalPage");
							for(int i=1; i<=totalPage; i++) {
						%>
								<a href="notice.do?nowPage=<%=i%>"><%=i%></a>
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