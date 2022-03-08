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
							<img src="image/books/8901248883.jpg" style="margin-right: 200px;">
						</div>
						
						<div class="read-more-text">
						<div class="empty"><br></div>
						<h1>우연히, 웨스 앤더슨</h1>
						<br />
						▶책소개 :<br />
						웨스 앤더슨 월드로 안내하는 초감각 렌즈이자 단 하나의 초대장<br />
						오감 충족 대리 만족 방구석 세계 여행 아카이빙 대작전!<br />
						“전 세계에서 가장 뜨거운 인스타그램 트렌드”로 주목받는 @AccidentallyWesAnderson 계정의 내용을 엮은 책이 출간되었다. 월리 코발 저자가 우연히도 웨스 앤더슨의 영화와 비슷해 보이는 장소의 사진을 보고 영감을 얻어 만든 채널로, 코로나 이슈로 여행이 힘들어진 사람들에게 대리 만족과 흥미로운 참여를 유도해 현재 140만 팔로어를 넘어 일주일에 만 명 이상씩 실시간으로 늘고 있다. 웨스 앤더슨 감독의 작품에는 한눈에 알아볼 수 있는 색감과 미학이 있다. 그의 감수성은 다양한 장르의 예술과 디자인, 인테리어 등에 영향을 끼쳤다. 특히 이 책은 웨스 앤더슨 터치를 전 세계에서 발견하도록 이끄는 유일한 프로젝트이자 여행 초대장이다. 영화에서 그대로 옮긴 듯한 장소를 2백 곳 이상 탐험하며 그에 얽힌 유래와 흥미로운 사연을 미니 백과사전처럼 펼쳐놓는다. 여행의 감각과 일상의 영감을 풍부하게 깨우는 이 책을 들고 지금 우리가 세계 일주를 떠날 수 있는 가장 현명하고 근사한 비행기에 탑승해보자.
						<br />
						<br />
						▶장르 : 사진집<br />
						▶저자 : 월리 코발<br />
						▶출판사 : 웅진지식하우스<br />
						▶ISBN : 8901248883<br />
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