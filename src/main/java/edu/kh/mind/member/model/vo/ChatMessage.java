package edu.kh.mind.member.model.vo;

public class ChatMessage {
	private int chatNo;
	private String message;
	private String createDate;
	private int professionNo;
	private int memberNo;
	private int chattingNo;

	private String professionName;
	private String memberName;

	public ChatMessage() {
	}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public int getProfessionNo() {
		return professionNo;
	}

	public void setProfessionNo(int professionNo) {
		this.professionNo = professionNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getChattingNo() {
		return chattingNo;
	}

	public void setChattingNo(int chattingNo) {
		this.chattingNo = chattingNo;
	}

	public String getProfessionName() {
		return professionName;
	}

	public void setProfessionName(String professionName) {
		this.professionName = professionName;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	@Override
	public String toString() {
		return "ChatMessage{" +
				"chatNo=" + chatNo +
				", message='" + message + '\'' +
				", createDate='" + createDate + '\'' +
				", professionNo=" + professionNo +
				", memberNo=" + memberNo +
				", chattingNo=" + chattingNo +
				", professionName='" + professionName + '\'' +
				", memberName='" + memberName + '\'' +
				'}';
	}
}
