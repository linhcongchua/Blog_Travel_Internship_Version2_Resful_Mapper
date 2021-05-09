package blog_travel.controller.model;

public class Pagging {
	private Integer pageCurrent;
	private Integer numberPostInPage;
	private Integer numberPage;
	
	public Integer getPageCurrent() {
		return pageCurrent;
	}
	public void setPageCurrent(Integer pageCurrent) {
		this.pageCurrent = pageCurrent;
	}
	public Integer getNumberPostInPage() {
		return numberPostInPage;
	}
	public void setNumberPostInPage(Integer numberPostInPage) {
		this.numberPostInPage = numberPostInPage;
	}

	public Integer getFrom() {
		return ((pageCurrent-1) * numberPostInPage) + 1;
	}
	public Integer getTo() {
		return pageCurrent*numberPostInPage;
	}
	
	public Integer getNumberPage() {
		return numberPage;
	}
	public void setNumberPage(Integer numberPage) {
		this.numberPage = numberPage;
	}
	@Override
	public String toString() {
		return "Pagging [pageCurrent=" + pageCurrent + ", numberPostInPage=" + numberPostInPage + ", numberPage="
				+ numberPage + "]";
	}
	
	
}
