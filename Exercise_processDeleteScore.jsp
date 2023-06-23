<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconnection.jsp" %>
<html>
<head>
<title>정보 삭제</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
    PreparedStatement pstmt = null;
    ResultSet rs = null;
	
    Integer S_id = Integer.valueOf(request.getParameter("S_id"));
   	String Name = request.getParameter("Name");
    String sql = "select * from Score where S_id= ? and Name = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, S_id);
	pstmt.setString(2, Name);
	rs = pstmt.executeQuery();
	
	if (rs.next()) {
		sql ="delete from Score where S_id = ? and Name = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, S_id);
		pstmt.setString(2, Name);
		pstmt.executeUpdate();
%>
<% 
	}
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
		
	response.sendRedirect("output.jsp");
%>
</body>
</html>