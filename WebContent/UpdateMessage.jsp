<%@ page contentType="text/html; charset=utf-8"%>
<%@ page errorPage="errorView.jsp"%>
<%@ page import="guestbook.model.Message"%>
<%@ page import="guestbook.service.UpdateMessageService"%>
<%@ page import="guestbook.service.InvalidPassowrdException"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="message" class="guestbook.model.Message">
	<jsp:setProperty name="message" property="*" />
</jsp:useBean>
<%


int messageId = Integer.parseInt(request.getParameter("messageId"));
String password = request.getParameter("password");
String message2 = request.getParameter("message");
boolean invalidPassowrd = false;
try {
	UpdateMessageService updateService = UpdateMessageService.getInstance();
	updateService.updateMessage(messageId, message2, password);
} catch (InvalidPassowrdException ex) {
	invalidPassowrd = true;
}
%>
<html>
<head>
<title>방명록 메시지 수정</title>
</head>
<body>
	<%
		if (!invalidPassowrd) {
	%>
	메시지를 수정하였습니다.
	<%
		} else {
	%>
	입력한 암호가 올바르지 않습니다. 암호를 확인해주세요.
	<%
		}
	%>
	<a href="list.jsp">[목록 보기]</a>
</body>
</html>