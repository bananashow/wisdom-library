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
							<img src="image/books/1189327155.jpg" style="margin-right: 200px;">
						</div>
						
						<div class="read-more-text">
						<div class="empty"><br></div>
						<h1>물고기는 존재하지 않는다</h1>
						<p>상실, 사랑 그리고 숨어 있는 삶의 질서에 관한 이야기</p>
						<br />
						▶책소개 :<br />
						‘방송계의 퓰리처상’ 피버디상 수상자 룰루 밀러의<br />
						사랑과 혼돈, 과학적 집착에 관한 경이롭고도 충격적인 데뷔작!<br />
						
						‘방송계의 퓰리처상’으로 불리는 피버디상(Peabody Awards)을 수상한 과학 전문기자 룰루 밀러의 경이로운 논픽션 《물고기는 존재하지 않는다》는 여러 언론 매체에서 ‘2020년 최고의 책’으로 선정할 만큼 수많은 찬사를 받은 화제의 베스트셀러다.
						집착에 가까울 만큼 자연계에 질서를 부여하려 했던 19세기 어느 과학자의 삶을 흥미롭게 좇아가는 이 책은 어느 순간 독자들을 혼돈의 한복판으로 데려가서 우리가 믿고 있던 삶의 질서에 관해 한 가지 의문을 제기한다. “물고기가 존재하지 않는다는 것은 엄연한 하나의 사실이다. 그렇다면 우리는 또 무엇을 잘못 알고 있을까?” 하고 말이다. 누군가에게는 이 질문이 살아가는 데 아무런 영향을 미치지 않을 수도 있다. 하지만 세상을 바라보는 “진실한 관계들”에 한층 가까이 다가가기 위해 노력하는 사람들에게는 분명 이 책이 놀라운 영감과 어느 한쪽으로도 치우치지 않는 폭넓은 시야를 제공해줄 것이다.
						<br />
						<br />
						▶장르 : 자연과학<br />
						▶저자 : 룰루 밀러<br />
						▶출판사 : 곰출판<br />
						▶ISBN : 1189327155<br />
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