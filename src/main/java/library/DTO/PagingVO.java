package library.DTO;

public class PagingVO {

	private int count; // 게시물 총 개수
	private int totalPage; // 전체 페이지 수
	private int nowPage = 1; // 현재 페이지
	private int limitStart = 0; // limit 시작

	public PagingVO() {
		super();
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getTotalPage() {
		totalPage = (int) Math.ceil((double) count / 10);
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getLimitStart() {
		limitStart = (nowPage - 1) * 10;
		return limitStart;
	}

	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}

}
