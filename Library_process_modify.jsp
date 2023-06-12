<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%> 
<%@ page import="java.sql.*"%>
<jsp:include page="memberMenu.jsp" />
<html>
<!--회원 정보 수정을 진행하기 위해 필요한 파일입니다.-->
<head>
    <title>회원정보 수정 처리</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String ID = (String) session.getAttribute("ID");    
    String newName = request.getParameter("name");
    String newPassword = request.getParameter("password");
    String phone1= request.getParameter("phone1");
    String phone2= request.getParameter("phone2");
    String phone3= request.getParameter("phone3");
    String newPhone = phone1 + "-" + phone2 + "-" + phone3;
    String currentPhone = (String) session.getAttribute("currentPhone");
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    ResultSet rs1 = null;
    
    if (newName == null || newName.trim().isEmpty()) {
        out.println("<script>alert('이름을 입력해주세요.'); window.location.href='modify.jsp';</script>");
        return;
    }
    if (newName.length() > 10 || !newName.matches("[가-힣]{1,10}")) {
        out.println("<script>alert('이름은 제대로 된 한글로 10자 이내로 입력해주세요.'); window.location.href='modify.jsp';</script>");
        return;
    }

    if (newPassword == null || newPassword.trim().isEmpty()) {
        out.println("<script>alert('비밀번호를 입력해주세요.'); window.location.href='modify.jsp';</script>");
        return;
    }
    if (newPassword.length() > 20 || !newPassword.matches("^(?=.*[a-zA-Z])(?=.*[!@#$%^&*])(?=.*[0-9]).{1,20}$")) {
        out.println("<script>alert('비밀번호는 영문 대소문자, 숫자, 특수문자를 포함하여 20자 이내로 입력해주세요.'); window.location.href='modify.jsp';</script>");
        return;
    }

    if (phone1 == null || phone1.trim().isEmpty() ||
        phone2 == null || phone2.trim().isEmpty() ||
        phone3 == null || phone3.trim().isEmpty()) {
        out.println("<script>alert('전화번호를 입력해주세요.'); window.location.href='modify.jsp';</script>");
        return;
    }
    if (!phone1.matches("\\d{3}") || !phone2.matches("\\d{4}") || !phone3.matches("\\d{4}")) {
        out.println("<script>alert('전화번호는 숫자로 3,4,4 자리로 입력해주세요.'); window.location.href='modify.jsp';</script>");
        return;
    }
    conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/librarydb?serverTimezone=Asia/Seoul&useSSL=false", "201801544user", "201801544pw");
    
    boolean isPhoneModified = !(phone1.equals(currentPhone.substring(0, 3)) && phone2.equals(currentPhone.substring(4, 8)) && phone3.equals(currentPhone.substring(9, 13)));
    
    if (isPhoneModified) {
        String phoneCheckQuery = "SELECT Phone FROM Member WHERE phone = ?";
        pstmt = conn.prepareStatement(phoneCheckQuery);
        pstmt.setString(1, newPhone);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            rs.close();
            pstmt.close();
            conn.close();
            out.println("<script>alert('이미 등록된 휴대전화 번호입니다. 다른 번호를 입력해주세요.'); window.location.href='modify.jsp';</script>");
            return;
        }
    }
    
    try {
        conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/librarydb?serverTimezone=Asia/Seoul&useSSL=false", "201801544user", "201801544pw");

        String backupQuery = "SELECT * FROM Reservation WHERE ID = ?";

        pstmt = conn.prepareStatement(backupQuery);
        pstmt.setString(1, ID);
        rs = pstmt.executeQuery();

        String deleteQuery = "DELETE FROM Reservation WHERE ID = ?";
        pstmt = conn.prepareStatement(deleteQuery);
        pstmt.setString(1, ID);
        pstmt.executeUpdate();

        String updateQuery = "UPDATE Member SET Name = ?, PW = ?, Phone = ? WHERE ID = ?";
        pstmt = conn.prepareStatement(updateQuery);
        pstmt.setString(1, newName);
        pstmt.setString(2, newPassword);
        pstmt.setString(3, newPhone);
        pstmt.setString(4, ID);
        pstmt.executeUpdate();

        String insertQuery = "INSERT INTO Reservation (Rcode, Name, ID, Bcode, Bname) VALUES (?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(insertQuery);

        while (rs.next()) {
            pstmt.setString(1, rs.getString("Rcode"));
            pstmt.setString(2, newName);
            pstmt.setString(3, ID);
            pstmt.setString(4, rs.getString("Bcode"));
            pstmt.setString(5, rs.getString("Bname"));

            pstmt.executeUpdate();
        }

        conn.commit();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    session.removeAttribute("Name");
    session.setAttribute("Name", newName);
%>

<div class="container">
    <h1 class="display-3">회원정보가 수정되었습니다.</h1>
    <button class="btn btn-primary" onclick="location.href='mypage.jsp'">마이 페이지로 돌아가기</button>
</div>
</body>
</html>
