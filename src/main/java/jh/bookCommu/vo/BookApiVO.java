package jh.bookCommu.vo;

public class BookApiVO {
	
	private int idx;
	private String title;
	private String contents;
	private String isbn;
	private String datetime;
	private String authors;
	private String translators;
	private int price;
	private int sale_price;
	private String status;
	
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	public String getAuthors() {
		return authors;
	}
	public void setAuthors(String authors) {
		this.authors = authors;
	}
	public String getTranslators() {
		return translators;
	}
	public void setTranslators(String translators) {
		this.translators = translators;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSale_price() {
		return sale_price;
	}
	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "BookApiVO [idx=" + idx + ", title=" + title + ", contents=" + contents + ", isbn=" + isbn
				+ ", datetime=" + datetime + ", authors=" + authors + ", translators=" + translators + ", price="
				+ price + ", sale_price=" + sale_price + ", status=" + status + "]";
	}
	
	
	
}
