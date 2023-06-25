<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconnection.jsp" %>
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
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from Score where S_id = ? and Name=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, S_id);
	pstmt.setString(2, Name);
	rs = pstmt.executeQuery();
	
	if (rs.next()) {
			sql = "UPDATE Score SET Korean=?, English=?, Math=?, Science=?, Sum=?, Average=? WHERE S_id=? and Name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Korean);
			pstmt.setInt(2, English);
			pstmt.setInt(3, Math);
			pstmt.setInt(4, Science);
			pstmt.setInt(5, Sum);
			pstmt.setDouble(6, Average);
			pstmt.setInt(7, S_id);
			pstmt.setString(8, Name);
			pstmt.executeUpdate();
		}
	
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("output.jsp");
%>