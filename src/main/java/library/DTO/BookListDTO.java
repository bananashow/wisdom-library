package library.DTO;

public class BookListDTO {
	private String isbn;
	private String booktitle;
	private String author;
	private String genre; // 장르
	private String company; // 출판사
	private int stock; // 재고수

	public BookListDTO() {
		super();
	}

	public BookListDTO(String isbn, String booktitle, String author, String genre, String company, int stock) {
		super();
		this.isbn = isbn;
		this.booktitle = booktitle;
		this.author = author;
		this.genre = genre;
		this.company = company;
		this.stock = stock;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getBooktitle() {
		return booktitle;
	}

	public void setBooktitle(String booktitle) {
		this.booktitle = booktitle;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

}
