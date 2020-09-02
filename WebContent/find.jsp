<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="guestbook.service.InvalidPassowrdException"%>
<%@ page import="guestbook.service.findservice"%>
<%@ page import="guestbook.service.MessageListView"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String name = request.getParameter("name");

findservice find = findservice.getInstance();
MessageListView finddata = find.getMessageList(name);
%>
<c:set var="finddata" value="<%=finddata%>" />

<html>
<head>
<title>회원검색</title>

</head>
<body>
	<c:if test="${!viewData.isEmpty()}">
		<table border="1">
			<c:forEach var="message" items="${finddata.messageList}">
				<tr>
					<td>메시지 번호: ${message.id}<br /> 손님 이름: ${message.guestName} <br />
						메시지: ${message.message} <br />

					</td>
				</tr>
			</c:forEach>
		</table>


		<a href="list.jsp">[목록 보기]</a>
	</c:if>

</body>
</html>