<%@page import="library.DTO.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String inputId = (String) request.getAttribute("inputId");
		String inputPw = (String) request.getAttribute("inputPw");
		MemberDTO member = (MemberDTO) request.getAttribute("memberLogin");
		
		if (inputId.equals(member.getId()) && inputPw.equals(member.getPw())) {
			session.setAttribute("userid", inputId);
			if (inputId.equals("admin")) {
	%>
			<script>alert('관리자 계정으로 로그인 되었습니다.');
			location.href='admin_index.do';</script>
	<%
			} else {
	%>
			<script>alert('로그인 되었습니다.');
			location.href='index.do';</script>
	<%
				
			}
		} else {
	%>
			<script>alert('아이디와 비밀번호를 확인하세요');
			location.href='login.do';</script>
	<%
			
		}
	%>
</body>
</html>