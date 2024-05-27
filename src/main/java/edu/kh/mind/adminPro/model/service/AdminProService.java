package edu.kh.mind.adminPro.model.service;

import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.member.model.vo.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

import edu.kh.mind.member.model.vo.Profession;
import edu.kh.mind.member.model.vo.ProfessionHospital;
import edu.kh.mind.member.model.vo.ProfessionInformation;
import edu.kh.mind.member.model.vo.ProfessionPrice;
import edu.kh.mind.pro.model.vo.WorryCategory;

public interface AdminProService {

	
	/**아이디 중복검사 
	 * @param inputId
	 * @return
	 */
	int idChk(String professionId);
	
	/**
	 * 상담사 등록
	 * @param profession
	 * @throws Exception
	 */
	void proRegister(Profession profession) throws Exception;


	int chkAuth(Profession profession);

	Profession selectProfession(Profession profession);

	/** 병원정보 등록
	 * @param proHospital
	 * @return
	 */
	int insertProHospital(ProfessionHospital proHospital);

	/**
	 * @param proInfo
	 * @param serverPath 
	 * @param webPath 
	 * @return
	 */
	int insertProInfo(ProfessionInformation proInfo, MultipartFile certification, String webPath, String serverPath);

	/** 고민 카테고리 조회
	 * @return
	 */
	List<WorryCategory> selectWorryCategory();


	
	/** 상담사 프로필 등록
	 * @param proInfo
	 * @param serverPath 
	 * @param webPath 
	 * @param proProfile 
	 * @return
	 */

	int updateProProfile(ProfessionInformation proInfo, MultipartFile proProfile, String webPath, String serverPath);

	/** 가격조회
	 * @param professionNo 
	 * @return
	 */
	List<ProfessionPrice> selectPrice(int professionNo);

	/** 가격 수정
	 * @param counselPrice
	 * @param professionNo 
	 * @return
	 */
	int updatePrice(List<String> counselPrice, int professionNo);



	/**
	 * 로그인
	 * @param profession
	 * @return loginPro
	 */
    Profession proLogin(Profession profession);

	/**
	 * 채팅방 입장
	 * @param chat
	 * @return
	 */
	List<ChatMessage> joinChat(ChatJoin chat);

	ProfessionInformation selectProInfo(int professionNo);

	ProfessionInformation updateProInfo(ProfessionInformation proInfo);

	Profession updatepro(Profession pro);

	List<Profession> classList(int professionNo);
	
	// 등록용 승인코드 조회
	Profession selectProfessionRegister(Profession profession);
	
	// 고민 카테고리 가지고오기
	String CounselCategoryCodeSelect(int professionNo);
	
	// 고민 카테고리 리스트 가지고 오기
	List<Board> proWorryListSelect(Profession loginPro);

	ProfessionInformation selectProfessionInfo(int professionNo);

	ProfessionHospital selectProfessionHospital(int professionNo);

	String setCategory(int professionNo);

	
}
