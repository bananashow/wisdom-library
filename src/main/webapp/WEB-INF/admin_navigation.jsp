<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nav</title>
</head>
<body>
	<header>
		<div id="header-top">
			<div id="title">
				<a href="admin_index.do">WISDOM LIBRARY (Admin)</a>
			</div>
			<div id="loginBox">

				<%
					String userid = (String) session.getAttribute("userid");
					if (userid == null) {
				%>
					<a href="register.do">Register</a> <a href="login.do">Login</a>
				<%
					} else {
				%>
					<a href="logout.do">Logout</a>
					<div id="welcomeId">관리자님, 반갑습니다.</div>
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
					<li><a href="#">도서</a>
						<ul id="sub-navbar">
							<li><a href="admin_bookList.do" class="not-registered?nowPage=1">도서 등록 / 관리</a></li>
							<li><a href="admin_rentalBook.do?nowPage=1" class="not-registered?nowPage=1">대여 도서 관리</a></li>
						</ul></li>
					<li><a href="#">알림</a>
						<ul id="sub-navbar">
							<li><a href="admin_notice.do?nowPage=1" class="not-registered">공지사항 관리</a></li>
							<li><a href="admin_freeBoard.do?nowPage=1" class="not-registered">자유게시판 관리</a></li>
						</ul></li>
					<li><a href="#">회원</a>
						<ul id="sub-navbar">
							<li><a href="admin_memberList.do" class="not-registered">회원 목록</a></li>
							<li><a href="admin_memberHopeBook.do?nowPage=1" class="not-registered">회원 희망 도서</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<script>
		$(function() {
			$('.not-registered').click(function() {
				if (<%=userid%> == null) {
					alert('로그인이 필요합니다.');
					location.href = 'login.do';
					return false;
				}
			})
		})
	</script>
</body>
</html>