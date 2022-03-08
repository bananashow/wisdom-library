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
							<img src="image/books/1164051512.jpg" style="margin-right: 200px;">
						</div>
						
						<div class="read-more-text">
						<div class="empty"><br></div>
						<h1>생각은 어떻게 행동이 되는가</h1>
						<p>목표를 세우고 성취하는 인지조절의 뇌과학</p>
						<br />
						▶책소개 :<br />
						우리를 인간이게 만드는 능력이자 뇌과학계에서 가장 뜨거운 주제<br />
						인지조절의 모든 것을 다루는 최초의 교양서!<br />
						
						우리는 어떻게 본능적이고 습관적인 행동에서 벗어나, 의식적으로 행동할 수 있을까? 우리가 눈앞의 즐거움이나 행복을 포기하고, 장기적인 목표에 도움이 되는 행동을 선택할 수 있는 이유는 무엇일까? 즉, 생각은 어떻게 행동이 되는 것일까? 생각을 행동으로 만들어주는 과정인 ‘인지조절’은 뇌과학과 인지심리학에서 새롭게 떠오르고 있는 연구 주제이다.

						인지조절 과정이 없으면 우리는 메뉴판에서 메뉴를 고르거나 시간 약속을 지키는 것과 같은 일상생활의 가장 간단한 행동도 제대로 하지 못하게 된다. 하지만 인지조절 과정이 정확히 무엇이며, 어떻게 작동하는지에 관한 수수께끼는 이제 막 밝혀지기 시작했을 뿐이다. 이 책에서 선구적인 뇌과학자 데이비드 바드르는 최신 연구결과와 생생한 임상 사례, 일상생활로부터의 예시를 통해 인지조절의 정체와 진화 과정, 그리고 내부 작동기제를 파헤친다. 그 과정에서 독자들은 인지조절 기능이 멀티태스킹, 의지력, 습관적 실수, 기억력, 나쁜 의사 결정, 생애주기에 따른 뇌기능의 변화 등 우리 삶의 모든 면에 깊숙이 개입하고 있으며, 행복한 삶과 웰빙에 엄청난 영향을 끼친다는 것을 깨닫게 된다.
						<br />
						▶장르 : 자연과학<br />
						▶저자 : 데이비드 바드르<br />
						▶출판사 : 해나무<br />
						▶ISBN : 1164051512<br />
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