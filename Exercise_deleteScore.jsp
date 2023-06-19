<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconnection.jsp" %>
<html>
<head>
<link rel="stylesheet"  href="./resources/css/bootstrap.min.css" />
<title>정보 삭제</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">정보 삭제</h1>
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
				<form name="deleteScore" action="./processDeleteScore.jsp" class="form-horizontal" method="post">
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
						<%=rs.getString("Korean")%>점
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">영어</label>
					<div class="col-sm-3">
						<%=rs.getString("English")%>점
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">수학</label>
					<div class="col-sm-3">
						<%=rs.getString("Math")%>점
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">과학</label>
					<div class="col-sm-3">
						<%=rs.getString("Science")%>점
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">합계</label>
					<div class="col-sm-3">
						<%=rs.getString("Sum")%>점
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">평균</label>
					<div class="col-sm-3">
						<%=rs.getString("Average")%>점
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10 ">
						<input type="submit" class="btn btn-danger"  value="삭제">
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	<%
		} else {
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