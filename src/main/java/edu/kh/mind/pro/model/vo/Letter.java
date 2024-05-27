package edu.kh.mind.pro.model.vo;

import java.sql.Date;

public class Letter {
	
	private int letterNo; // 쪽지 번호
	private String letterContent; // 쪽지 내용
	private Date letterDate; // 쪽지 전송일
	private int letterRead; // 쪽지 읽음 상태 (0: 안읽음 1: 답변처리완료)
	private int letterType; // 쪽지 구분 (1 : 전문가 , 2 : 관리자) 
	private int letterStatusCode; // 상태코드 ( 디폴트 0)
	private int memberNo;
	private int professionNo;
	private int letterReply; // 답변쪽지일 경우 부모 쪽지번호 삽입 예정
	
	public Letter() {
		
	}
	
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
	public Date getLetterDate() {
		return letterDate;
	}
	public void setLetterDate(Date letterDate) {
		this.letterDate = letterDate;
	}
	public int getLetterRead() {
		return letterRead;
	}
	public void setLetterRead(int letterRead) {
		this.letterRead = letterRead;
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

	public int getLetterReply() {
		return letterReply;
	}
	public void setLetterReply(int letterReply) {
		this.letterReply = letterReply;
	}
	
	@Override
	public String toString() {
		return "Letter [letterNo=" + letterNo + ", letterContent=" + letterContent + ", letterDate=" + letterDate
				+ ", letterRead=" + letterRead + ", letterType=" + letterType + ", letterStatusCode=" + letterStatusCode
				+ ", MemberNo=" + memberNo + ", professtionNo=" + professionNo + ", letterReply=" + letterReply + "]";
	}
	
}
