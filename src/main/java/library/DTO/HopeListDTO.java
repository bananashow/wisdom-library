package library.DTO;

public class HopeListDTO {

	private String hnum;
	private String id;
	private String requestdate;
	private String isbn;
	private String booktitle;
	private String author;
	private String link;

	public HopeListDTO() {
		super();
	}

	public HopeListDTO(String hnum, String id, String requestdate, String isbn, String booktitle, String author,
			String link) {
		super();
		this.hnum = hnum;
		this.id = id;
		this.requestdate = requestdate;
		this.isbn = isbn;
		this.booktitle = booktitle;
		this.author = author;
		this.link = link;
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

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRequestdate() {
		return requestdate;
	}

	public void setRequestdate(String requestdate) {
		this.requestdate = requestdate;
	}

	public String getHnum() {
		return hnum;
	}

	public void setHnum(String hnum) {
		this.hnum = hnum;
	}

}
