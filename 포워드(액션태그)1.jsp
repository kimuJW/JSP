<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
	<p>오늘의 날짜 및 시간
	<p><%=(new java.util.Date()).toLocaleString()%> <%--그 지역의 문자형식(한글)로 표현 --%>
</body>
</html>