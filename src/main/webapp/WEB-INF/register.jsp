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
						<li>ȸ�� ����</li>
					</ul>
					<div class="book">

						<div class="hopeBox">
							<form action="register_process.do" method="post" class="loginForm">

								<table style="width: 500px;">
									<tr>
										<td height="50px;">���̵�</td>
										<td><input type="text" id="id" name="id" size="30" class="shortText" autofocus>
											<input type="button" value="�ߺ�Ȯ��" class="basicBtn">
										</td>
									</tr>
									<tr>
										<td height="50px;">��й�ȣ</td>
										<td><input type="password" id="pw" name="pw" size=42" class="shortText"></td>
									</tr>
									<tr>
										<td height="50px;">��й�ȣ Ȯ��</td>
										<td><input type="password" id="pw2" name="pw2" size="42" class="shortText"></td>
									</tr>
									<tr>
										<td height="50px;">�̸�</td>
										<td><input type="text" id="name" name="name" size="42" class="shortText"></td>
									</tr>
									<tr>
										<td height="50px;">�̸���</td>
										<td><input type="email" id="email" name="email" size="42" class="shortText"></td>
									</tr>
									<tr>
										<td colspan="2" height="100px;">
										<input type="button" id="regist" value="����" class="basicBigBtn" style="margin-right: 10px;">
											<a href="login.do">�α���</a>
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
				alert('���̵� �Է��ϼ���.');
				$('#id').focus();
				return false;
			}	
			if ($('#pw').val() == "") {
				alert('��й�ȣ�� �Է��ϼ���.');
				$('#pw').focus();
				return false;
			}	
			if ($('#pw2').val() == "") {
				alert('��й�ȣ Ȯ���� �Է��ϼ���.');
				$('#pw2').focus();
				return false;
			}	
			if ($('#name').val() == "") {
				alert('�̸��� �Է��ϼ���.');
				$('#name').focus();
				return false;
			}	
			if ($('#email').val() == "") {
				alert('�̸����� �Է��ϼ���.');
				$('#email').focus();
				return false;
			}	
			
			if ($('#pw').val() !== $('#pw2').val()) {
				alert('��й�ȣ�� �ٸ��ϴ�.');
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