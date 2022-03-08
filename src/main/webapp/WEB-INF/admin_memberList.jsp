<%@page import="library.DTO.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	ArrayList<MemberDTO> memberlist = (ArrayList<MemberDTO>) request.getAttribute("memberlist");
%>
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
						<li>회원 목록</li>
					</ul>
					<div class="book">


						<form action="admin_searchMember.do" name="myForm">
							<div class="searchBox">
								<select name="search">
									<option value="id">아이디</option>
									<option value="name">이름</option>
								</select>
								<input type="text" name="searchText" placeholder="검색어를 입력하세요" class="textBox">
								<input type="submit" value="찾기" class="basicBtn">
							</div>
						</form>
						
						<table border="1" style="margin-bottom: 30px;">
							<tr class="table-title">
								<th width="100px" height="40px;">회원번호</th>
								<th width="200px">아이디</th>
								<th width="150px">이름</th>
								<th width="400px">이메일</th>
								<th width="500px">특이사항</th>
							</tr>
							
							<%
								for (int i=0; i<memberlist.size(); i++) {
							%>
								<form action="admin_memberOtherSave.do" method="post">
									<tr>
										<td height="30px;"><%=memberlist.get(i).getMnum()%></td>
										<td><%=memberlist.get(i).getId()%></td>
										<td><%=memberlist.get(i).getName()%></td>
										<td><%=memberlist.get(i).getEmail()%></td>
										<td>
											<input type="hidden" name="id" value="<%=memberlist.get(i).getId()%>">
											<input type="text" name="other" class="shortText" size="40" value="<%=memberlist.get(i).getOther()%>">
											<input type="submit" value="저장" class="basicSmallBtn">	
										</td>
									</tr>										
								</form>
							<%
								}
							%>
							</table>
							
						<%
							int totalPage = (int) request.getAttribute("totalPage");
							for(int i=1; i<=totalPage; i++) {
						%>
								<a href="admin_memberList.do?nowPage=<%=i%>"><%=i%></a>
						<%		
							}
						%>
					</div>
				</div>
			</div>
		</section>
	</div>	
</body>
</html>