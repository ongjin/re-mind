package edu.kh.mind.board.model.vo;

public class MindPost {

	private int postNo;
	private String postContent;
	private String createDate;
	private String modifyDate;
	private int coordLeft;
	private int coordTop;
	
	private int memberNo;
	private int statusCode;
	private int itemImgNo;
	
	private String memberFname;
	private String itemRoute;
	
	public MindPost() {
	}
	
	
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}
	public int getCoordLeft() {
		return coordLeft;
	}
	public void setCoordLeft(int coordLeft) {
		this.coordLeft = coordLeft;
	}
	public int getCoordTop() {
		return coordTop;
	}
	public void setCoordTop(int coordTop) {
		this.coordTop = coordTop;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}
	public int getItemImgNo() {
		return itemImgNo;
	}
	public void setItemImgNo(int itemImgNo) {
		this.itemImgNo = itemImgNo;
	}


	public String getMemberFname() {
		return memberFname;
	}


	public void setMemberFname(String memberFname) {
		this.memberFname = memberFname;
	}


	public String getItemRoute() {
		return itemRoute;
	}


	public void setItemRoute(String itemRoute) {
		this.itemRoute = itemRoute;
	}
		
	
	
}
