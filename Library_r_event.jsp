<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>  
<%@ page import="java.sql.*"%>
<%@ page import ="function.Book"%>
<%@ page import="function.RandomCodeGenerator" %>
<%@ include file="dbconnection.jsp" %>
<!--도서 예약과 취소에 대한 기능을 담당하는 파일입니다.-->
<%
request.setCharacterEncoding("UTF-8");
String Bcode = request.getParameter("Bcode");
String Bname = request.getParameter("Bname");
String cancel = request.getParameter("cancel");
String ID = (String)session.getAttribute("ID");
String Name = (String)session.getAttribute("Name");
String Rcode = RandomCodeGenerator.generateRandomCode(12);
%>
<% 
String searchQuery = "select Rcode from Reservation where Rcode = ?";
PreparedStatement pstmt = null;
ResultSet rs = null;
pstmt = conn.prepareStatement(searchQuery);
pstmt.setString(1, Rcode);
rs = pstmt.executeQuery();
while (rs.next()){
	rs.close();
	Rcode = RandomCodeGenerator.generateRandomCode(12);
	pstmt.setString(1, Rcode);
	rs = pstmt.executeQuery();
	pstmt.close();
	if(!rs.next())
	{
	rs.close();
	pstmt.close();
	}
}
%>
<% 
if (cancel != null && cancel.equals("true")) {
    String deleteQuery = "DELETE FROM Reservation WHERE Bcode = ? AND ID = ?";
    pstmt = conn.prepareStatement(deleteQuery);
    pstmt.setString(1, Bcode);
    pstmt.setString(2, ID);
    pstmt.executeUpdate();
    pstmt.close();
} else {
	String insertQuery = "INSERT INTO Reservation (Rcode, Name, ID, Bcode, Bname) VALUES (?, ?, ?, ?, ?)";
    pstmt = conn.prepareStatement(insertQuery);
    pstmt.setString(1, Rcode);
    pstmt.setString(2, Name);
    pstmt.setString(3, ID);
    pstmt.setString(4, Bcode);
    pstmt.setString(5, Bname);
    pstmt.executeUpdate();
    pstmt.close();
}
String referer = request.getHeader("Referer");
response.sendRedirect(referer);
%>
