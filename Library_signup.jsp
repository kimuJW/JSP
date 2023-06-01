<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file="menu.jsp" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<html>
<!--회원 등록 페이지를 보여주는 파일입니다.-->
<head>
<title>회원등록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script>
function validateForm() {
    var id = document.getElementById("id").value;
    var pw = document.getElementById("pw").value;
    var name = document.getElementById("name").value;
    var phone1 = document.getElementById("phone1").value;
    var phone2 = document.getElementById("phone2").value;
    var phone3 = document.getElementById("phone3").value;
    var jumin1 = document.getElementById("jumin1").value;
    var jumin2 = document.getElementById("jumin2").value;

    if (!id || !pw || !name || !phone1 || !phone2 || !phone3 || !jumin1 || !jumin2) {
        alert("입력하지 않은 값이 존재합니다. 모든 항목을 입력해주세요.");
        return false;
    }

    var idRegex = /^[a-zA-Z]{1,20}$/;
    if (!id.match(idRegex)) {
        alert("아이디는 영문 대소문자로 20자 이내로 입력해야 합니다.");
        return false;
    }

    var pwRegex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*()_+\-=[\]{};':"\\|,.<>/?]).{1,20}$/;
    if (!pw.match(pwRegex)) {
        alert("비밀번호는 영문 대소문자와 특수문자를 포함하여 20자 이내로 입력해야 합니다.");
        return false;
    }

    var nameRegex = /^[가-힣]{1,10}$/;
    if (!name.match(nameRegex)) {
        alert("이름은 한글로 10자 이내로 입력해야 합니다.");
        return false;
    }

    var phoneRegex = /^\d{3}$/;
    if (!phone1.match(phoneRegex)) {
        alert("전화번호 첫번째 번호는 3자리 숫자로 입력해야 합니다.");
        return false;
    }

    phoneRegex = /^\d{4}$/;
    if (!phone2.match(phoneRegex)) {
        alert("전화번호 두번째 번호는 4자리 숫자로 입력해야 합니다.");
        return false;
    }

    phoneRegex = /^\d{4}$/;
    if (!phone3.match(phoneRegex)) {
        alert("전화번호 세번째 번호는 4자리 숫자로 입력해야 합니다.");
        return false;
    }

    var juminRegex = /^\d{6}$/;
    if (!jumin1 || !jumin2 || !jumin1.match(juminRegex) || !jumin2.match(/^\d{7}$/)) {
        alert("유효한 주민등록번호 형식으로 입력해야 합니다. (예: 000000-0000000)");
        return false;
    }
    return true;
}
</script>
</head>
<body>
<div class="container">
    <h2>회원등록</h2>
    <form action="processSignup.jsp" method="post" onsubmit="return validateForm()">
        <div class="form-group">
            <label for="id">아이디:</label>
            <input type="text" id="id" name="id" class="form-control">
        </div>
        <div class="form-group">
            <label for="pw">비밀번호:</label>
            <input type="password" id="pw" name="pw" class="form-control">
        </div>
        <div class="form-group">
            <label for="name">이름:</label>
            <input type="text" id="name" name="name" class="form-control">
        </div>
        <div class="form-group">
            <label>성별:</label>
            <div class="form-check">
                <input type="radio" id="male" name="sex" value="남" class="form-check-input" checked>
                <label for="male" class="form-check-label">남</label>
            </div>
            <div class="form-check">
                <input type="radio" id="female" name="sex" value="여" class="form-check-input">
                <label for="female" class="form-check-label">여</label>
            </div>
        </div>
        <div class="form-group">
            <label for="phone">휴대전화 번호:</label>
            <div class="row">
                <div class="col-4">
                    <input type="text" id="phone1" name="phone1" class="form-control" maxlength="3">
                </div>
                <div class="col-4">
                    <input type="text" id="phone2" name="phone2" class="form-control" maxlength="4">
                </div>
                <div class="col-4">
                    <input type="text" id="phone3" name="phone3" class="form-control" maxlength="4">
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="jumin">주민등록번호:</label>
            <div class="row">
                <div class="col-6">
                    <input type="text" id="jumin1" name="jumin1" class="form-control" maxlength="6">
                </div>
                <div class="col-6">
                    <input type="text" id="jumin2" name="jumin2" class="form-control" maxlength="7">
                </div>
            </div>
        </div>
        <input type="submit" value="가입하기" class="btn btn-primary">
    </form>
</div>
</body>
</html>
