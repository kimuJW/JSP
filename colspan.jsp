<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Table</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
<table style="border: 1px solid; width: 500px;"> 
	<caption>테이블 예시</caption> 
    <colgroup> 
    	<col style="width: 15%;"/> 
        <col style="width: 35%;"/> 
        <col style="width: 15%;"/> 
        <col style="width: 35%;"/> 
    </colgroup> 
    <tbody> 
    	<tr> 
        	<th>컬럼1</th> 
            <td>이것은 데이터1</td> 
            <th>컬럼2</th> 
            <td>이것은 데이터2</td> 
        </tr> 
        <tr> 
        	<th>컬럼3</th> 
            <td colspan="3">colspan 3</td> 
        </tr> 
        <tr> 
        	<th>컬럼4</th> 
            <td>이것은 데이터3</td> 
            <th>컬럼5</th> 
            <td>이것은 데이터4</td> 
        </tr> 
    </tbody> 
</table>
</body>
</html>