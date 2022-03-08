<%@page import="library.DTO.FreeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String userid = (String) session.getAttribute("userid");

	FreeBoardDTO read = (FreeBoardDTO) request.getAttribute("read");
	String writer = read.getId();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wisdom Library</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="css/style.css" rel="stylesheet" />
</head>
<body id="backgd">
	<div>
		<jsp:include page="navigation.jsp"></jsp:include>

		<section>
			<div id="bestbooks">
				<div id="bestbook">
					<ul>
						<li>게시글 보기</li>
					</ul>
					<div class="book">

						<div class="hopeBox">
							<form action="freeBoardEdit.do?bnum=${read.bnum}" method="post" class="hopebookForm" id="myEditForm">

								<table>
									<tr>
										<td height="50px;">아이디</td>
										<td><input type="text" name="id" size="80" value="${read.id}" class="longText" readonly></td>
									</tr>
									<tr>
										<td height="50px;">제목</td>
										<td><input type="text" name="title" id="writeTitle" size="80;" value="${read.title}" class="longText"></td>
									</tr>
									<tr>
										<td height="50px;">내용</td>
										<td>
										<textarea rows="20" cols="82" name="content" id="writeContent">${read.content}</textarea>
										</td>
									</tr>
									<tr>
										<td height="50px;">첨부파일</td>
										<td><input type="file" name="file" size="80;"
											class="longText"></td>
									</tr>
									<tr>
										<td colspan="2" height="100px;">
										<input type="button" value="목록" class="basicBigBtn" onclick="location.href='freeBoard.do';">
									
									<%
										if (userid.equals(writer)) {
									%>
										<input type="button" value="수정" class="basicBigBtn" id="edit-btn">
										<input type="button" value="삭제" class="basicBigBtn" id="delete-btn">
									<%
										}
									%>
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	
	<script>
		$(function() {
			$('#edit-btn').click(function() {
				if (confirm('글을 수정할까요?')) {
					$('#myEditForm').submit();
				} else {
					return false;
				}
			})
			
			
			$('#delete-btn').click(function() {
				if (confirm('글을 삭제할까요?')) {
					location.href = 'freeboardDelete.do?bnum='+${read.bnum};
				} else {
					return false;
				}
			})
			
			
			
		})
	</script>
</body>
</html>