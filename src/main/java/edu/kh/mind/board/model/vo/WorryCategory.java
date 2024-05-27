package edu.kh.mind.board.model.vo;

public class WorryCategory {
	private int worryCategoryCode;
	private String worryName;
	private int professionNo;

	public WorryCategory() {
	}

	public void setProfessionNo(int professionNo) {
		this.professionNo = professionNo;
	}

	public int getProfessionNo() {
		return professionNo;
	}

	public void setWorryCategoryCode(int worryCategoryCode) {
		this.worryCategoryCode = worryCategoryCode;
	}

	public void setWorryName(String worryName) {
		this.worryName = worryName;
	}

	public int getWorryCategoryCode() {
		return worryCategoryCode;
	}

	public String getWorryName() {
		return worryName;
	}
}
