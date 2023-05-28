<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Database SQL</title>
</head>
<body>
<div class="container">
		<form action="update_process.jsp" method="post">
			      <div class="col-sm-3">
				   학번:<input type="text" id="ID" name="ID" class="form-control" ><p>
			      </div>
			      <div class="col-sm-3">
				   학과:<input type="text" id="depart" name="depart" class="form-control" ><p>
			      </div>
			       <div class="col-sm-3">
				   이름:<input type="text" id="Name" name="Name" class="form-control" ><p>
			      </div>
			      <div class="col-sm-3">
				   주소:<input type="text" id="Address" name="Address" class="form-control" ><p>
			      </div>
			      <div class="col-sm-3">
				   연락처:<input type="text" id="Phone" name="Phone" class="form-control" ><p>
			      </div>
				  <div class="col-sm-offset-2 col-sm-10">
					<input type="submit" value="전송">
			   	 </div>
	      </form>
</div>
			   	 
</body>
</html>