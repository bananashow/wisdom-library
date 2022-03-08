<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>nav</title>
</head>
<body>
		<header>
			<div id="header-top">
				<div id="title"><a href="index.do">Wisdom Library</a></div>
				<div id="loginBox">

					<%
					String userid = (String) session.getAttribute("userid");
						if (userid == null) {
					%>
							<a href="register.do">Register</a>
							<a href="login.do">Login</a>
					<%
						} else {
					%>
							<a href="logout.do">Logout</a>
							<div id="welcomeId"><%=userid%>님, 반갑습니다.</div>
					<%
						}
					%>	

				</div>
			</div>
		</header>

		<nav>
			<div class="navbarBox" style="z-index: 2;">
				<div class="navbarInnerBox">
					<ul id="navbar">
						<li><a href="bookSearch.do?nowPage=1" class="not-registered">자료검색</a></li>
						<li><a href="#">신청/참여</a>
							<ul id="sub-navbar">
								<li><a href="hopeBook.do" class="not-registered">희망 도서 신청</a></li>
								<li><a href="freeBoard.do?nowPage=1" class="not-registered">자유게시판</a></li>
							</ul></li>
						<li><a href="notice.do?nowPage=1">공지사항</a></li>
						<li><a href="#">마이페이지</a>
							<ul id="sub-navbar">
								<li><a href="memberEdit.do?id=<%=userid%>" class="not-registered">회원정보수정</a></li>
								<li><a href="myRentalBook.do?id=<%=userid%>" class="not-registered">대여도서</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>
		
	<script>
		$(function () {
			$('.not-registered').click(function() {
				if (<%=userid%> == null) {
					alert('로그인이 필요합니다.');
					location.href='login.do';
					return false;
				} 
			})
		})
	</script>
</body>
</html>