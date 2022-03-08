package library.DTO;

public class MemberDTO {
	private int mnum;
	private String id;
	private String pw;
	private String name;
	private String email;
	private String other;

	public MemberDTO() {
		super();
	}

	public MemberDTO(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}

	public MemberDTO(int mnum, String id, String pw, String name, String email, String other) {
		super();
		this.mnum = mnum;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.other = other;
	}

	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
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

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

}
