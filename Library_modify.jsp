<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%> 
<%@ page import="java.sql.*"%>
<%@ include file="dbconnection.jsp" %>
<%@ include file= "memberMenu.jsp" %>
<html>
<!--회원 개인 페이지에서 회원 정보를 수정할 때 폼양식을 불러오는 파일입니다..-->
<head>
    <title>회원정보 수정</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            padding: 20px;
        }

        h1 {
            margin-bottom: 20px;
        }

        form {
            margin-bottom: 20px;
        }

        label {
            margin-right: 10px;
        }

        .form-control {
            width: 150px;
            display: inline-block;
            margin-bottom: 10px;
        }

        .phone-input {
            display: inline-block;
            width: 70px;
            margin-right: 5px;
        }

        button {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <%
        String ID = (String) session.getAttribute("ID");
        String Name = (String) session.getAttribute("Name");

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM Member WHERE ID = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, ID);
        rs = pstmt.executeQuery();

        String currentName = "";
        String currentPW = "";
        String currentPhone = "";

        if (rs.next()) {
            currentName = rs.getString("Name");
            currentPW = rs.getString("PW");
            currentPhone = rs.getString("Phone");
        }
        
        session.setAttribute("currentPhone", null);
        session.setAttribute("currentPhone", currentPhone);

        rs.close();
        pstmt.close();
    %>

    <div class="container">
        <h1 class="display-3"><%= Name %> 회원님의 정보 수정</h1>

        <form method="post" action="process_modify.jsp">
            <div class="form-group">
                <label for="name">이름:</label>
                <input type="text" id="name" name="name" value="<%= currentName %>" required class="form-control">
            </div>

            <div class="form-group">
                <label for="password">비밀번호:</label>
                <input type="password" id="password" name="password" value="<%= currentPW %>" required class="form-control">
            </div>

            <div class="form-group">
                <label for="phone">전화번호:</label>
                <input type="text" id="phone1" size="3" maxlength="3" name="phone1" value="<%= currentPhone.substring(0,3) %>" required class="form-control phone-input"> -
                <input type="text" id="phone2" size="4" maxlength="4" name="phone2" value="<%= currentPhone.substring(4,8) %>" required class="form-control phone-input"> -
                <input type="text" id="phone3" size="4" maxlength="4" name="phone3" value="<%= currentPhone.substring(9,13) %>" required class="form-control phone-input">
            </div>

            <input type="submit" value="수정" class="btn btn-primary">
        </form>

        <button onclick="location.href='mypage.jsp'" class="btn btn-secondary">뒤로 가기</button>
    </div>

    <% conn.close(); %>
</body>
</html>
