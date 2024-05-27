package edu.kh.mind.board.model.vo;

import java.util.Date;
import java.util.List;


public class Board {

	private int boardNo;
	private String boardTitle;
	private String boardContent;
		
	private String createDate;
	private String modifyDate;
	  
	private int replyCheckCode;
	private int scrapCheckCode;
	private int anonCheckCode;
	private int empathyCheckCode;
	 
	private int readCount;
	private int memberNo;
	private String memberFn;
	private String memberId;
	private int professionNo;
	private String professionName;
	private int statusCode;
	private int boardCategoryCode;
	private String boardCategoryName;
	private int worryCategoryCode;
	private String worryCategoryName;

	/* 마이 페이지 enroll_dt 용*/
	private Date myEnrollDate;

	//댓글 수 변수 
	private int replyCount;
	
	//프로필 이미지 path 
	private String memberImage;
	private String professionImage;
	
	//공감 수 변수 
	private int likeCount;
	private int cheerCount;
	private int sadCount;
	private int angryCount;
	private int surpriseCount;
	
	
	private List<Image> profileImgList;
	private List<Image> imgList;
	private List<Empathy> emList;

	private String worryEmpathyArray;
	private String worryCntArray;


	private String imageName;
	private String imagePath;
	private int postNo;

	private int maxValue;

	private String empathyStatusName;

	private int avgReviewStarpoint;
	private int countStar;
	private int reviewStarpoint;
	private String proIntro;
	private String counselPrice;
	private int priceMin;
	private int reviewCount;
	private int reviewAvg;

	public Board() {
		// TODO Auto-generated constructor stub
	}

	public int getPriceMin() {
		return priceMin;
	}

	public void setPriceMin(int priceMin) {
		this.priceMin = priceMin;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public int getReviewAvg() {
		return reviewAvg;
	}

	public void setReviewAvg(int reviewAvg) {
		this.reviewAvg = reviewAvg;
	}

	public int getAvgReviewStarpoint() {
		return avgReviewStarpoint;
	}

	public void setAvgReviewStarpoint(int avgReviewStarpoint) {
		this.avgReviewStarpoint = avgReviewStarpoint;
	}

	public int getCountStar() {
		return countStar;
	}

	public void setCountStar(int countStar) {
		this.countStar = countStar;
	}

	public int getReviewStarpoint() {
		return reviewStarpoint;
	}

	public void setReviewStarpoint(int reviewStarpoint) {
		this.reviewStarpoint = reviewStarpoint;
	}

	public String getProIntro() {
		return proIntro;
	}

	public void setProIntro(String proIntro) {
		this.proIntro = proIntro;
	}

	public String getCounselPrice() {
		return counselPrice;
	}

	public void setCounselPrice(String counselPrice) {
		this.counselPrice = counselPrice;
	}

	public Date getMyEnrollDate() {
		return myEnrollDate;
	}

	public void setMyEnrollDate(Date myEnrollDate) {
		this.myEnrollDate = myEnrollDate;
	}

	public String getEmpathyStatusName() {
		return empathyStatusName;
	}

	public void setEmpathyStatusName(String empathyStatusName) {
		this.empathyStatusName = empathyStatusName;
	}

	public void setMaxValue(int maxValue) {
		this.maxValue = maxValue;
	}

	public int getMaxValue() {
		return maxValue;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}


	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getImageName() {
		return imageName;
	}

	public String getImagePath() {
		return imagePath;
	}


	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
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

	public int getReplyCheckCode() {
		return replyCheckCode;
	}

	public void setReplyCheckCode(int replyCheckCode) {
		this.replyCheckCode = replyCheckCode;
	}

	public int getScrapCheckCode() {
		return scrapCheckCode;
	}

	public void setScrapCheckCode(int scrapCheckCode) {
		this.scrapCheckCode = scrapCheckCode;
	}

	public int getAnonCheckCode() {
		return anonCheckCode;
	}

	public void setAnonCheckCode(int anonCheckCode) {
		this.anonCheckCode = anonCheckCode;
	}

	public int getEmpathyCheckCode() {
		return empathyCheckCode;
	}

	public void setEmpathyCheckCode(int empathyCheckCode) {
		this.empathyCheckCode = empathyCheckCode;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberFn() {
		return memberFn;
	}

	public void setMemberFn(String memberFn) {
		this.memberFn = memberFn;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

	public int getBoardCategoryCode() {
		return boardCategoryCode;
	}

	public void setBoardCategoryCode(int boardCategoryCode) {
		this.boardCategoryCode = boardCategoryCode;
	}

	public String getBoardCategoryName() {
		return boardCategoryName;
	}

	public void setBoardCategoryName(String boardCategoryName) {
		this.boardCategoryName = boardCategoryName;
	}

	public int getWorryCategoryCode() {
		return worryCategoryCode;
	}

	public void setWorryCategoryCode(int worryCategoryCode) {
		this.worryCategoryCode = worryCategoryCode;
	}

	public String getWorryCategoryName() {
		return worryCategoryName;
	}

	public void setWorryCategoryName(String worryCategoryName) {
		this.worryCategoryName = worryCategoryName;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public String getMemberImage() {
		return memberImage;
	}

	public void setMemberImage(String memberImage) {
		this.memberImage = memberImage;
	}

	public String getProfessionImage() {
		return professionImage;
	}

	public void setProfessionImage(String professionImage) {
		this.professionImage = professionImage;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getCheerCount() {
		return cheerCount;
	}

	public void setCheerCount(int cheerCount) {
		this.cheerCount = cheerCount;
	}

	public int getSadCount() {
		return sadCount;
	}

	public void setSadCount(int sadCount) {
		this.sadCount = sadCount;
	}

	public int getAngryCount() {
		return angryCount;
	}

	public void setAngryCount(int angryCount) {
		this.angryCount = angryCount;
	}

	public int getSurpriseCount() {
		return surpriseCount;
	}

	public void setSurpriseCount(int surpriseCount) {
		this.surpriseCount = surpriseCount;
	}

	public List<Image> getImgList() {
		return imgList;
	}

	public void setImgList(List<Image> imgList) {
		this.imgList = imgList;
	}

	public List<Empathy> getEmList() {
		return emList;
	}

	public void setEmList(List<Empathy> emList) {
		this.emList = emList;
	}

	public String getWorryEmpathyArray() {
		return worryEmpathyArray;
	}

	public void setWorryEmpathyArray(String worryEmpathyArray) {
		this.worryEmpathyArray = worryEmpathyArray;
	}

	public String getWorryCntArray() {
		return worryCntArray;
	}

	public void setWorryCntArray(String worryCntArray) {
		this.worryCntArray = worryCntArray;
	}

	@Override
	public String toString() {
		return "Board{" +
				"boardNo=" + boardNo +
				", boardTitle='" + boardTitle + '\'' +
				", boardContent='" + boardContent + '\'' +
				", createDate='" + createDate + '\'' +
				", modifyDate='" + modifyDate + '\'' +
				", replyCheckCode=" + replyCheckCode +
				", scrapCheckCode=" + scrapCheckCode +
				", anonCheckCode=" + anonCheckCode +
				", empathyCheckCode=" + empathyCheckCode +
				", readCount=" + readCount +
				", memberNo=" + memberNo +
				", memberFn=" + memberFn +
				", professionNo=" + professionNo +
				", professionName=" + professionName +
				", statusCode=" + statusCode +
				", boardCategoryCode=" + boardCategoryCode +
				", boardCategoryName=" + boardCategoryName +
				", worryCategoryCode=" + worryCategoryCode +
				", worryCategoryName=" + worryCategoryName +
				", imgList=" + imgList +
				", emList=" + emList +
				", worryEmpathyArray='" + worryEmpathyArray + '\'' +
				", worryCntArray='" + worryCntArray + '\'' +
				'}';
	}

	public List<Image> getProfileImgList() {
		return profileImgList;
	}

	public void setProfileImgList(List<Image> profileImgList) {
		this.profileImgList = profileImgList;
	}
}
