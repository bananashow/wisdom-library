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
						<li>로그인</li>
					</ul>
					<div class="book">
						<div class="hopeBox">
						
							<form action="login_process.do" method="post" class="loginForm">
								<table>
									<tr>
										<td height="50px;">ID</td>
										<td><input type="text" id="id" name="id" size="40" autofocus class="shortText"></td>
									</tr>
									<tr>
										<td height="50px;">Password</td>
										<td><input type="password" id="pw" name="pw" size="40" class="shortText"></td>
									</tr>
									<tr>
										<td height="100px;" colspan="2">
										<input type="button" id="login" value="로그인" class="basicBigBtn"> 
										<input type="button" value="회원가입" class="basicBigBtn" onclick="location.href='register.do';">
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
	
	
	<script>
		$(function() {
			$('#login').click(function() {
				if ($('#id').val() == "") {
					alert('아이디를 입력하세요');
					$('#id').focus();
					return false;
				}	
				if ($('#pw').val() == "") {
					alert('비밀번호를 입력하세요');
					$('#pw').focus();
					return false;
				}	

				$('.loginForm').submit();
				
			})
			
		})
	</script>
	
</body>
</html>