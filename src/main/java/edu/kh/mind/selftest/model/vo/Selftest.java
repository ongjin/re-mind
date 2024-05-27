package edu.kh.mind.selftest.model.vo;

import org.apache.ibatis.session.RowBounds;

public class Selftest{

    private int memberNo;

    private int answerNo;
    private int answerType;
    private String answerContent;

    private int questionNo;
    private String questionContent;

    private int categoryNo;
    private String categoryName;

    private int resultNo;
    private String resultContent;
    private int resultRate;
    private String resultGender;

    private int queCount;

    private int rate;

    private int score;

    public Selftest() {
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public int getMemberNo() {
        return memberNo;
    }

    public void setMemberNo(int memberNo) {
        this.memberNo = memberNo;
    }

    public int getAnswerNo() {
        return answerNo;
    }

    public void setAnswerNo(int answerNo) {
        this.answerNo = answerNo;
    }

    public int getAnswerType() {
        return answerType;
    }

    public void setAnswerType(int answerType) {
        this.answerType = answerType;
    }

    public String getAnswerContent() {
        return answerContent;
    }

    public void setAnswerContent(String answerContent) {
        this.answerContent = answerContent;
    }

    public int getQuestionNo() {
        return questionNo;
    }

    public void setQuestionNo(int questionNo) {
        this.questionNo = questionNo;
    }

    public String getQuestionContent() {
        return questionContent;
    }

    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent;
    }

    public int getCategoryNo() {
        return categoryNo;
    }

    public void setCategoryNo(int categoryNo) {
        this.categoryNo = categoryNo;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getResultNo() {
        return resultNo;
    }

    public void setResultNo(int resultNo) {
        this.resultNo = resultNo;
    }

    public String getResultContent() {
        return resultContent;
    }

    public void setResultContent(String resultContent) {
        this.resultContent = resultContent;
    }

    public int getResultRate() {
        return resultRate;
    }

    public void setResultRate(int resultRate) {
        this.resultRate = resultRate;
    }

    public String getResultGender() {
        return resultGender;
    }

    public void setResultGender(String resultGender) {
        this.resultGender = resultGender;
    }

    public int getQueCount() {
        return queCount;
    }

    public void setQueCount(int queCount) {
        this.queCount = queCount;
    }

    @Override
    public String toString() {
        return "Selftest{" +
                "memberNo=" + memberNo +
                ", answerNo=" + answerNo +
                ", answerType=" + answerType +
                ", answerContent='" + answerContent + '\'' +
                ", questionNo=" + questionNo +
                ", questionContent='" + questionContent + '\'' +
                ", categoryNo=" + categoryNo +
                ", categoryName='" + categoryName + '\'' +
                ", resultNo=" + resultNo +
                ", resultContent='" + resultContent + '\'' +
                ", resultRate=" + resultRate +
                ", resultGender='" + resultGender + '\'' +
                ", queCount=" + queCount +
                ", rate=" + rate +
                ", score=" + score +
                '}';
    }
}
