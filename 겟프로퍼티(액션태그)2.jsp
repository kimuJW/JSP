<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
	<jsp:useBean id="person" class="ch04.com.dao.Person" scope="request" />
	<jsp:setProperty name="person" property="id" value="201801545" />
	<jsp:setProperty name="person" property="name" value="기무지넌" />
	<p> 아이디 : <jsp:getProperty property="id" name="person" />
	<p> 이 름 : <jsp:getProperty property="name" name="person"  />
</body>
</html>
