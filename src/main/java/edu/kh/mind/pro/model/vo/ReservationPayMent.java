package edu.kh.mind.pro.model.vo;

public class ReservationPayMent {
	
	private int reservationPayNo; // 상담 예약 결제 번호
	private int memberNo; // 회원번호
	private int professionNo; // 전문가번호
	private int totalCnt; // 상담가능횟수
	private int usedCnt; // 상담 사용수
	private int statusCode; // 상담 가능 여부 1: 사용가능, 2: 사용불가(결제취소, 사용완료)
	
	public ReservationPayMent() {
		// TODO Auto-generated constructor stub
	}

	public int getReservationPayNo() {
		return reservationPayNo;
	}

	public void setReservationPayNo(int reservationPayNo) {
		this.reservationPayNo = reservationPayNo;
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

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getUsedCnt() {
		return usedCnt;
	}

	public void setUsedCnt(int usedCnt) {
		this.usedCnt = usedCnt;
	}

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

	@Override
	public String toString() {
		return "ReservationPayMent [reservationPayNo=" + reservationPayNo + ", memberNo=" + memberNo + ", professionNo="
				+ professionNo + ", totalCnt=" + totalCnt + ", usedCnt=" + usedCnt + ", statusCode=" + statusCode + "]";
	}
	
}
