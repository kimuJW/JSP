<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconnection.jsp" %>
<html>
<head>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");

	Integer S_id = Integer.valueOf(request.getParameter("S_id"));
	String Name = request.getParameter("Name");
	Integer Korean = Integer.valueOf(request.getParameter("Korean"));
	Integer English = Integer.valueOf(request.getParameter("English"));
	Integer Math = Integer.valueOf(request.getParameter("Math"));
	Integer Science = Integer.valueOf(request.getParameter("Science"));
	Integer Sum = Korean + English + Math + Science;
	double Average = (double)Sum/4;

%>

<% 
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from Score where S_id =?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, S_id);
	rs = pstmt.executeQuery();
	if (rs.next()) {
		response.sendRedirect("errorpage.jsp");
	}
	else{	
	sql = "INSERT INTO Score values(?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, S_id);
	pstmt.setString(2, Name);
	pstmt.setInt(3, Korean);
	pstmt.setInt(4, English);
	pstmt.setInt(5, Math);
	pstmt.setInt(6, Science);
	pstmt.setInt(7, Sum);
	pstmt.setDouble(8, Average);
	pstmt.executeUpdate();
	
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
		
	response.sendRedirect("output.jsp");
	}
%>
</body>
</html>