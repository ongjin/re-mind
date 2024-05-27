package edu.kh.mind.member.model.vo;

public class EmotionDiary {
	private int emotionNo;
	private String emotionArray;
	private String stressArray;
	private String emotionContent;
	private int stressAgree;
	private int diaryAgree;
	private String emotionDate;
	private String emotionUpdateDate;
	private int memberNo;

	public EmotionDiary() {
	}

	public int getEmotionNo() {
		return emotionNo;
	}

	public void setEmotionNo(int emotionNo) {
		this.emotionNo = emotionNo;
	}

	public String getEmotionArray() {
		return emotionArray;
	}

	public void setEmotionArray(String emotionArray) {
		this.emotionArray = emotionArray;
	}

	public String getStressArray() {
		return stressArray;
	}

	public void setStressArray(String stressArray) {
		this.stressArray = stressArray;
	}

	public String getEmotionContent() {
		return emotionContent;
	}

	public void setEmotionContent(String emotionContent) {
		this.emotionContent = emotionContent;
	}

	public int getStressAgree() {
		return stressAgree;
	}

	public void setStressAgree(int stressAgree) {
		this.stressAgree = stressAgree;
	}

	public int getDiaryAgree() {
		return diaryAgree;
	}

	public void setDiaryAgree(int diaryAgree) {
		this.diaryAgree = diaryAgree;
	}

	public String getEmotionDate() {
		return emotionDate;
	}

	public void setEmotionDate(String emotionDate) {
		this.emotionDate = emotionDate;
	}

	public String getEmotionUpdateDate() {
		return emotionUpdateDate;
	}

	public void setEmotionUpdateDate(String emotionUpdateDate) {
		this.emotionUpdateDate = emotionUpdateDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "EmotionDiary{" +
				"emotionNo=" + emotionNo +
				", emotionArray='" + emotionArray + '\'' +
				", stressArray='" + stressArray + '\'' +
				", emotionContent='" + emotionContent + '\'' +
				", stressAgree=" + stressAgree +
				", diaryAgree=" + diaryAgree +
				", emotionDate='" + emotionDate + '\'' +
				", emotionUpdateDate='" + emotionUpdateDate + '\'' +
				", memberNo=" + memberNo +
				'}';
	}
}
