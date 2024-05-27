package edu.kh.mind.adminPro.model.dao;

import edu.kh.mind.member.model.vo.*;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.Image;

import edu.kh.mind.member.model.vo.Profession;
import edu.kh.mind.member.model.vo.ProfessionHospital;
import edu.kh.mind.member.model.vo.ProfessionInformation;
import edu.kh.mind.member.model.vo.ProfessionPrice;
import edu.kh.mind.pro.model.vo.WorryCategory;


@Repository
public class AdminProDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	/* 이메일 중복 확인
	 * @param inputId
	 * @return
	 */
	public int idCheck(String professionId) {
		return sqlSession.selectOne("professionMapper.idCheck", professionId);
	}

	
	/** 아이디(이메일) 등록 및 인증 
	 * @param profession
	 * @return
	 */
	public int proRegister(Profession profession) {
		return sqlSession.insert("professionMapper.proRegister", profession);
	}
	
	//이메일 인증 확인
	public int chkAuth(Profession profession) {
		// TODO Auto-generated method stub
		return sqlSession.update("professionMapper.chkAuth", profession);
	}


	public Profession selectProfession(Profession profession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("professionMapper.selectPro", profession);
	}


	public int insertProHospital(ProfessionHospital proHospital) {
		// TODO Auto-generated method stub
		return sqlSession.insert("professionMapper.insertProHospital", proHospital);
	}


	
	public int insertProfilePic(Image img) {
		// TODO Auto-generated method stub
		return sqlSession.insert("professionMapper.insertProfilePic", img);
	}


	public int insertProInfo(ProfessionInformation proInfo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("professionMapper.insertProInfo",proInfo);
	}



	public List<WorryCategory> selectWorryCategory() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("worryMapper.selectWorryCategory");
	}
	
	


	public int insertProProfile(ProfessionInformation proInfo) {
		// TODO Auto-generated method stub
		return sqlSession.update("professionMapper.updateProProfile", proInfo);
	}


	public List<ProfessionPrice> selectPrice(int professionNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("professionMapper.selectPrice",professionNo);
	}


	public int updatePrice(Map<String, Integer> price) {
		// TODO Auto-generated method stub
		return sqlSession.update("professionMapper.updatePrice", price);
	}

	/**
	 * 로그인
	 * @param profession
	 * @return loginPro
	 */
	public Profession proLogin(Profession profession) {
		return sqlSession.selectOne("professionMapper.proLogin", profession);
	}

	/**
	 * 채팅방 입장
	 * @param chat
	 * @return result
	 */
	public int existsChat(ChatJoin chat) {
		return sqlSession.selectOne("professionMapper.existsChat", chat);
	}

	/**
	 * 채팅방 메시지
	 * @param chat
	 * @return list
	 */
	public List<ChatMessage> selectChatMessage(ChatJoin chat) {
		return sqlSession.selectList("professionMapper.selectChatMessage", chat);
	}


	public int insertPrice(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("professionMapper.insertPrice", map);
	}


	public List<Profession> classList(int professionNo) {
		return sqlSession.selectList("professionMapper.classList", professionNo);
	}


	public Profession selectProfessionRegister(Profession profession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("professionMapper.selectProfessionRegister",profession);
	}


	public int insertCertification(Image img) {
		// TODO Auto-generated method stub
		return sqlSession.insert("professionMapper.insertCertification",img);
	}


	public Image selectProfilePic(Image img) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("professionMapper.selectProfilePic", img);
	}


	public int updateProfilePic(Image img) {
		// TODO Auto-generated method stub
		return sqlSession.update("professionMapper.updateProfilePic", img);
	}


	public String CounselCategoryCodeSelect(int professionNo) {
		return sqlSession.selectOne("professionMapper.CounselCategoryCodeSelect", professionNo);
	}

	//	고민게시판 리스트
	public List<Board> proWorryListSelect(Profession loginPro) {
		
		return sqlSession.selectList("boardMapper.proWorryListSelect", loginPro);
	}


	public ProfessionInformation selectProfessionInfo(int professionNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("professionMapper.selectProfessionInfo", professionNo);
	}


	public ProfessionHospital selectProfessionHospital(int professionNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("professionMapper.selectProfessionHospital", professionNo);
	}


	public ProfessionInformation updateProInfo(ProfessionInformation proInfo) {
		// TODO Auto-generated method stub
		return null;
	}


    public String setCategory(int professionNo) {
		return sqlSession.selectOne("professionMapper.setCategory", professionNo);
    }


	
	
	// 상담사 페이지 - 고민 카테고리 가지고 오기 



}
