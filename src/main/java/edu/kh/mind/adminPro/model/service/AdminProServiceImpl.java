package edu.kh.mind.adminPro.model.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import edu.kh.mind.member.model.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.mind.adminPro.model.dao.AdminProDAO;
import edu.kh.mind.adminPro.model.exception.InsertCertificationFailException;
import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.Image;
import edu.kh.mind.common.util.MailHandler;
import edu.kh.mind.common.util.TempKey;
import edu.kh.mind.common.util.Util;

import edu.kh.mind.member.model.vo.Profession;
import edu.kh.mind.member.model.vo.ProfessionHospital;
import edu.kh.mind.member.model.vo.ProfessionInformation;
import edu.kh.mind.member.model.vo.ProfessionPrice;
import edu.kh.mind.pro.model.vo.WorryCategory;

@Service
public class AdminProServiceImpl implements AdminProService{
	
	@Autowired
	AdminProDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
    @Inject
    private JavaMailSender mailSender;
    
	//아이디 중복확인 (이메일 중복확인)
	@Override
	public int idChk(String professionId) {
		return dao.idCheck(professionId);
	}

    @Override
    public void proRegister(Profession profession) throws Exception {
        
    	//비밀번호 암호화
        String encPassword = encoder.encode(profession.getProfessionPw());
        profession.setProfessionPw(encPassword);

        // 인증키 생성
        String key = new TempKey().getKey(50,false);
        //인증키 profession에 담기 
        profession.setProfessionAuthKey(key);

        //dao 호출
        dao.proRegister(profession);
        
        
        //메일 전송
        MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("re:mind 상담사 회원가입을 완료해주세요");
        sendMail.setText(
                new StringBuffer().append("<h1>re:mind 상담사 메일 인증</h1>").
                append("<a href='http://localhost:8080/mind/adminPro/emailConfirm?professionId=").
                append(profession.getProfessionId()).
                append("&memberAuthKey=").append(key).
                append("' target='_blank'>이메일 인증 확인</a>").toString());
        sendMail.setFrom("remindlab46@gmail.com", "마음연구소re:mind");


        sendMail.setTo(profession.getProfessionId());
        sendMail.send();
    }

	@Override
	public int chkAuth(Profession profession) {
		return dao.chkAuth(profession);
	}

	@Override
	public Profession selectProfession(Profession profession) {
		// TODO Auto-generated method stub
		return dao.selectProfession(profession);
	}

	@Override
	public int insertProHospital(ProfessionHospital proHospital) {
		// TODO Auto-generated method stub
		return dao.insertProHospital(proHospital);
	}


	@Override
	public int insertProInfo(ProfessionInformation proInfo, MultipartFile certification, String webPath, String serverPath) {
		
		Image img= new Image();
		
		img.setImagePath(webPath);
		img.setProfessionNo(proInfo.getProfessionNo());
		img.setImageName(Util.fileRename(certification.getOriginalFilename()));
		img.setImageOriginal(certification.getOriginalFilename());
		img.setImageLevel(0);
		
		int iResult = dao.insertProInfo(proInfo);
		for (int i = 0; i<3; i++ ) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("professionNo",proInfo.getProfessionNo());
			map.put("categoryCode",i+1);
			iResult = dao.insertPrice(map);
		}
		int result =0;
		if(iResult >0) {
			
			result = dao.insertCertification(img);
			
			if (result==1) {
				try {
					certification.transferTo(new File(serverPath+"/"+img.getImageName()));
					
				}catch (Exception e) {
					e.printStackTrace();
					
					throw new InsertCertificationFailException("파일 변환중 문제발생 ");
				}
			}else {
				throw new InsertCertificationFailException();
			}
		}
		
		return result;
	}

	@Override
	public List<WorryCategory> selectWorryCategory() {
		return dao.selectWorryCategory();
	}

	@Override
	public int updateProProfile(ProfessionInformation proInfo, MultipartFile proProfile, String webPath, String serverPath) {
		
		proInfo.setProfessionIntro(Util.XSS(proInfo.getProfessionIntro()));
		proInfo.setProfessionIntro(Util.changeNewLine(proInfo.getProfessionIntro()));
		
		proInfo.setProfessionStory(Util.XSS(proInfo.getProfessionStory()));
		proInfo.setProfessionStory(Util.changeNewLine(proInfo.getProfessionStory()));
		
		proInfo.setProfessionCarrer(Util.XSS(proInfo.getProfessionCarrer()));
		proInfo.setProfessionCarrer(Util.changeNewLine(proInfo.getProfessionCarrer()));
	
	
		Image img= new Image();
		img.setImagePath(webPath);
		img.setProfessionNo(proInfo.getProfessionNo());
		img.setImageName(Util.fileRename(proProfile.getOriginalFilename()));
		img.setImageOriginal(proProfile.getOriginalFilename());
		img.setImageLevel(1);
		
		int iResult = dao.insertProProfile(proInfo);
		
		Image result;
		int p = 0;
		if(iResult >0) {
			result = dao.selectProfilePic(img);
			
			if(result == null) {
				p =  dao.insertProfilePic(img);
				
			}else {
				p = dao.updateProfilePic(img);
			}
			
			
			if (p == 1) {
				try {
					proProfile.transferTo(new File(serverPath+"/"+img.getImageName()));
					
				}catch (Exception e) {
					e.printStackTrace();
					
					throw new InsertCertificationFailException("파일 변환중 문제발생 ");
				}
			}else {
				throw new InsertCertificationFailException();
			}
		}
		
		return p;
	}

	@Override
	public List<ProfessionPrice> selectPrice(int professionNo) {
		return dao.selectPrice(professionNo);
	}


	// 로그인
	@Override
	public Profession proLogin(Profession profession) {
		Profession loginPro =  dao.proLogin(profession);

		if(loginPro != null && encoder.matches(profession.getProfessionPw(), loginPro.getProfessionPw())) {
			loginPro.setProfessionPw(null);
		} else {
			loginPro = null;
		}


		return loginPro;
	}

	// 채팅방 입장
	@Override
	public List<ChatMessage> joinChat(ChatJoin chat) {
		int result = dao.existsChat(chat);
		System.out.println("existsChat : " + result);

		if (result > 0) {
			chat.setChattingNo(result);
			List<ChatMessage> list = dao.selectChatMessage(chat);

			System.out.print("list : ");
			System.out.println(list);
			return list;
		} else {
			return null;
		}

	}

	@Override
	public ProfessionInformation selectProInfo(int professionNo) {
		// TODO Auto-generated method stub
		return dao.selectProfessionInfo(professionNo);
	}

	@Override
	public ProfessionInformation updateProInfo(ProfessionInformation proInfo) {
		// TODO Auto-generated method stub
		return dao.updateProInfo(proInfo);
	}

	@Override
	public Profession updatepro(Profession pro) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updatePrice(List<String> counselPrice , int professionNo) {
		int result =0;
		
		System.out.println(counselPrice);
		for(int i =0; i< counselPrice.size() ; i++) {
			Map<String, Integer> price = new HashMap<String, Integer>();
			
			price.put("professionNo", professionNo);
			price.put("categoryCode", i+1);
			price.put("counselPrice", Integer.parseInt(counselPrice.get(i)));
			
			result = dao.updatePrice(price);			
		}
		
		return result;
	}

	@Override
	public List<Profession> classList(int professionNo) {
		return dao.classList(professionNo);
	}

	@Override
	public Profession selectProfessionRegister(Profession profession) {
		// TODO Auto-generated method stub
		return dao.selectProfessionRegister(profession);
	}
	
	// 고민카테고리 가지고오기
	@Override
	public String CounselCategoryCodeSelect(int professionNo) {

		return dao.CounselCategoryCodeSelect(professionNo);
	}
	
	// 고민 게시판 리스트
	@Override
	public List<Board> proWorryListSelect(Profession loginPro) {
		return dao.proWorryListSelect(loginPro);
	}


	@Override
	public ProfessionInformation selectProfessionInfo(int professionNo) {
		
		ProfessionInformation proInfo = dao.selectProfessionInfo(professionNo);
		
	
		// TODO Auto-generated method stub
		return proInfo;
	}

	@Override
	public ProfessionHospital selectProfessionHospital(int professionNo) {
		// TODO Auto-generated method stub
		return dao.selectProfessionHospital(professionNo);
	}

	@Override
	public String setCategory(int professionNo) {
		// TODO Auto-generated method stub
		return dao.setCategory(professionNo);
	}


	
	//이메일 인증 키 검증


}
