<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
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
						<li>회원 가입</li>
					</ul>
					<div class="book">

						<div class="hopeBox">
							<form action="register_process.do" method="post" class="loginForm">

								<table style="width: 500px;">
									<tr>
										<td height="50px;">아이디</td>
										<td><input type="text" id="id" name="id" size="30" class="shortText" autofocus>
											<input type="button" value="중복확인" class="basicBtn">
										</td>
									</tr>
									<tr>
										<td height="50px;">비밀번호</td>
										<td><input type="password" id="pw" name="pw" size=42" class="shortText"></td>
									</tr>
									<tr>
										<td height="50px;">비밀번호 확인</td>
										<td><input type="password" id="pw2" name="pw2" size="42" class="shortText"></td>
									</tr>
									<tr>
										<td height="50px;">이름</td>
										<td><input type="text" id="name" name="name" size="42" class="shortText"></td>
									</tr>
									<tr>
										<td height="50px;">이메일</td>
										<td><input type="email" id="email" name="email" size="42" class="shortText"></td>
									</tr>
									<tr>
										<td colspan="2" height="100px;">
										<input type="button" id="regist" value="가입" class="basicBigBtn" style="margin-right: 10px;">
											<a href="login.do">로그인</a>
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
	
	<script type="text/javascript">
	
	$(function() {
		$('#regist').click(function() {
			
			if ($('#id').val() == "") {
				alert('아이디를 입력하세요.');
				$('#id').focus();
				return false;
			}	
			if ($('#pw').val() == "") {
				alert('비밀번호를 입력하세요.');
				$('#pw').focus();
				return false;
			}	
			if ($('#pw2').val() == "") {
				alert('비밀번호 확인을 입력하세요.');
				$('#pw2').focus();
				return false;
			}	
			if ($('#name').val() == "") {
				alert('이름을 입력하세요.');
				$('#name').focus();
				return false;
			}	
			if ($('#email').val() == "") {
				alert('이메일을 입력하세요.');
				$('#email').focus();
				return false;
			}	
			
			if ($('#pw').val() !== $('#pw2').val()) {
				alert('비밀번호가 다릅니다.');
				$('#pw').val('');
				$('#pw2').val('');
				$('#pw').focus();
				return false;
			}
			
			$('.loginForm').submit();
			
			
			
		})
	})
		
	</script>
	
	
	
	
	
</body>
</html>