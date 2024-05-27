package edu.kh.mind.member.model.service;

import edu.kh.mind.member.model.vo.Member;

public interface SignUpService {

	/** 아이디 중복 검사
	 * @param inputId
	 * @return result
	 */
	int idDupCheck(String inputId);

	/** 닉네임 중복 검사
	 * @param inputNickNm
	 * @return result
	 */
	int nickNmDupCheck(String inputNickNm);

	/** 회원가입
	 * @param member
	 * @return result
	 */
	int signUp(Member member);

}
