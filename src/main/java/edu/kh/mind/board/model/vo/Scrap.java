package edu.kh.mind.board.model.vo;

public class Scrap {
    private int scrapNo;
    private int memberNo;
    private int boardNo;
    private String boardTitle;
    private String boardContent;
    private String imagePath;
    private String imageName;
    private int boardStatusCode;
    private String boardCategoryName;
    private int readCount;
    private String enrollDate;
    private int maxValue;


    public Scrap(){}

    public String getBoardCategoryName() {
        return boardCategoryName;
    }

    public void setBoardCategoryName(String boardCategoryName) {
        this.boardCategoryName = boardCategoryName;
    }

    public void setMaxValue(int maxValue) {
        this.maxValue = maxValue;
    }

    public int getMaxValue() {
        return maxValue;
    }

    public void setEnrollDate(String enrollDate) {
        this.enrollDate = enrollDate;
    }

    public String getEnrollDate() {
        return enrollDate;
    }

    public void setReadCount(int readCount) {
        this.readCount = readCount;
    }

    public int getReadCount() {
        return readCount;
    }

    public void setScrapNo(int scrapNo) {
        this.scrapNo = scrapNo;
    }

    public void setBoardStatusCode(int boardStatusCode) {
        this.boardStatusCode = boardStatusCode;
    }

    public int getBoardStatusCode() {
        return boardStatusCode;
    }

    public void setMemberNo(int memberNo) {
        this.memberNo = memberNo;
    }

    public void setBoardNo(int boardNo) {
        this.boardNo = boardNo;
    }

    public void setBoardTitle(String boardTitle) {
        this.boardTitle = boardTitle;
    }

    public void setBoardContent(String boardContent) {
        this.boardContent = boardContent;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public int getScrapNo() {
        return scrapNo;
    }

    public int getMemberNo() {
        return memberNo;
    }

    public int getBoardNo() {
        return boardNo;
    }

    public String getBoardTitle() {
        return boardTitle;
    }

    public String getBoardContent() {
        return boardContent;
    }

    public String getImagePath() {
        return imagePath;
    }

    public String getImageName() {
        return imageName;
    }
}
