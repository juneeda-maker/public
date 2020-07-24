package comment;

public class Comment {
	
	private int COMMENT_NUM;
	private String COMMENT_ID;
	private String COMMENT_CONTENT;
	private String COMMENT_DATE;
	public int getCOMMENT_NUM() {
		return COMMENT_NUM;
	}
	public void setCOMMENT_NUM(int cOMMENT_NUM) {
		COMMENT_NUM = cOMMENT_NUM;
	}
	public String getCOMMENT_ID() {
		return COMMENT_ID;
	}
	public void setCOMMENT_ID(String cOMMENT_ID) {
		COMMENT_ID = cOMMENT_ID;
	}
	public String getCOMMENT_CONTENT() {
		return COMMENT_CONTENT;
	}
	public void setCOMMENT_CONTENT(String cOMMENT_CONTENT) {
		COMMENT_CONTENT = cOMMENT_CONTENT;
	}
	public String getCOMMENT_DATE() {
		return COMMENT_DATE;
	}
	public void setCOMMENT_DATE(String cOMMENT_DATE) {
		COMMENT_DATE = cOMMENT_DATE;
	}
	public int getCOMMENT_BOARD() {
		return COMMENT_BOARD;
	}
	public void setCOMMENT_BOARD(int cOMMENT_BOARD) {
		COMMENT_BOARD = cOMMENT_BOARD;
	}
	private int COMMENT_BOARD;
}
