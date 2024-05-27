package edu.kh.mind.pro.model.vo;

import java.sql.Date;

public class Payment {
	private int payNo;
	private int payAmount;
	private Date payDate;
	private Date payUpdateDate;
	private int paymentStatus;
	private int reservationNo;
	
	public Payment() {
		// TODO Auto-generated constructor stub
	}

	public int getPayNo() {
		return payNo;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}

	public int getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public Date getPayUpdateDate() {
		return payUpdateDate;
	}

	public void setPayUpdateDate(Date payUpdateDate) {
		this.payUpdateDate = payUpdateDate;
	}

	public int getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(int paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public int getReservationNo() {
		return reservationNo;
	}

	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}

	@Override
	public String toString() {
		return "Payment [payNo=" + payNo + ", payAmount=" + payAmount + ", payDate=" + payDate + ", payUpdateDate="
				+ payUpdateDate + ", paymentStatus=" + paymentStatus + ", reservationNo=" + reservationNo + "]";
	}

	
}
