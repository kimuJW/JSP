<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Implicit Objects</title>
</head>
<body>
	<% 
	request.setCharacterEncoding("UTF-8");
	String[] fruits = request.getParameterValues("fruits");
	%>
	<h3>선택한 과일</h3>
	<p>
	<% 
	for (int i=0; i<fruits.length; i++){
	out.print(fruits[i]+" ");
	}
	%>
</body>
</html>