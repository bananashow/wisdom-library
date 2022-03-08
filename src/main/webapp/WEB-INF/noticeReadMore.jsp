<%@page import="library.DTO.FreeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
						<li>공지사항</li>
					</ul>
					<div class="book">

						<div class="hopeBox">
							<form action="freeBoardEdit.do?bnum=${noticeRead.nnum}" method="post" class="hopebookForm" id="myEditForm">

								<table>
									<tr>
										<td height="50px;">제목</td>
										<td><input type="text" name="title" id="writeTitle" size="80;" value="${noticeRead.title}" class="longText"></td>
									</tr>
									<tr>
										<td height="50px;">내용</td>
										<td>
										<textarea rows="20" cols="82" name="content" id="writeContent">${noticeRead.content}</textarea>
										</td>
									</tr>
									<tr>
										<td colspan="2" height="100px;">
										<input type="button" value="목록" class="basicBigBtn" onclick="location.href='notice.do';">
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
</body>
</html>