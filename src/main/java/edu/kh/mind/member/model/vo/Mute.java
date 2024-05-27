package edu.kh.mind.member.model.vo;

public class Mute {
    private int muteNo;
    private int memberNo;
    private String memberName;
    private String memberFName;
    private String memberPhone;
    private String imagePath;
    private String imageName;
    private int imageLevel;

    public Mute(){}

    public void setMemberNo(int memberNo) {
        this.memberNo = memberNo;
    }

    public void setMuteNo(int muteNo) {
        this.muteNo = muteNo;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public void setMemberPhone(String memberPhone) {
        this.memberPhone = memberPhone;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public void setImageLevel(int imageLevel) {
        this.imageLevel = imageLevel;
    }

    public int getMemberNo() {
        return memberNo;
    }

    public int getMuteNo() {
        return muteNo;
    }

    public String getMemberName() {
        return memberName;
    }

    public String getMemberPhone() {
        return memberPhone;
    }

    public String getImagePath() {
        return imagePath;
    }

    public String getImageName() {
        return imageName;
    }

    public int getImageLevel() {
        return imageLevel;
    }

	public String getMemberFName() {
		return memberFName;
	}

	public void setMemberFName(String memberFName) {
		this.memberFName = memberFName;
	}
    
    
}
