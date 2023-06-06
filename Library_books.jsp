<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconnection.jsp" %>
<jsp:include page="memberMenu.jsp" />
<html>
<head>
<!--추천 도서 목록을 출력해주는 코드입니다-->
<title>도서 목록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1 class="display-3">추천 도서 목록</h1>
    <%
   	 	 PreparedStatement pstmt1 = null;
	 	 ResultSet rs1 = null;
	 	 String sql1 = "select Bcode from RECBook";
    	 pstmt1 = conn.prepareStatement(sql1);
    	 rs1 = pstmt1.executeQuery();
    %>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>도서이름</th>
                <th>저자</th>
                <th>출판사</th>
                <th>도서위치</th>
                <th>청구기호</th>
            </tr>
        </thead>
        <tbody>
        <% 
        while(rs1.next()){
       	 	PreparedStatement pstmt = null;
   	     	ResultSet rs = null;
            String sql = "select * from Book Where Bcode = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, rs1.getString("Bcode"));
            rs = pstmt.executeQuery();
            
            while (rs.next()) { 
            %>
            <tr>
            <td><%=rs.getString("Bname")%></td>
            <td><%=rs.getString("Author")%></td>
            <td><%=rs.getString("Publisher")%></td>
            <td><%=rs.getString("Place")%></td>
            <td><%=rs.getString("Callsign")%></td>
        </tr>
        <% 	
        }
            rs.close();
            pstmt.close();
        }
        %>
        </tbody>
    </table>
</div>
<%
    if (rs1 != null)
        rs1.close();
    if (pstmt1 != null)
        pstmt1.close();
    if (conn != null)
        conn.close();
%>
</body>
</html>
