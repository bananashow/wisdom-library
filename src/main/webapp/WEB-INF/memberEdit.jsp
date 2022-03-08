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
						<li>ȸ�� ���� ����</li>
					</ul>
					<div class="book">

						<div class="hopeBox">
							<form action="memberEdit_process.do" method="post" class="editForm">

								<table>
									<tr>
										<td height="50px;">���̵�</td>
										<td><input type="text" id="id" name="id" size="42" class="shortText" autofocus value="${member.id}" readonly>
										</td>
									</tr>
									<tr>
										<td height="50px;">��й�ȣ</td>
										<td><input type="password" id="pw2" name="pw2" size=42" class="shortText"></td>
									</tr>
									<tr>
										<td height="50px;">������ ��й�ȣ</td>
										<td><input type="password" id="pw" name="pw" size=42" class="shortText"></td>
									</tr>
									<tr>
										<td height="50px;">�̸�</td>
										<td><input type="text" id="name" name="name" size="42" class="shortText" value="${member.name}"></td>
									</tr>
									<tr>
										<td height="50px;">�̸���</td>
										<td><input type="email" id="email" name="email" size="42" class="shortText" value="${member.email}"></td>
									</tr>
									<tr>
										<td colspan="2" height="100px;">
										<input type="button" id="profile-edit" value="����" class="basicBigBtn" style="margin-right: 10px;">
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
				alert('��й�ȣ�� �Է��ϼ���.');
				$('#pw').focus();
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
			
			if ($('#pw2').val() !== "${member.pw}") {
				alert('��й�ȣ�� Ʋ�Ƚ��ϴ�.');
				$('#pw2').val('');
				$('#pw').val('');
				$('#pw2').focus();
				return false;
			}
			
			if (confirm('ȸ�� ������ �����ұ��?')) {
				$('.editForm').submit();
			} else {
				return false;
			}
			
			
			
			
		})
	})
		
	</script>
	
	
	
	
	
</body>
</html>