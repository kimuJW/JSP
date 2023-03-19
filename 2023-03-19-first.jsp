<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
	<%!
	String str = "Hello, Java Server Pages";

	public String getString() {		
		return str;
	}
	%>
	<%
		out.println(getString());		
	%>

</body>
</html>