<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wisdom Library</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="css/admin_style.css" rel="stylesheet" />
</head>
<body id="backgd">
	<div>
		<jsp:include page="admin_navigation.jsp"></jsp:include>

		<section>
			<div id="bestbooks">
				<div id="bestbook">
					<ul>
						<li>���� �߰�</li>
					</ul>
					<div class="book">

						<div class="hopeBox">
							<form action="admin_bookAdd_process.do" method="post" class="bookAddForm">

								<table>
									<tr>
										<td height="50px;">ISBN10</td>
										<td><input type="text" id="isbn" name="isbn" size="42" class="shortText">
										</td>
									</tr>
									<tr>
										<td height="50px;">������</td>
										<td><input type="text" id="booktitle" name="booktitle" size=42" class="shortText"></td>
									</tr>
									<tr>
										<td height="50px;">����</td>
										<td><input type="text" id="author" name="author" size="42" class="shortText"></td>
									</tr>
									<tr>
										<td height="50px;">�帣</td>
										<td><input type="text" id="genre" name="genre" size="42" class="shortText"></td>
									</tr>
									<tr>
										<td height="50px;">���ǻ�</td>
										<td><input type="text" id="company" name="company" size="42" class="shortText"></td>
									</tr>
									<tr>
										<td height="50px;">��� ����</td>
										<td><input type="text" id="stock" name="stock" size="42" class="shortText"></td>
									</tr>
									<tr>
										<td colspan="2" height="100px;">
										<input type="button" id="bookAdd" value="�߰�" class="basicBigBtn" style="margin-right: 10px;">
										<input type="button" id="regist" value="���" class="basicBigBtn" style="margin-right: 10px;" onclick="history.back();">
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
		$('#bookAdd').click(function() {
			
			if ($('#isbn').val() == "") {
				alert('isbn�� �Է��ϼ���.');
				$('#isbn').focus();
				return false;
			}	
			if ($('#booktitle').val() == "") {
				alert('�������� �Է��ϼ���.');
				$('#booktitle').focus();
				return false;
			}	
			if ($('#author').val() == "") {
				alert('���ڸ� �Է��ϼ���.');
				$('#author').focus();
				return false;
			}	
			if ($('#genre').val() == "") {
				alert('�帣�� �Է��ϼ���.');
				$('#genre').focus();
				return false;
			}	
			if ($('#company').val() == "") {
				alert('���ǻ縦 �Է��ϼ���.');
				$('#company').focus();
				return false;
			}	
			if ($('#stock').val() == "") {
				alert('��� ������ �Է��ϼ���.');
				$('#stock').focus();
				return false;
			}	
			
			
			$('.bookAddForm').submit();
			
			
			
		})
	})
		
	</script>
	
	
	
	
	
</body>
</html>