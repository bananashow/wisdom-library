package library.DTO;

public class FreeBoardDTO {
	private int bnum;
	private String id;
	private String title;
	private String content;
	private String writeday;
	private int hits;

	public FreeBoardDTO() {
		super();
	}

	public FreeBoardDTO(int bnum, String id, String title, String content, String writeday, int hits) {
		super();
		this.bnum = bnum;
		this.id = id;
		this.title = title;
		this.content = content;
		this.writeday = writeday;
		this.hits = hits;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

}
