<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>
<html>
<head>
<link rel = "stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>도서 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4"><b>도서 목록</b></h1>
		</div>
	</div>
	<%
	BookRepository dao = BookRepository.getInstance();  
	ArrayList<Book> listOfBooks = dao.getAllBooks();
     %>
	<div class="container">
		<div class="column" align = "left">
			<%
				for (int i = 0; i < listOfBooks.size(); i++) {
					Book book = listOfBooks.get(i);
					%>
					<div class = "col-md-10">
						<h5><b>[<%=book.getCategory()%>] <%=book.getName()%></b></h5>
						<p>
						<p><%=book.getDescription()%>
						<p><%=book.getAuthor()%> | <%=book.getPublisher()%> | <%=book.getUnitPrice()%>원
						<p><a href="./book.jsp?id=<%=book.getBookId()%>"
             class="btn btn-secondary" role = "butoon"> 상세 정보 &raquo;></a>
						<hr>
					</div>
					<%
						}
					%>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>