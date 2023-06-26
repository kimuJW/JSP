<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconnection.jsp" %>
<jsp:include page="menu.jsp" />
<html>
<head>
<link rel="stylesheet"  href="./resources/css/bootstrap.min.css" />
<title>삭제할 정보 검색</title>
<script>
    function validateForm() {
        var S_id = document.getElementById("S_id").value;
        var Name = document.getElementById("Name").value;

        var idRange=/^\d{9}$/;
        if (!idRange.test(S_id)) {
        alert("학번은 9자리의 숫자로 입력해야 합니다.");
        return false;
    	}

        var nameRange = /^[가-힣]+$/;
        if (!nameRange.test(Name)) {
            alert("이름은 한글로 입력해야 합니다.");
            return false;
        }
        return true;
    }
</script>
</head>
<body>
	<% 
	String search = request.getParameter("search");
	String display = "";
	String action = "";
	if (search.equals("update")){ 
		display="수정할 정보 검색";
		action = "./updateScore.jsp";
		}
	else if (search.equals("delete")){
		display="삭제할 정보 검색";
		action = "./deleteScore.jsp";
		}
	%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><%=display%></h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-7">
				<form name="deleteSearch" action="<%=action%>" class="form-horizontal" method="post" onsubmit="return validateForm()">
				<div class="form-group row">
					<label class="col-sm-2">학번</label>
					<div class="col-sm-3">
						<input type="text" id="S_id" name="S_id" class="form-control">	
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">이름</label>
					<div class="col-sm-3">
						<input type="text" id="Name" name="Name" class="form-control">	
					</div>
				</div>				
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10 ">
						<input type="submit" class="btn btn-primary" value="검색">
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>