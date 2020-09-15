<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Image insert into database</title>
</head>

<body>
	<form name="frm" action="saveImage.jsp" enctype="multipart/form-data"
		method="post">
		<input type="file" name="uProperty" /> <br> <input type="submit"
			name="goUpload" value="Upload" />
	</form>
</body>
</html>