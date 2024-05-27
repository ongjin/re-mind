package edu.kh.mind.board.model.vo;

public class Empathy {
	private int memberNo;
	private int boardNo;
	private String boardTitle;
	private String empEnrollDate;
	private String boardCategoryName;
	private String memberFn;
	private int readCount;
	private String imagePath;
	private String imageName;
	private int empathyStatusCode;
	private String empathyStatusName;

	private int maxValue;
	

	
	
	public Empathy() {
		// TODO Auto-generated constructor stub
	}

	public int getMaxValue() {
		return maxValue;
	}

	public void setMaxValue(int maxValue) {
		this.maxValue = maxValue;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getEmpEnrollDate() {
		return empEnrollDate;
	}

	public void setEmpEnrollDate(String empEnrollDate) {
		this.empEnrollDate = empEnrollDate;
	}

	public String getBoardCategoryName() {
		return boardCategoryName;
	}

	public void setBoardCategoryName(String boardCategoryName) {
		this.boardCategoryName = boardCategoryName;
	}

	public String getMemberFn() {
		return memberFn;
	}

	public void setMemberFn(String memberFn) {
		this.memberFn = memberFn;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getEmpathyStatusName() {
		return empathyStatusName;
	}

	public void setEmpathyStatusName(String empathyStatusName) {
		this.empathyStatusName = empathyStatusName;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getEmpathyStatusCode() {
		return empathyStatusCode;
	}

	public void setEmpathyStatusCode(int empathyStatusCode) {
		this.empathyStatusCode = empathyStatusCode;
	}
	
}
