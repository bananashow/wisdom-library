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
						<li>자유 게시판</li>
					</ul>
					<div class="book">
					<form action="searchBoard.do" name="myForm">
						<div class="searchBox">
							<select name="search" style="margin-top: 50px;">
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
							</tr>

							<c:forEach var="bList" items="${bList}">
								<tr>
									<td height="30px;">${bList.bnum}</td>
									<td><a href="freeBoardReadMore.do?bnum=${bList.bnum}">${bList.title}</a></td>
									<td>${bList.id}</td>
									<td>${bList.writeday}</td>
									<td>${bList.hits}</td>
								</tr>
							</c:forEach>
						</table>
						
						<%
							int totalPage = (int) request.getAttribute("totalPage");
							for(int i=1; i<=totalPage; i++) {
						%>
								<a href="freeBoard.do?nowPage=<%=i%>"><%=i%></a>
						<%		
							}
						%>
						<br><input type="button" value="글쓰기" class="basicBigBtn" onclick="location.href='freeBoardWrite.do';" style="margin-top: 20px;">



					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>