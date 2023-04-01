<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Objects</title>
</head>
<body>
	<p>클라이언트 IP: <%=request.getRemoteAddr()%> </p>
	<p>요청 정보 길이: <%=request.getContentLength()%> </p>
	<p>클라이언트 IP: <%=request.getCharacterEncoding()%> </p>
	<p>클라이언트 IP: <%=request.getContentType()%> </p>
	<p>클라이언트 IP: <%=request.getProtocol()%> </p>
	<p>클라이언트 IP: <%=request.getMethod()%> </p>
	<p>클라이언트 IP: <%=request.getRequestURI()%> </p>
	<p>클라이언트 IP: <%=request.getContextPath()%> </p>
	<p>클라이언트 IP: <%=request.getServerName()%> </p>
	<p>클라이언트 IP: <%=request.getServerPort()%> </p>
	<p>클라이언트 IP: <%=request.getQueryString()%> </p>
</body>
</html>