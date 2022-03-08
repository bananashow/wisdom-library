<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String userid = (String) session.getAttribute("userid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wisdom Library</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="css/style.css" rel="stylesheet" />
</head>
<body id="backgd">
	<div>

		<jsp:include page="navigation.jsp"></jsp:include>

		<section>
			<div id="bestbooks">
				<div id="bestbook">
					<ul>
						<li>이 달의 추천 도서</li>
					</ul>
					<div class="book">
						<div class="hopeBox">
						<%
							String[] isbnNum = {"1168620058", "8901248883", "1161571183"};
							String[] isbnBook = {"매일매일 달걀요리", "우연히, 웨스 앤더슨", "불편한 편의점"};

							for (int i = 0; i < isbnNum.length; i++) {
								String num = isbnNum[i];
						%>
							<div id="imgFloat">
								<img src="/image/books/<%=num%>.jpg" width="300px;">
								<p><%=isbnBook[i]%></p>
								<input type="button" value="자세히" id="readview<%=num%>"
									class="basicBigBtn" onclick="readViewGo(<%=num%>)">
							</div>
						<%
							}
						%>

						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<script>
		function readViewGo(num) {
			if (<%=userid%> == null) {
				alert('로그인이 필요합니다.');
				console.log("유저없음");
				location.href = 'login.do';
			} else {
				console.log("유저있음, num : " + num);
				location.href = 'readMore.do?isbn='+num;
			}
		}
	</script>
</body>
</html>