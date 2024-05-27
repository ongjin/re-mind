package edu.kh.mind.member.social.naver.vo;

public class Naver {
    private int memberSocialNo;
    private String memberSocialToken;
    private int memberNo;
    private String socialType;

    public Naver(){}

    public void setMemberSocialNo(int memberSocialNo) {
        this.memberSocialNo = memberSocialNo;
    }

    public void setMemberSocialToken(String memberSocialToken) {
        this.memberSocialToken = memberSocialToken;
    }

    public void setMemberNo(int memberNo) {
        this.memberNo = memberNo;
    }

    public void setSocialType(String socialType) {
        this.socialType = socialType;
    }

    public int getMemberSocialNo() {
        return memberSocialNo;
    }

    public String getMemberSocialToken() {
        return memberSocialToken;
    }

    public int getMemberNo() {
        return memberNo;
    }

    public String getSocialType() {
        return socialType;
    }
}
