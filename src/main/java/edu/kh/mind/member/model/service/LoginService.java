package edu.kh.mind.member.model.service;

import edu.kh.mind.member.model.vo.Member;
import edu.kh.mind.member.model.vo.Profession;
import edu.kh.mind.member.social.naver.vo.Naver;

import java.util.List;
import java.util.Map;

public interface LoginService {

    int kakaoLogin(Map map);

    Member emailLogin(Member member);

    Member socialCheck(String mobile);

    int socialSignUp(Member member);

    int insertToken(Naver naver);

    int selectToken(Naver naver);

    int selectAuthority(int memberNo);

    List<Member> selectMember();

    int isPrime(Map<String, Integer> map);

    List<Profession> getGmProfession();

    int changePro(Map<String, Integer> map);

    Member detailMember(int memberNo);
}
