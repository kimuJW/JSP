<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
<!--로그아웃 하면서 세션을 모두 제거합니다.-->
<%
	session.invalidate();
	response.sendRedirect("main.jsp");
	%>