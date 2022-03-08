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
						<li>도서 추가</li>
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
										<td height="50px;">도서명</td>
										<td><input type="text" id="booktitle" name="booktitle" size=42" class="shortText"></td>
									</tr>
									<tr>
										<td height="50px;">저자</td>
										<td><input type="text" id="author" name="author" size="42" class="shortText"></td>
									</tr>
									<tr>
										<td height="50px;">장르</td>
										<td><input type="text" id="genre" name="genre" size="42" class="shortText"></td>
									</tr>
									<tr>
										<td height="50px;">출판사</td>
										<td><input type="text" id="company" name="company" size="42" class="shortText"></td>
									</tr>
									<tr>
										<td height="50px;">재고 수량</td>
										<td><input type="text" id="stock" name="stock" size="42" class="shortText"></td>
									</tr>
									<tr>
										<td colspan="2" height="100px;">
										<input type="button" id="bookAdd" value="추가" class="basicBigBtn" style="margin-right: 10px;">
										<input type="button" id="regist" value="취소" class="basicBigBtn" style="margin-right: 10px;" onclick="history.back();">
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
				alert('isbn을 입력하세요.');
				$('#isbn').focus();
				return false;
			}	
			if ($('#booktitle').val() == "") {
				alert('도서명을 입력하세요.');
				$('#booktitle').focus();
				return false;
			}	
			if ($('#author').val() == "") {
				alert('저자를 입력하세요.');
				$('#author').focus();
				return false;
			}	
			if ($('#genre').val() == "") {
				alert('장르를 입력하세요.');
				$('#genre').focus();
				return false;
			}	
			if ($('#company').val() == "") {
				alert('출판사를 입력하세요.');
				$('#company').focus();
				return false;
			}	
			if ($('#stock').val() == "") {
				alert('재고 수량을 입력하세요.');
				$('#stock').focus();
				return false;
			}	
			
			
			$('.bookAddForm').submit();
			
			
			
		})
	})
		
	</script>
	
	
	
	
	
</body>
</html>