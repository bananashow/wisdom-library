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
							<img src="image/books/1165341905.jpg" style="margin-right: 200px;">
						</div>
						
						<div class="read-more-text">
						<div class="empty"><br></div>
						<h1>달러구트 꿈 백화점</h1>
						<p>주문하신 꿈은 매진입니다</p>
						<br />
						▶책소개 :<br />
						잠들어야만 입장할 수 있는 독특한 마을. <br />
						그곳에 들어온 잠든 손님들에게 가장 인기 있는 곳은, 온갖 꿈을 한데 모아 판매하는 ‘달러구트의 꿈 백화점’이다. 
						긴 잠을 자는 사람들은 물론이고, 짧은 낮잠을 자는 사람들과 동물들로 매일매일 대성황을 이룬다. <br />
						범상치 않은 혈통의 주인장 ‘달러구트’, 그리고 그의 최측근에서 일하게 된 신참 직원 ‘페니’, 꿈을 만드는 제작자 ‘아가넵 코코’,
						그리고 베일에 둘러싸인 비고 마이어스…등이 등장한다. 『달러구트 꿈 백화점』은 ‘무의식에서만 존재하는 꿈을 정말 사고 팔 수 
						있을까?’라는 기발한 질문에 답을 찾아가며, 꿈을 만드는 사람, 파는 사람, 사는 사람의 비밀스런 에피소드를 담고 있는 판타지 
						소설이다. 텀블벅 펀딩 1812% 달성, 전자책 출간 즉시 베스트셀러 1위를 3주간 기록하며 수많은 독자들의 요청으로 종이책으로 
						출간하게 되었다.<br />
						<br />
						▶장르 : 한국소설<br />
						▶저자 : 이미예<br />
						▶출판사 : 팩토리나인<br />
						▶ISBN : 1165341905<br />
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