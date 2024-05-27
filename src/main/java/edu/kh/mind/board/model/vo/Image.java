package edu.kh.mind.board.model.vo;

import java.io.File;

public class Image {

	private int imageNo;
	private String imagePath;
	private String imageName;
	private String imageOriginal;
	private int imageLevel;
	private int memberNo;
	private int boardNo;
	private int professionNo;
	
	private String professionName;
	
	public Image() {
		// TODO Auto-generated constructor stub
	}

	public int getImageNo() {
		return imageNo;
	}

	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
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

	public void setImageName(String imagePathName) {
		this.imageName = imagePathName;
	}

	public String getImageOriginal() {
		return imageOriginal;
	}

	public void setImageOriginal(String imageOriginal) {
		this.imageOriginal = imageOriginal;
	}

	public int getImageLevel() {
		return imageLevel;
	}

	public void setImageLevel(int imageLevel) {
		this.imageLevel = imageLevel;
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

	public int getProfessionNo() {
		return professionNo;
	}

	public void setProfessionNo(int professionNo) {
		this.professionNo = professionNo;
	}
	
	
	public String getProfessionName() {
		return professionName;
	}

	public void setProfessionName(String professionName) {
		this.professionName = professionName;
	}

	@Override
	public String toString() {
		return "Image [imageNo=" + imageNo + ", imagePath=" + imagePath + ", imageName=" + imageName
				+ ", imageOriginal=" + imageOriginal + ", imageLevel=" + imageLevel + ", memberNo=" + memberNo
				+ ", boardNo=" + boardNo + ", professionNo=" + professionNo + ", professionName=" + professionName + "]";
	}
		
	
}
