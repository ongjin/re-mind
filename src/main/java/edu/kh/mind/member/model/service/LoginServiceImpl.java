package edu.kh.mind.member.model.service;

import edu.kh.mind.member.model.dao.LoginDAO;
import edu.kh.mind.member.model.vo.Member;
import edu.kh.mind.member.model.vo.Profession;
import edu.kh.mind.member.social.naver.vo.Naver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class LoginServiceImpl implements LoginService{

    @Autowired
    private LoginDAO dao;

    @Autowired
    private BCryptPasswordEncoder encoder;

    @Override
    public int kakaoLogin(Map map) {
        return dao.kakaoLogin(map);
    }


    @Override
    public List<Member> selectMember() {
        return dao.selectMember();
    }

    @Override
    public int selectAuthority(int memberNo) {
        return dao.selectAuthority(memberNo);
    }

    @Override
    public int changePro(Map<String, Integer> map) {
        int result = 0;

        if(Integer.parseInt(String.valueOf(map.get("statusCode"))) == 4)
            result = dao.stopProfession(map);
        else
            result = dao.rollbackProfession(map);

        return result;
    }

    @Override
    public Member detailMember(int memberNo) {
        return dao.detailMember(memberNo);
    }

    @Override
    public List<Profession> getGmProfession() {
        return dao.getGmProfession();
    }

    @Override
    public int isPrime(Map<String, Integer> map) {
        int result = 0;

        if(Integer.parseInt(String.valueOf(map.get("statusCode"))) == 0)
            result = dao.stopMember(map);
        else
            result = dao.rollbackMember(map);

        return result;
    }

    @Override
    public Member emailLogin(Member member) {
    	
    	
        Member loginMember = dao.emailLogin(member.getMemberId());
        
        if(loginMember != null) {
        	Member image = dao.selectPic(member.getMemberId());
        	if(image != null) {
        		loginMember.setImagePath(image.getImagePath());
        		loginMember.setImageName(image.getImageName());
        	}
        }

        if(loginMember != null && encoder.matches(member.getMemberPw(), loginMember.getMemberPw())) {
            loginMember.setMemberPw(null);
            
        } else {
            loginMember = null;
        }

        return loginMember;
    }

    @Override
    public Member socialCheck(String mobile) {
        return dao.socialCheck(mobile);
    }

    @Override
    public int socialSignUp(Member member) {
        return dao.socialSignUp(member);
    }

    @Override
    public int insertToken(Naver naver) {
        return dao.insertToken(naver);
    }

    @Override
    public int selectToken(Naver naver) {
        return dao.selectToken(naver);
    }
}
