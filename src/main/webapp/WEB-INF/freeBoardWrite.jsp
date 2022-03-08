<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
	
<%
	String userid = (String) session.getAttribute("userid");		
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
						<li>게시글 작성</li>
					</ul>
					<div class="book">

						<div class="hopeBox">
							<form action="write_process.do" method="get" class="hopebookForm" id="myWriteForm">

								<table>
									<tr>
										<td height="50px;">아이디</td>
										<td><input type="text" name="id" size="80" value="<%=userid%>" readonly
											class="longText"></td>
									</tr>
									<tr>
										<td height="50px;">제목</td>
										<td><input type="text" name="title" id="writeTitle" size="80;"
											class="longText"></td>
									</tr>
									<tr>
										<td height="50px;">내용</td>
										<td>
										<textarea rows="20" cols="82" name="content" id="writeContent"></textarea>
										</td>
									</tr>
									<tr>
										<td height="50px;">첨부파일</td>
										<td><input type="file" name="file" size="80;"
											class="longText"></td>
									</tr>
									<tr>
										<td colspan="2" height="100px;">
										<input type="button" id="submit-btn" value="작성" class="basicBigBtn" height="100px;">
										<input type="button" value="목록" class="basicBigBtn" onclick='history.back();'>
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
			$('#submit-btn').click(function() {
				
				if ($('#writeTitle').val() == "") {
					alert('제목을 입력하세요.');
					$('#writeTitle').focus();
					return false;
				}	
				
				if ($('#writeContent').val() == "") {
					alert('내용을 입력하세요.');
					$('#writeContent').focus();
					return false;
				}	
				
				if (confirm('글을 작성할까요?')) {
					$('#myWriteForm').submit();
				} else {
					return false;
				}
				
			})
		})
	</script>
</body>
</html>