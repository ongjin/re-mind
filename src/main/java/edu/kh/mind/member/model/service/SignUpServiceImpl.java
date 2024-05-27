package edu.kh.mind.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.kh.mind.member.model.dao.SignUpDAO;
import edu.kh.mind.member.model.vo.Member;

@Service
public class SignUpServiceImpl implements SignUpService{
	
	@Autowired
	private SignUpDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	

	@Override
	public int idDupCheck(String inputId) {
		return dao.idDupCheck(inputId);
	}

	@Override
	public int nickNmDupCheck(String inputNickNm) {
		return dao.nickNmDupCheck(inputNickNm);
	}

	@Override
	public int signUp(Member member) {
		
		String encPw = encoder.encode(member.getMemberPw());
		
		member.setMemberPw(encPw);
		
		return dao.signUp(member);
	}

}
