<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconnection.jsp" %>
<jsp:include page="menu.jsp" />
<html>
<head>
<title>정보 출력</title>
<link rel="stylesheet"  href="./resources/css/bootstrap.min.css" />
</head>
<body>
<div class="container">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>학번</th>
                <th>이름</th>
                <th>국어</th>
                <th>영어</th>
                <th>수학</th>
                <th>과학</th>
                <th>합계</th>
                <th>평균</th>
            </tr>
        </thead>
        <tbody>
            <% 
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            String sql = "SELECT * from Score";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("S_id") %></td>
                <td><%= rs.getString("Name") %></td>
                <td><%= rs.getString("Korean") %></td>
                <td><%= rs.getString("English") %></td>
                <td><%= rs.getString("Math") %></td>
                <td><%= rs.getString("Science") %></td>
                <td><%= rs.getString("Sum") %></td>
                <td><%= rs.getString("Average") %></td>
            </tr>
            <% 
            }
            if (pstmt != null)
                pstmt.close();
            if (conn != null)
                conn.close();
            %>
        </tbody>
    </table>
</div>
</body>
</html>
