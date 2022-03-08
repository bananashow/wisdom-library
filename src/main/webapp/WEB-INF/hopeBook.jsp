<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wisdom Library</title>
<link href="css/style.css" rel="stylesheet" />
</head>
<body id="backgd">
	<div>
		<jsp:include page="navigation.jsp"></jsp:include>

		<section>
			<div id="bestbooks">
				<div id="bestbook">
					<ul>
						<li>��� ���� ��û</li>
					</ul>
					<div class="book">

						<div class="hopeBox">
							<form action="hopeBook_process.do" method="get" class="hopebookForm">
								<input type="hidden" name="id" value="<%=session.getAttribute("userid")%>">
								<table>
									<tr>
										<td height="50px;">ISBN10</td>
										<td><input type="text" name="isbn" size="80"
											class="longText"></td>
									</tr>
									<tr>
										<td height="50px;">������</td>
										<td><input type="text" name="booktitle" size="80;"
											class="longText"></td>
									</tr>
									<tr>
										<td height="50px;">����</td>
										<td><input type="text" name="author" size="80;"
											class="longText"></td>
									</tr>
									<tr>
										<td height="50px;">��� ���� ��ũ</td>
										<td><input type="text" name="link" size="80;"
											class="longText"></td>
									</tr>
									<tr>
										<td colspan="2" height="100px;"><input type="submit"
											value="��û" class="basicBigBtn"></td>
									</tr>
								</table>
							</form>
						</div>

					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>