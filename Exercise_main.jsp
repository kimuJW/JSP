<%@ page language="java" contentType="text/html; charset=utf-8"%>
<jsp:include page="menu.jsp" />
<html>
<head>
<title>정보 입력</title>
<link rel="stylesheet"  href="./resources/css/bootstrap.min.css" />
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
<div class="jumbotron">
				<div class="container">
					<h1 class= "display-3">학생 정보 등록</h1>
				</div>
			</div>
<div class="container">
		<form name="InputScore" action="./processMain.jsp" class="form-horizontal" method="post" onsubmit="return validateForm()">
			<div class="form-group row">
			   <label class="col-sm-2">학번</label>
			      <div class="col-sm-3">
				    <input type="text" id="S_id" name="S_id" class="form-control" >
			      </div>
			</div>
			<div class="form-group row">
				<label class = "col-sm-2">이름</label>
				    <div class="col-sm-3">
					    <input type="text" id="Name" name="Name" class="form-control">
					</div>
		    </div>
			<div class="form-group row">
				<label class="col-sm-2">국어</label>
				<div class="col-sm-3">
					<input type="text" id="Korean" name="Korean" class="form-control">
				</div>		
			</div>
			<div class="form-group row">
				<label class="col-sm-2">영어</label>
				<div class="col-sm-3">
					<input type="text" id="English" name="English" class="form-control">
				</div>		
			</div>
			<div class="form-group row">
				<label class="col-sm-2">수학</label>
				<div class="col-sm-3">
					<input type="text" id="Math" name="Math" class="form-control">
				</div>	
			</div>
			<div class="form-group row">
				<label class="col-sm-2">과학</label>
				<div class="col-sm-3">
					<input type="text" id="Science" name="Science" class="form-control">
				</div>	
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" class="btn btn-primary" value="등록">
			    </div>
		    </div>
	</form>
</div>

</body>
</html>