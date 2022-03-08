<%@page import="library.DTO.PagingVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>boardList process</title>
</head>
<body>
<%
	int bCount = (int) request.getAttribute("bCount");
	String nowPage = (String) request.getAttribute("nowPage");
	
	if (nowPage == null) {
		nowPage = "1";
	}
	
	int nPage = Integer.parseInt(nowPage);
	
	
	PagingVO paging = new PagingVO();
	paging.setCount(bCount);
	paging.setNowPage(nPage);
	
	int limitStart = paging.getLimitStart();
	int totalPage = paging.getTotalPage();
	
	response.sendRedirect("admin_notice_process.do?limitStart=" + limitStart + "&totalPage=" + totalPage);
%>

</body>
</html>