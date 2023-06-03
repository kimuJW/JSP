<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>  
<%@ page import="java.sql.*"%>
<%@ include file="dbconnection.jsp"%>
<!--회원 등록을 할 때 필요한 유효성 검사와 등록 처리를 담당하는 파일입니다.-->
<%
	request.setCharacterEncoding("UTF-8");

 	String id = request.getParameter("id");
 	String pw = request.getParameter("pw");
 	String name = request.getParameter("name");
 	String sex = request.getParameter("sex");
 	String phone1 = request.getParameter("phone1");
 	String phone2 = request.getParameter("phone2"); 
 	String phone3 = request.getParameter("phone3");
 	String phone = phone1+"-"+phone2+"-"+phone3;
 	String jumin1 = request.getParameter("jumin1");
 	String jumin2 = request.getParameter("jumin2"); 
 	String jumin = jumin1+"-"+jumin2;
	String success = "";
 	
 	PreparedStatement pstmt = null;
 	ResultSet rs = null;
 	
	try {
		String idCheckQuery = "SELECT ID FROM Member WHERE id = ?";
		pstmt = conn.prepareStatement(idCheckQuery);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			rs.close();
			pstmt.close();
			conn.close();
			out.println("<script>alert('이미 사용 중인 아이디입니다. 다른 아이디를 선택해주세요.'); window.location.href='signup.jsp';</script>");
			return;
		}
		
		String phoneCheckQuery = "SELECT Phone FROM Member WHERE phone = ?";
		pstmt = conn.prepareStatement(phoneCheckQuery);
		pstmt.setString(1, phone);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			rs.close();
			pstmt.close();
			conn.close();
			out.println("<script>alert('이미 등록된 휴대전화 번호입니다. 다른 번호를 입력해주세요.'); window.location.href='signup.jsp';</script>");
			return;
		}
		
		String juminCheckQuery = "SELECT RRN FROM Member WHERE RRN = ?";
		pstmt = conn.prepareStatement(juminCheckQuery);
		pstmt.setString(1, jumin);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			rs.close();
			pstmt.close();
			conn.close();
			out.println("<script>alert('이미 등록된 주민등록번호입니다. 다른 번호를 입력해주세요.'); window.location.href='signup.jsp';</script>");
			return;
		}
		
		String insertQuery = "INSERT INTO Member VALUES (?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(insertQuery);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setString(4, sex);
		pstmt.setString(5, phone);
		pstmt.setString(6, jumin);

		pstmt.executeUpdate();

		success = "회원가입이 완료되었습니다.";
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	session.setAttribute("success", success);
	response.sendRedirect("main.jsp");
%>
