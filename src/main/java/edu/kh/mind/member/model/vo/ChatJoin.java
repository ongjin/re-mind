package edu.kh.mind.member.model.vo;

public class ChatJoin {

    private int chattingNo;
    private String chattingEnrollDate;
    private int chattingStatusCode;
    private int reservationNo;

    private int memberNo;
    private int professionNo;

    public ChatJoin() {
    }

    public int getChattingNo() {
        return chattingNo;
    }

    public void setChattingNo(int chattingNo) {
        this.chattingNo = chattingNo;
    }

    public String getChattingEnrollDate() {
        return chattingEnrollDate;
    }

    public void setChattingEnrollDate(String chattingEnrollDate) {
        this.chattingEnrollDate = chattingEnrollDate;
    }

    public int getChattingStatusCode() {
        return chattingStatusCode;
    }

    public void setChattingStatusCode(int chattingStatusCode) {
        this.chattingStatusCode = chattingStatusCode;
    }

    public int getReservationNo() {
        return reservationNo;
    }

    public void setReservationNo(int reservationNo) {
        this.reservationNo = reservationNo;
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

    @Override
    public String toString() {
        return "ChatJoin{" +
                "chattingNo=" + chattingNo +
                ", chattingEnrollDate='" + chattingEnrollDate + '\'' +
                ", chattingStatusCode=" + chattingStatusCode +
                ", reservationNo=" + reservationNo +
                ", memberNo=" + memberNo +
                ", professionNo=" + professionNo +
                '}';
    }
}
