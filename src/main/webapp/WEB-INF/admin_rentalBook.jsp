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
					
					<form action="admin_rentalBookSearch.do" name="myForm">
						<div class="searchBox">
							<select name="search" style="margin-top: 50px;">
								<option value="booktitle">도서명</option>
								<option value="id">아이디</option>
							</select>
							<input type="text" name="searchText" placeholder="검색어를 입력하세요" class="textBox">
							<input type="submit" value="찾기" class="basicBtn">
						</div>
					</form>
					
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
							ArrayList<BookRentalListDTO> rentListAll = (ArrayList<BookRentalListDTO>) request.getAttribute("rentListAll");
						
							for (int i=0; i<rentListAll.size(); i++) {
						%>
								<tr>
									<td height="30px;"><%=rentListAll.get(i).getId()%></td>
									<td><%=rentListAll.get(i).getName()%></td>
									<td><a href="mailto:"<%=rentListAll.get(i).getEmail()%>><%=rentListAll.get(i).getEmail()%></a></td>
									<td><%=rentListAll.get(i).getIsbn()%></td>
									<td><%=rentListAll.get(i).getBooktitle()%></td>
									<td><%=rentListAll.get(i).getRentaldate()%></td>
									<td><%=rentListAll.get(i).getDuedate()%></td>
									<td><%=rentListAll.get(i).getState()%></td>
									<td><input type="button" value="반납처리" class="basicSmallBtn" onclick='location.href="admin_return.do?rnum=<%=rentListAll.get(i).getRnum()%>&isbn=<%=rentListAll.get(i).getIsbn()%>";'></td>
								</tr>
						<%		
							}
						%>
						</table>
																		
						<%
							int totalPage = (int) request.getAttribute("totalPage");
							for(int i=1; i<=totalPage; i++) {
						%>
								<a href="admin_rentalBook.do?nowPage=<%=i%>"><%=i%></a>
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