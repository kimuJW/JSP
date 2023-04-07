<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Form Processing</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String address = request.getParameter("address");
		String email = request.getParameter("email");			
	%>
	
	<p> 아 이 디 :<%out.println(id);%>
	<p> 주소 :<%out.println(address);%>
	<p> 이메일 :<%out.println(email);%>
</body>
</html>