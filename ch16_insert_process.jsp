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
 	
	String sql = "insert into Student values(?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, ID);
	pstmt.setString(2, depart);
	pstmt.setString(3, Name);
	pstmt.setString(4, Address);
	pstmt.setString(5, Phone);

	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
		
	out.println("Student 테이블 삽입이 성공했습니다.");
%>