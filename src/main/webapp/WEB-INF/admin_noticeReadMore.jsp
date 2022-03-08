<%@page import="library.DTO.FreeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
						<li>공지사항 보기</li>
					</ul>
					<div class="book">

						<div class="hopeBox">
							<form action="admin_noticeEdit.do?nnum=${noticeRead.nnum}" method="post" class="hopebookForm" id="NoticeEditForm">

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
										<td height="50px;">첨부파일</td>
										<td><input type="file" name="file" size="80;"
											class="longText"></td>
									</tr>
									<tr>
										<td colspan="2" height="100px;">
										<input type="button" value="목록" class="basicBigBtn" onclick="location.href='admin_notice.do';">
										<input type="button" id="noticeEd" value="수정" class="basicBigBtn">
										<input type="button" value="삭제" class="basicBigBtn" id="noticeDel">
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
			$('#noticeEd').click(function() {
				if(confirm('공지사항을 수정할까요?')) {
					$('#NoticeEditForm').submit();
				}else {
					return false;
				}
			}) 
			
			
			$('#noticeDel').click(function() {
				if(confirm('공지사항을 삭제할까요?')) {
					location.href = 'admin_noticeDelete.do?nnum='+${noticeRead.nnum};
				}else {
					return false;
				}
			})
			
		})
	</script>
</body>
</html>