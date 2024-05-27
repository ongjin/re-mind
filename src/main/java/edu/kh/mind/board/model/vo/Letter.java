package edu.kh.mind.board.model.vo;

public class Letter {

    private int letterNo;
    private String letterContent;
    private String letterDate;
    private int letterType;
    private int letterStatusCode;
    private int memberNo;
    private int professionNo;
    private String professionName;

    public Letter(){}

    public int getLetterNo() {
        return letterNo;
    }

    public void setLetterNo(int letterNo) {
        this.letterNo = letterNo;
    }

    public String getLetterContent() {
        return letterContent;
    }

    public void setLetterContent(String letterContent) {
        this.letterContent = letterContent;
    }

    public String getLetterDate() {
        return letterDate;
    }

    public void setLetterDate(String letterDate) {
        this.letterDate = letterDate;
    }

    public int getLetterType() {
        return letterType;
    }

    public void setLetterType(int letterType) {
        this.letterType = letterType;
    }

    public int getLetterStatusCode() {
        return letterStatusCode;
    }

    public void setLetterStatusCode(int letterStatusCode) {
        this.letterStatusCode = letterStatusCode;
    }

    public int getMemberNo() {
        return memberNo;
    }

    public void setMemberNo(int memberNo) {
        this.memberNo = memberNo;
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
}
