<%@page import="library.DTO.BookRentalListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wisdom Library</title>
<link href="css/admin_style.css" rel="stylesheet" />
</head>
<body id="backgd">
	<div>
		<jsp:include page="admin_navigation.jsp"></jsp:include>

		<section>
			<div id="bestbooks">
				<div id="bestbook">
					<ul>
						<li>대여한 회원 및 도서</li>
					</ul>
					
					<div class="book">

					
						<table border="1" style="margin-bottom: 30px;">
							<tr class="table-title">
								<th width="200px">아이디</th>
								<th width="200px">이름</th>
								<th width="200px">이메일</th>
								<th width="150px" height="40px;">ISBN10</th>
								<th width="400px">도서명</th>
								<th width="200px">대여일</th>
								<th width="200px">반납기한</th>
								<th width="200px">반납상태</th>
								<th width="200px">기타</th>
							</tr>
							
						<%
							ArrayList<BookRentalListDTO> rentList = (ArrayList<BookRentalListDTO>) request.getAttribute("rentList");
						
							for (int i=0; i<rentList.size(); i++) {
						%>
								<tr>
									<td height="30px;"><%=rentList.get(i).getId()%></td>
									<td><%=rentList.get(i).getName()%></td>
									<td><a href="mailto:"<%=rentList.get(i).getEmail()%>><%=rentList.get(i).getEmail()%></a></td>
									<td><%=rentList.get(i).getIsbn()%></td>
									<td><%=rentList.get(i).getBooktitle()%></td>
									<td><%=rentList.get(i).getRentaldate()%></td>
									<td><%=rentList.get(i).getDuedate()%></td>
									<td><%=rentList.get(i).getState()%></td>
									<td><input type="button" value="반납처리" class="basicSmallBtn" onclick='location.href="admin_return.do?rnum=<%=rentList.get(i).getRnum()%>";'></td>
								</tr>
						<%		
							}
						%>
						</table>

					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>