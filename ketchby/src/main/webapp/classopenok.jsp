<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" value="${msg }" id="msg">

	<script type="text/javascript">
		alert("${msg}");

		window.location.href = "mainpage.do";
	</script>
</body>
</html>
