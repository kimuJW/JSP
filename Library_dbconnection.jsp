<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<!--데이터베이스 연결을 위해 import하려고 만들어둔 파일입니다.-->
<%
	Connection conn = null;
	
	try{
		String url = "jdbc:mysql://127.0.0.1:3306/librarydb?serverTimezone=Asia/Seoul&useSSL=false";
		String user = "201801544user";
		String password = "201801544pw";
	
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);

	} catch (SQLException ex) {
		out.println("데이터베이스 연결이 실패했습니다.<br>");
		out.println("SQLException: " + ex.getMessage());
	}
%>