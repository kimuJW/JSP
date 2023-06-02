<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>  
<%@ page import="java.sql.*"%>
<%@ include file="dbconnection.jsp"%>
<!--메인 페이지에서 로그인을 진행할 때 유효성 검사를 하는 파일입니다-->
<%
	String error = "";

	request.setCharacterEncoding("UTF-8");
	
 	String id = request.getParameter("id");
 	String pass = request.getParameter("pass");
 	String identity="";
 	String password="";
 	String membername="";
 	PreparedStatement pstmt = null;
 	ResultSet rs = null;
	
	String sql = "select * from Member where ID=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,id);
    rs = pstmt.executeQuery();
	while (rs.next()) {
		identity=rs.getString("ID");	
		password=rs.getString("PW");	
		membername=rs.getString("Name");	
	}
	if (pass.isEmpty() || !pass.equals(password)) {
		error = "아이디와 비밀번호를 다시 확인해주세요.";
		response.sendRedirect("main.jsp");
		session.setAttribute("error", error);
	} else {
		response.sendRedirect("main.jsp");
		session.setAttribute("ID", identity);
		session.setAttribute("Name", membername);
		session.setMaxInactiveInterval(300);
	}
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();	
%>