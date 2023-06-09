<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>  
<%@ page import="java.sql.*"%>
<%@ include file="dbconnection.jsp"%>
<%@ page import ="function.Book"%>
<!--도서 검색을 처리하여 출력할 수 있도록 하는 파일입니다.-->
<%
	request.setCharacterEncoding("UTF-8");

	String error ="";
	String error0 = "";
	String field = request.getParameter("searchField");
	String text = request.getParameter("searchBook");

	PreparedStatement pstmt = null;
	ResultSet rs = null;

	if (text == null || text.trim().equals("")) {
		out.println("<script>alert('검색어를 입력해주세요!'); window.location.href='searchbook.jsp';</script>");
	    return;
	} else {
		String sql = "SELECT * FROM Book WHERE " + field + " LIKE ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,"%"+text.trim()+"%");
		rs = pstmt.executeQuery();

		List<Book> searchResults = new ArrayList<>(); 
		
		while (rs.next()) {
			Book book = new Book();
			book.setBcode(rs.getString("Bcode"));
			book.setBname(rs.getString("Bname"));
			book.setAuthor(rs.getString("Author"));
			book.setPublisher(rs.getString("Publisher"));
			book.setPlace(rs.getString("Place"));
			book.setCallsign(rs.getString("Callsign"));
			searchResults.add(book);
		}
		if (searchResults.isEmpty()) {
			out.println("<script>alert('검색 결과가 없습니다!'); window.location.href='searchbook.jsp';</script>");
			 return;
		}	
		else {
			session.setAttribute("searchResults", searchResults);
		}
	}


	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();	

	String referer = request.getHeader("Referer");
	response.sendRedirect(referer);
%>