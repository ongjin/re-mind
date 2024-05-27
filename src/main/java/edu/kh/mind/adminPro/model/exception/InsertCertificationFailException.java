package edu.kh.mind.adminPro.model.exception;

public class InsertCertificationFailException extends RuntimeException{
	public InsertCertificationFailException() {
		super("증명서 삽입 과정에 문제발생");
	}
	public InsertCertificationFailException(String message) {
		super(message);
	}
	
}
