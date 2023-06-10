<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%> 
<%@ page import="java.sql.*"%>
<%@ page import ="function.Reservation"%>
<%@ include file="dbconnection.jsp" %>
<jsp:include page="memberMenu.jsp" />
<html>
<!--회원 개인 페이지입니다.-->
<head>
<title>마이 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
    body {
        padding: 20px;
    }

    h1 {
        margin-bottom: 20px;
    }

    table {
        margin-bottom: 20px;
    }

    th, td {
        padding: 10px;
        text-align: center;
    }

    button {
        margin: 0 5px;
    }
</style>
</head>
<body>
<script>
    function doAction(Bcode, Bname, reservationStatus) {  
        location.href = "r_event.jsp?Bcode=" + Bcode + "&Bname=" + encodeURIComponent(Bname) + "&cancel=true";
        alert("예약이 취소되었습니다.");
    }
</script>
<%
    String ID = (String)session.getAttribute("ID");
    String Name = (String)session.getAttribute("Name");
%>
<div class="container">
    <h1 class="display-3"><%=Name%>&nbsp;회원님의 페이지</h1>
    <%
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select Bname, Bcode from Reservation where ID = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, ID);
        rs = pstmt.executeQuery();
        List<Reservation> ReservationResults = new ArrayList<>(); 
     %>
    
    <% 
    while (rs.next()) {
        Reservation reservation = new Reservation();
        reservation.setBcode(rs.getString("Bcode"));
        reservation.setBname(rs.getString("Bname"));
        ReservationResults.add(reservation);
    }
    %>
    <%if (ReservationResults != null && !ReservationResults.isEmpty()) { %>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>도서코드</th>
                    <th>내가 예약한 도서</th>
                    <th>예약</th>
                </tr>
            </thead>
            <tbody>
            <% for (int i = 0; i < ReservationResults.size(); i++) {
                Reservation result = ReservationResults.get(i); 
            %>
                <tr>
                    <td><%= result.getBcode() %></td>
                    <td><%= result.getBname() %></td>
                    <%
                    String buttonText = "예약취소";
                    %>
                    <td><button class="btn btn-primary" onclick="doAction('<%= result.getBcode() %>', '<%= result.getBname() %>', '<%= buttonText %>')"><%= buttonText %></button></td>
                </tr>
            <% } %>
            </tbody>
        </table>  
    <% } %>
    <button id="modify" onclick="location.href='modify.jsp'" class="btn btn-secondary">회원정보수정</button>
</div>

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
