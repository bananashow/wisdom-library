package library.DTO;

public class NoticeBoardDTO {
	private int nnum;
	private String title;
	private String content;
	private String writeday;

	public NoticeBoardDTO() {
		super();
	}

	public NoticeBoardDTO(int nnum, String title, String content, String writeday) {
		super();
		this.nnum = nnum;
		this.title = title;
		this.content = content;
		this.writeday = writeday;
	}

	public int getNnum() {
		return nnum;
	}

	public void setNnum(int nnum) {
		this.nnum = nnum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriteday() {
		return writeday;
	}

	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}

}
