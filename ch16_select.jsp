<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>Database SQL</title>
</head>
<body>
<%@ include file="dbconnection.jsp" %>
<%
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         String sql = "select * from Student";
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();
    
      %>
	     <table border="1">
	     <tr>
	     	<th>학번</th>
	     	<th>학과</th>
	     	<th>이름</th>
	     	<th>주소</th>
	     	<th>연락처</th>
	     <% 
	     while (rs.next()) {
	     %>
	     <tr>
             <td><%=rs.getString("ID")%></td>
             <td><%=rs.getString("depart")%></td>
             <td><%=rs.getString("Name")%></td>
             <td><%=rs.getString("Address")%></td>
             <td><%=rs.getString("Phone")%></td>
         </tr>
         <%
               }
         %>
         </table>
        
<%
   if (rs != null)
      rs.close();
   if (pstmt != null)
      pstmt.close();
   if (conn != null)
      conn.close();
%>
</body>
</html>