<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
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
						<li>자유게시판 관리</li>
					</ul>
					<div class="book">


					<form action="admin_searchBoard.do" name="myForm">
						<div class="searchBox">
							<select name="search">
								<option value="title">제목</option>
								<option value="id">작성자</option>
							</select>
							<input type="text" name="searchText" placeholder="검색어를 입력하세요" class="textBox">
							<input type="submit" value="찾기" class="basicBtn">
						</div>
					</form>


						<table border="1" style="margin-bottom: 30px;">
							<tr class="table-title">
								<th width="100px" height="40px;">No</th>
								<th width="450px">제목</th>
								<th width="200px">작성자</th>
								<th width="200px">작성일</th>
								<th width="180px">조회수</th>
								<th width="180px">기타</th>								
							</tr>

							<c:forEach var="bList" items="${bList}">
								<tr>
									<td height="30px;">${bList.bnum}</td>
									<td><a href="freeBoardReadMore.do?bnum=${bList.bnum}">${bList.title}</a></td>
									<td>${bList.id}</td>
									<td>${bList.writeday}</td>
									<td>${bList.hits}</td>
									<td><input type="button" value="삭제" class="basicSmallBtn" onclick="location.href='admin_deleteBoard.do?bnum=${bList.bnum}';"></td>
									
								</tr>
							</c:forEach>
						</table>
						
						<%
							int totalPage = (int) request.getAttribute("totalPage");
							for(int i=1; i<=totalPage; i++) {
						%>
								<a href="admin_freeBoard.do?nowPage=<%=i%>"><%=i%></a>
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