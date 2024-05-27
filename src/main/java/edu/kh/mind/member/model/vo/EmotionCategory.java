package edu.kh.mind.member.model.vo;

public class EmotionCategory {
	private int emotionCategoryCode;
	private String emotionCategoryName;

	public EmotionCategory() {
	}

	public int getEmotionCategoryCode() {
		return emotionCategoryCode;
	}

	public void setEmotionCategoryCode(int emotionCategoryCode) {
		this.emotionCategoryCode = emotionCategoryCode;
	}

	public String getEmotionCategoryName() {
		return emotionCategoryName;
	}

	public void setEmotionCategoryName(String emotionCategoryName) {
		this.emotionCategoryName = emotionCategoryName;
	}

	@Override
	public String toString() {
		return "EmotionCategory{" +
				"emotionCategoryCode=" + emotionCategoryCode +
				", emotionCategoryName='" + emotionCategoryName + '\'' +
				'}';
	}
}
