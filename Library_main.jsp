<%@ page contentType="text/html; charset=utf-8"%>
<html>
<!--도서관의 초기화면입니다-->
<head>
<title>도서관 메인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<% if (session.getAttribute("success") != null) { %>
<script>
    alert("회원가입에 성공했습니다!");
</script>
<%
    session.removeAttribute("success");
}
%>
<% if (session.getAttribute("error") != null) { %>
<script>
    alert("아이디와 비밀번호를 다시 확인해주세요.");
</script>
<%
    session.removeAttribute("error");
}
%>
<%
    if (session.getAttribute("ID") == null) {
%>
<%@ include file="menu.jsp" %>
<%!
    String greet = "도서관에 오신 것을 환영합니다";
%>
<div class="container">
    <h1 class="display-3">
        <%= greet %>
    </h1>
    <form action="login_check.jsp" method="post">
        <div class="form-group">
            <label for="id">아이디:</label>
            <input type="text" id="id" name="id" class="form-control">
        </div>
        <div class="form-group">
            <label for="pass">비밀번호:</label>
            <input type="password" id="pass" name="pass" class="form-control">
        </div>
        <input type="submit" value="로그인" class="btn btn-primary">
    </form>
</div>
<%
    } else {
%>
<%@ include file="memberMenu.jsp" %>
<div class="container">
    <%
        String id = (String) session.getAttribute("ID");
        String name = (String) session.getAttribute("Name");
        out.println(name + " " + "회원님 반갑습니다.<br>");
    %>
</div>
<%
    }
%>
</body>
</html>
