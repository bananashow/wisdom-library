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
							<img src="image/books/1168620058.jpg" style="margin-right: 200px;">
						</div>
						
						<div class="read-more-text">
						<div class="empty"><br></div>
						<h1>매일매일 달걀요리</h1>
						<p>전문가가 알려주는 계란 맛있게 만드는 방법</p>
						<br />
						▶책소개 :<br />
						슈퍼 푸드 달걀로 다양하게 만드는 달걀요리 레시피!<br />
						누구나 좋아하는 달걀 프라이, 어떻게 드시나요? 타지 않게 매끈하고 선명한 색감이 돋보이는 반숙 프라이를 좋아하시나요? 아니면 흰자가 고소하게 살짝 탄 프라이를 좋아하시나요? 이 책은 늘 우리 곁에 있어서 의식하지 못했던 달걀의 모든 것을 파헤치고, 달걀로 할 수 있는 다양한 레시피를 알려줍니다. 기름에 튀기듯이 하는 프라이, 촉촉하고 찐득한 촉감의 반숙 프라이, 시간별로 세분화된 달걀 삶는 법, 다양한 달걀말이, 오믈렛의 여러 가지 버전을 만날 수 있습니다!
<br />
						<br />
						▶장르 : 요리<br />
						▶저자 : 달걀과학연구회<br />
						▶출판사 : 시그마북스<br />
						▶ISBN : 1168620058<br />
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