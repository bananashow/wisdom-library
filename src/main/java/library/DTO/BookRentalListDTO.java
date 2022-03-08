package library.DTO;

public class BookRentalListDTO {

	private int rnum;
	private String isbn;
	private String booktitle;
	private String id;
	private String name;
	private String email;
	private String rentaldate;
	private String duedate;
	private String state;

	public BookRentalListDTO() {
		super();
	}

	public BookRentalListDTO(int rnum, String isbn, String booktitle, String id, String name, String email,
			String rentaldate, String duedate, String state) {
		super();
		this.rnum = rnum;
		this.isbn = isbn;
		this.booktitle = booktitle;
		this.id = id;
		this.name = name;
		this.email = email;
		this.rentaldate = rentaldate;
		this.duedate = duedate;
		this.state = state;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRentaldate() {
		return rentaldate;
	}

	public void setRentaldate(String rentaldate) {
		this.rentaldate = rentaldate;
	}

	public String getDuedate() {
		return duedate;
	}

	public void setDuedate(String duedate) {
		this.duedate = duedate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}



}
