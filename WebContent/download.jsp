<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style></style>
<script type="text/javascript"></script>
</head>

<body>
	<%
		String saveDir = application.getRealPath("/ex0820/");
	File dir = new File(saveDir);

	String fName[] = dir.list();

	for (String fileName : fName) {
		out.write("<a href=\"" + request.getContextPath() + "/Download?filename="
		+ java.net.URLEncoder.encode(fileName, "UTF-8") + "\">" + fileName + "</a><br>");
	}
	%>

</body>
</html>