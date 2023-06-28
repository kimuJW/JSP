<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconnection.jsp" %>
<html>
<head>
<link rel="stylesheet"  href="./resources/css/bootstrap.min.css" />
<title>정보 수정</title>
<script>
    function validateForm() {
        var S_id = document.getElementById("S_id").value;
        var Name = document.getElementById("Name").value;
        var Korean = document.getElementById("Korean").value;
        var English = document.getElementById("English").value;
        var Math = document.getElementById("Math").value;
        var Science = document.getElementById("Science").value;
        
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

        var scoreRange = /^[0-9]{1,2}$|^100$/;
   		 if (!scoreRange.test(Korean) || !scoreRange.test(English) || !scoreRange.test(Math) || !scoreRange.test(Science)) {
        alert("국어, 영어, 수학, 과학 점수는 0부터 100까지의 숫자로 입력해야 합니다.");
        return false;
		}
        return true;
    }
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">정보 수정</h1>
		</div>
	</div>
	<%
		request.setCharacterEncoding("UTF-8");
		Integer S_id = Integer.valueOf(request.getParameter("S_id"));
		String Name = request.getParameter("Name");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from Score where S_id = ? and Name = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, S_id);
		pstmt.setString(2, Name);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-7">
				<form name="updateScore" action="./processUpdateScore.jsp" class="form-horizontal" method="post" onsubmit="return validateForm()">
				<div class="form-group row">
					<label class="col-sm-2">학번</label>
					<div class="col-sm-3">
						<%=rs.getString("S_id")%>
						<input type="hidden" name="S_id" value="<%=rs.getString("S_id")%>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">이름</label>
					<div class="col-sm-3">
						<%=rs.getString("Name")%>
						<input type="hidden" name="Name" value="<%=rs.getString("Name")%>">	
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">국어</label>
					<div class="col-sm-3">
						<input type="text" id="Korean" name="Korean" class="form-control" value="<%=rs.getString("Korean") %>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">영어</label>
					<div class="col-sm-3">
						<input type="text" id="English" name="English" class="form-control" value="<%=rs.getString("English") %>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">수학</label>
					<div class="col-sm-3">
						<input type="text" id="Math" name="Math" class="form-control" value="<%=rs.getString("Math") %>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">과학</label>
					<div class="col-sm-3">
						<input type="text" id="Science" name="Science" class="form-control" value="<%=rs.getString("Science") %>">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10 ">
						<input type="submit" class="btn btn-primary" value="수정">
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	<%
		}else {
			%>
			<script>
			    alert("일치하는 정보가 없습니다.");
			    history.back();
			</script>
			<%
			    }
		if  (rs != null)
			rs.close();	
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();	
	%>
</body>
</html>