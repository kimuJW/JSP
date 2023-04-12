<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String bookId = request.getParameter("bookId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String author = request.getParameter("author");
	String releaseDate = request.getParameter("releaseDate");
	String totalPages = request.getParameter("totalPages");
	String description = request.getParameter("description");
	String publisher = request.getParameter("publisher");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition");
	
	Integer price; 
	long pages;
	long stock;
	
	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);
		
	if (totalPages.isEmpty())
		pages=0;
	else
		pages = Long.valueOf(totalPages);
	
	if (unitsInStock.isEmpty())
		stock=0;
	else
		stock = Long.valueOf(unitsInStock);
		
	BookRepository dao = BookRepository.getInstance();
	
	Book newBook = new Book();
	newBook.setBookId(bookId);
	newBook.setName(name);
	newBook.setAuthor(author);
	newBook.setReleaseDate(releaseDate);
	newBook.setTotalPages(pages);
	newBook.setUnitPrice(price);
	newBook.setDescription(description);
	newBook.setPublisher(publisher);
	newBook.setCategory(category);
	newBook.setUnitsInStock(stock);
	newBook.setCondition(condition);

	dao.addBook(newBook);
	
	response.sendRedirect("books.jsp");
%>