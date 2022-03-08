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
						<li>회원 정보 수정</li>
					</ul>
					<div class="book">

						<div class="hopeBox">
							<form action="memberEdit_process.do" method="post" class="editForm">

								<table>
									<tr>
										<td height="50px;">아이디</td>
										<td><input type="text" id="id" name="id" size="42" class="shortText" autofocus value="${member.id}" readonly>
										</td>
									</tr>
									<tr>
										<td height="50px;">비밀번호</td>
										<td><input type="password" id="pw2" name="pw2" size=42" class="shortText"></td>
									</tr>
									<tr>
										<td height="50px;">수정할 비밀번호</td>
										<td><input type="password" id="pw" name="pw" size=42" class="shortText"></td>
									</tr>
									<tr>
										<td height="50px;">이름</td>
										<td><input type="text" id="name" name="name" size="42" class="shortText" value="${member.name}"></td>
									</tr>
									<tr>
										<td height="50px;">이메일</td>
										<td><input type="email" id="email" name="email" size="42" class="shortText" value="${member.email}"></td>
									</tr>
									<tr>
										<td colspan="2" height="100px;">
										<input type="button" id="profile-edit" value="수정" class="basicBigBtn" style="margin-right: 10px;">
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
		$('#profile-edit').click(function() {
			
			if ($('#pw').val() == "") {
				alert('비밀번호를 입력하세요.');
				$('#pw').focus();
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
			
			if ($('#pw2').val() !== "${member.pw}") {
				alert('비밀번호가 틀렸습니다.');
				$('#pw2').val('');
				$('#pw').val('');
				$('#pw2').focus();
				return false;
			}
			
			if (confirm('회원 정보를 수정할까요?')) {
				$('.editForm').submit();
			} else {
				return false;
			}
			
			
			
			
		})
	})
		
	</script>
	
	
	
	
	
</body>
</html>