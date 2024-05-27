package edu.kh.mind.member.model.vo;

import java.util.Date;

public class Member {
    private int memberNo;
    private String memberId;
    private String memberPw;
    private String memberName;
    private String memberAddress;
    private String memberFName;
    private String memberPhone;
    private String memberGender;
    private Date memberEnrollDate;
    private String memberDate;
    
    //프로필 사진 imagePath
    private String memberImage;
    private int statusCode;

    private String imagePath;
    private String imageName;
    public Member(){}

    public void setMemberDate(String memberDate) {
        this.memberDate = memberDate;
    }

    public String getMemberDate() {
        return memberDate;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public String getImagePath() {
        return imagePath;
    }

    public String getImageName() {
        return imageName;
    }

    public void setMemberNo(int memberNo) {
        this.memberNo = memberNo;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public void setMemberPw(String memberPw) {
        this.memberPw = memberPw;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public void setMemberAddress(String memberAddress) {
        this.memberAddress = memberAddress;
    }

    public void setMemberFName(String memberFName) {
        this.memberFName = memberFName;
    }

    public void setMemberPhone(String memberPhone) {
        this.memberPhone = memberPhone;
    }

    public void setMemberGender(String memberGender) {
        this.memberGender = memberGender;
    }

    public void setMemberEnrollDate(Date memberEnrollDate) {
        this.memberEnrollDate = memberEnrollDate;
    }

    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }

    public int getMemberNo() {
        return memberNo;
    }

    public String getMemberId() {
        return memberId;
    }

    public String getMemberPw() {
        return memberPw;
    }

    public String getMemberName() {
        return memberName;
    }

    public String getMemberAddress() {
        return memberAddress;
    }

    public String getMemberFName() {
        return memberFName;
    }

    public String getMemberPhone() {
        return memberPhone;
    }

    public String getMemberGender() {
        return memberGender;
    }

    public Date getMemberEnrollDate() {
        return memberEnrollDate;
    }

    public int getStatusCode() {
        return statusCode;
    }


	public String getMemberImage() {
		return memberImage;
	}


	public void setMemberImage(String memberImage) {
		this.memberImage = memberImage;
	}
}
