<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String userid = (String) session.getAttribute("userid");
	String isbn = request.getParameter("isbn");
	String bookStockNum = (String) request.getAttribute("bookStockNum");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=isbn%> 상세 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="css/style.css" rel="stylesheet" />
</head>
<body id="backgd">
	<div>
		<jsp:include page="../navigation.jsp"></jsp:include>

		<section>
			<div id="bestbooks">
				<div id="bestbook" style="width: 100%">
					<ul>
						<li>책 소개</li>
					</ul>
					<div class="book">
					
					<div class="read-more">
						<div class="read-more-image">
							<img src="image/books/1161571183.jpg" style="margin-right: 200px;">
						</div>
						
						<div class="read-more-text">
						<div class="empty"><br></div>
						<h1>불편한 편의점</h1>
						<p>그와 함께 여행하면 온 세상이 영화가 된다.</p>
						<br />
						▶책소개 :<br />
						불편한데 자꾸 가고 싶은 편의점이 있다!<br />
						힘들게 살아낸 오늘을 위로하는 편의점의 밤<br />
						정체불명의 알바로부터 시작된 웃음과 감동의 나비효과<br />
						『망원동 브라더스』 김호연의 ‘동네 이야기’ 시즌 2<br />
						<br />
						▶장르 : 한국소설<br />
						▶저자 : 김호연<br />
						▶출판사 : 나무옆의자<br />
						▶ISBN : 1161571183<br />
						</div>
						
						<div class="rental">
						재고 수 : <%=bookStockNum%>권 <br>		
						<input type="button" value="대여하기" id="bookRental" class="basicBigBtn" style="margin: 10px 10px 0 0;">
						<input type="button" value="목록으로" class="basicBigBtn" onclick="history.back()">
						</div>
					</div>
					
					</div>
				</div>
			</div>
		</section>
	</div>
	
	<script>
	$(function() {
		$('#bookRental').click(function() {
			if (<%=bookStockNum%> == 0) {
				alert('재고가 없습니다.');
				return false;
			}
			
			if (confirm('책을 대여할까요?')) {
				location.href = 'bookRental.do?isbn=<%=isbn%>&id=<%=userid%>';
			} else {
				return false;
			}
		})
	})
	</script>
</body>
</html>