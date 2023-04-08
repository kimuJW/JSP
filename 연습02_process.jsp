<%@ page import= "java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Form Processing</title>
</head>
<body>
<%
		Enumeration en = request.getParameterNames();
		while(en.hasMoreElements()) {
			String Name = (String) en.nextElement();
			String Value = request.getParameter(Name);
		%>
			<%out.println(Name+" "+":"+" "+Value);%><p>
		<%
		}
		%>
</body>
</html>