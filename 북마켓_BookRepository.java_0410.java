package dao;

import java.util.ArrayList;

import dto.Book;

public class BookRepository {

	private ArrayList<Book> listOfBooks = new ArrayList<Book>();
	private static BookRepository instance = new BookRepository();
	
	public static BookRepository getInstance() {
		return instance;
	}
	
	public BookRepository() {
		Book B1 = new Book("book1", "HTML5+CSS3", 15000);
		B1.setDescription("워드나 PPT 문서를 만들 수 있나요? 그러면 문제 없습니다. 지금 바로 웹페이지 제작에 도전해보세요. 지금 당장 컴퓨터가 없어도 괜찮습니다. 코드와 실행 화면이 바로 보여서 눈으...");
		B1.setAuthor("황재호");
		B1.setCategory("Hello coding");
		B1.setPublisher("한빛미디어");
		B1.setUnitsInStock(1000);
		B1.setTotalPages(200);
		B1.setReleaseDate("2013/01/01");
		
		Book B2 = new Book("book2", "쉽게 배우는 자바 프로그래밍", 27000);
	    B2.setDescription("객체 지향의 핵심과 자바의 현대적 기능을 충실히 다루면서도 초보자가 쉽게 학습할 수 있게 구성했습니다. 시각화 도구를 활용한 개념 설명과 군더더기 없는 핵심 코드를 통해 개념과 구현...");
		B2.setAuthor("우종중");
		B2.setCategory("IT 모바일");
		B2.setPublisher("한빛아카데미");	
		B2.setUnitsInStock(1500);
		B2.setTotalPages(300);
		B2.setReleaseDate("2014/01/01");
		
		Book B3 = new Book("book3", "스프링4 입문", 27000);
		B3.setDescription("스프링은 단순히 사용 방법만 익히는 것보다 아키텍처를 어떻게 이해하고 설계하는지가 더 중요합니다. 예제를 복사해 붙여넣는 식으로는 실제 개발에서 스프링을 제대로 활용할 수 없습니다...");
		B3.setAuthor("하세가와 유이치, 오오노 와타루, 토키 코헤이(권은철, 전민수)");
		B3.setCategory("IT 모바일");
		B3.setPublisher("한빛미디어");
		B3.setUnitsInStock(2000);
		B3.setTotalPages(400);
		B3.setReleaseDate("2015/01/01");
		
		listOfBooks.add(B1);
		listOfBooks.add(B2);
		listOfBooks.add(B3);		
	}	
	public ArrayList<Book> getAllBooks() {
		return listOfBooks;
	}
	public Book getBookById(String bookId) {
		Book bookById = null;
		
		for(int i = 0; i<listOfBooks.size(); i++) {
			Book book = listOfBooks.get(i);
			if (book != null && book.getBookId() != null && book.getBookId().equals(bookId)) { 
			        bookById = book;
			        break;
			   }
			}
		return bookById;
		}
	public void addBook(Book book) {
		listOfBooks.add(book);
		}
}
