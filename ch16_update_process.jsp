<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>  
<%@ page import="java.sql.*"%>
<%@ include file="dbconnection.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	
 	String ID = request.getParameter("ID");
 	String depart = request.getParameter("depart");
 	String Name = request.getParameter("Name");
 	String Address = request.getParameter("Address");
 	String Phone = request.getParameter("Phone"); 

 	PreparedStatement pstmt = null;
 	
	String sql = "Update Student SET depart=?, Name=?, Address=?, Phone=? where ID=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, depart);
	pstmt.setString(2, Name);
	pstmt.setString(3, Address);
	pstmt.setString(4, Phone);
	pstmt.setString(5, ID);
	
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
		
	response.sendRedirect("select.jsp");
%>