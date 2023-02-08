package kh.com.app.main.board;

public class BoardData {
	private String title;
	private String contents;
	private String writer;

	public BoardData() {
	}

	public BoardData(String title, String contents, String writer) {
		this.title = title;
		this.contents = contents;
		this.writer = writer;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	@Override
	public String toString() {
		return "BoardData [title=" + title + ", contents=" + contents + ", writer=" + writer + "]";
	}

}
