<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import ="function.Book"%>
<%@ page import="java.util.*"%> 
<%@ include file="memberMenu.jsp" %>
<%@ include file="dbconnection.jsp" %>
<html>
<!--도서 검색 페이지를 보여주는 파일입니다.-->
<head>
    <title>도서 검색</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            padding: 20px;
        }

        .container {
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        button {
            padding: 5px 10px;
            font-size: 12px;
        }

        .pull-right {
            float: right;
        }
    </style>
</head>
<body>
<script>
    function doAction(Bcode, Bname, reservationStatus) {
        if (reservationStatus === "예약하기") {
            location.href = "r_event.jsp?Bcode=" + Bcode + "&Bname=" + encodeURIComponent(Bname);
            alert("예약이 완료되었습니다.");
        } else if (reservationStatus === "예약취소") {
            location.href = "r_event.jsp?Bcode=" + Bcode + "&Bname=" + encodeURIComponent(Bname) + "&cancel=true";
            alert("예약이 취소되었습니다.");
        } else {
            alert("다른 회원에 의해 이미 예약된 도서입니다.");
        }
    }
</script>
<%
String ID = (String) session.getAttribute("ID");
List<Book> searchResults = (List<Book>) session.getAttribute("searchResults");
session.removeAttribute("searchResults");
%>

<%! public boolean isBookReserved(String Bcode, Connection conn) throws SQLException {
        String checkQuery = "SELECT * FROM Reservation WHERE Bcode = ?";
        PreparedStatement pstmt = conn.prepareStatement(checkQuery);
        pstmt.setString(1, Bcode);
        ResultSet rs = pstmt.executeQuery();

        boolean isReserved = rs.next();

        rs.close();
        pstmt.close();

        return isReserved;
    }
%>
<%! 
public boolean isBookMyReserve(String Bcode, String ID, Connection conn) throws SQLException {
    String checkQuery = "SELECT ID FROM Reservation WHERE Bcode = ?";
    PreparedStatement pstmt = conn.prepareStatement(checkQuery);
    pstmt.setString(1, Bcode);
    ResultSet rs = pstmt.executeQuery();

    boolean isMy = false;

    if (rs.next()) {
        String myID = rs.getString("ID");

        if (ID.equals(myID)) {
            isMy = true;
        }
    }

    rs.close();
    pstmt.close();

    return isMy;
}
%>
<div class="container">
    <div class="row">
        <form method="post" name="search" action="processSearchbook.jsp">
            <div class="form-row align-items-center">
                <div class="col-auto">
                    <select class="form-control" id="searchField" name="searchField">
                        <option value="Bname">도서이름</option>
                        <option value="Author">저자</option>
                        <option value="Publisher">출판사</option>
                    </select>
                </div>
                <div class="col-auto">
                    <input type="text" class="form-control" placeholder="입력하기" name="searchBook" id="searchBook" maxlength="50">
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-success">검색</button>
                </div>
            </div>
        </form>
    </div>
</div>

<% if (searchResults != null && !searchResults.isEmpty()) { %>
<table class="table table-bordered">
    <thead class="thead-light">
        <tr>
            <th>도서코드</th>
            <th>도서이름</th>
            <th>저자</th>
            <th>출판사</th>
            <th>도서위치</th>
            <th>청구기호</th>
            <th>예약</th> 
        </tr>
    </thead>
    <tbody>
        <% for (int i = 0; i < searchResults.size(); i++) {
            Book book = searchResults.get(i); %>
        <tr>
            <td><%= book.getBcode() %></td>
            <td><%= book.getBname() %></td>
            <td><%= book.getAuthor() %></td>
            <td><%= book.getPublisher() %></td>
            <td><%= book.getPlace() %></td>
            <td><%= book.getCallsign() %></td>    
            <%   
            if (isBookReserved(book.getBcode(), conn) && !isBookMyReserve(book.getBcode(), ID, conn)) {
                String buttonText = "예약불가";
            %>
            <td><button class="btn btn-secondary" disabled><%= buttonText %></button></td>
            <% } else if (isBookMyReserve(book.getBcode(), ID, conn)) {
                String buttonText = "예약취소";
            %>
            <td><button class="btn btn-danger" onclick="doAction('<%= book.getBcode() %>', '<%= book.getBname() %>', '<%= buttonText %>')"><%= buttonText %></button></td>
            <% } else {
                String buttonText = "예약하기";
            %>
            <td><button class="btn btn-primary" onclick="doAction('<%= book.getBcode() %>', '<%= book.getBname() %>', '<%= buttonText %>')"><%= buttonText %></button></td>
            <% } %>
        </tr>
        <% } %>
    </tbody>
</table>
<% } %>
</body>
</html>
