package edu.kh.mind.adminPro.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import edu.kh.mind.member.model.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.mind.adminPro.model.service.AdminProService;
import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.common.util.Util;
import edu.kh.mind.pro.model.vo.WorryCategory;

@Controller
@RequestMapping("adminPro/*")
@SessionAttributes({"loginPro", "chattingNo", "price", "proInfo", "proHospital"})
public class AdminProController {
	
	@Autowired
	private AdminProService service;


	@RequestMapping(value = "/")
	public String proMain(HttpSession session) {

		String path = "adminPro/proLogin";
		if (session.getAttribute("loginPro") != null) {
			path = "redirect:/adminPro/proWorryList";
		}

		return path;
	}

	// 로그인 페이지
	@RequestMapping(value = "proLogin", method = RequestMethod.GET )
	public String proLoginForm(HttpSession session) {

		String path = "adminPro/proLogin";
		if (session.getAttribute("loginPro") != null) {
			path = "redirect:/adminPro/proReservation";
		}
		
		return path;	}

	// 로그인
	@RequestMapping(value="proLogin", method = RequestMethod.POST)
	public String proLogin(Profession profession, Model model, RedirectAttributes ra) {
		System.out.println(profession.toString());
		Profession loginPro = service.proLogin(profession);
		System.out.println(loginPro);

		String path = "redirect:/adminPro/proLogin";

		if (loginPro != null) {
			if (loginPro.getStatusCode() == 4) {
				model.addAttribute("loginPro", loginPro);
				path = "redirect:/adminPro/proWorryList";
			} else if(loginPro.getStatusCode() == 3) {
				
				model.addAttribute("loginPro", loginPro);
				Util.swalSetMessage("프로필 입력 후 승인 가능합니다.", null, "info", ra);
				path = "redirect:/adminPro/update/" + loginPro.getProfessionNo();
			}
		} else {
			Util.swalSetMessage("아이디 또는 비밀번호를 확인해 주세요.", null, "error", ra);
		}

		return path;

	}

	// 상담사 예약 목록
	@RequestMapping("proReservation")
	public String proReservation() {

		return "adminPro/proReservation";
	}
	
	// 상담사 고민 상담 페이지
	@RequestMapping(value="proWorryList", method = RequestMethod.GET)
	public String proWorryList() {
		
		return "adminPro/proWorryList";
	}
	
	// 상담사 고민 상담 페이지
		@ResponseBody
		@RequestMapping(value="proWorryList", method = RequestMethod.POST)
		public List<Board> proWorryList(@ModelAttribute("loginPro") Profession loginPro) {
			
			// 상담사 고유 카테고리 번호 가지고오기
			String CounselCategoryCode = service.CounselCategoryCodeSelect(loginPro.getProfessionNo());
			
			// loginPro 객체에 고유 카테고리 번호 넣기
			loginPro.setCounselCategoryCode(CounselCategoryCode);

			System.out.println(loginPro);
					
			List<Board> proWorryList = service.proWorryListSelect(loginPro);
			
			System.out.println("이거말하는거지"+proWorryList);
			
			return proWorryList;
		}
	
	
	

	
	// 상담사 등록 신청
	@RequestMapping(value = "proRegister", method = RequestMethod.GET )
	public String proRegister() {
		
		return "adminPro/proRegister";
	}

	
	// 클래스 
	@ResponseBody
	@RequestMapping(value ="reservationList", method=RequestMethod.GET)
	public List<Profession> reservationList(HttpSession session, Model model) {
		
		int professionNo = ((Profession)session.getAttribute("loginPro")).getProfessionNo();
		
		System.out.println("professionNo : " + professionNo);
		
		List<Profession> data = service.classList(professionNo);
		
		System.out.println(data);
		
	    return data;
	}
	
	
	
	// 아이디 중복 검사
	@RequestMapping(value = "emailDupCheck", method=RequestMethod.GET)
	@ResponseBody
	public int emailDupCheck(String professionId) {
		
		//아이디 중복검사 Service 호출
		int result = service.idChk(professionId);
		System.out.println(result);
		return result;
	}
	
	
	//등록 & 이메일 인증
	@RequestMapping(value = "proRegister", method = RequestMethod.POST )
	public String proRegister(Profession profession) throws Exception{
		
		service.proRegister(profession);
		
		
		
			
       return "redirect:/adminPro/";
		
	}
	
    //이메일 인증 코드 검증
    @RequestMapping(value = "emailConfirm", method = RequestMethod.GET)
    public String emailConfirm(Profession profession, Model model, RedirectAttributes ra) { 
        
        
        int result = service.chkAuth(profession);
        
        if(result == 0) {
            Util.swalSetMessage("다시 인증해주세요","","error", ra);
            return "redirect:/";
        }else {
        	
        	Profession loginPro = service.selectProfession(profession);
        	model.addAttribute("loginPro", loginPro);
        	
        	return "adminPro/emailConfirm";
        }
    }
    
    //상담사 정보등록 페이지 연결
    @RequestMapping(value="proRegisterDetail/{professionNo}", method = RequestMethod.GET)
    public String insertproDetail(@PathVariable int professionNo,Model model){
    	
    	model.addAttribute("professionNo",professionNo);
    	return "adminPro/proRegisterDetail";
    }
    
    
    //상담사 정보등록 
    @RequestMapping(value = "proRegisterDetail", method = RequestMethod.POST )
    public String insertproDetail( ProfessionHospital proHospital, ProfessionInformation proInfo, MultipartFile certification,Profession profession,
    							Model md, RedirectAttributes ra, HttpSession session) {
    	
    	
    	//loginPro의 ProfessionNo set
    	Profession result = service.selectProfessionRegister(profession);
    	
    	proHospital.setProfessionNo(profession.getProfessionNo());
    	proInfo.setProfessionNo(profession.getProfessionNo());
    	
    	int StatusCode = result.getStatusCode();
    	
    	String path = null; 
    	if(StatusCode == 3) {
    		
    		//학력증명서 
    		//웹 접근경로(web path), 서버 저장경로(serverPath)
    		String webPath = "/resources/images/pro/certification";
    		
    		String serverPath= session.getServletContext().getRealPath(webPath);
    		
    		//병원정보 등록
    		int hResult = service.insertProHospital(proHospital);
    		
    		System.out.println(certification);
    		
    		
    		if(hResult < 0) {
    			Util.swalSetMessage("게시글 등록 실패", null, "error", ra);
    			path = "/adminPro/proRegisterDetail"+result.getProfessionNo();
    		}else {
    			//학력정보 입력
    			int iResult = service.insertProInfo(proInfo,certification, webPath, serverPath);
    			
    			
    			if(iResult > 0) { // insert 성공 
    				Util.swalSetMessage("아직 끝나지 않았어요!","프로필을 작성해 주세요", "success", ra);
    				
    				path = "/adminPro/AdminProProfile/"+proInfo.getProfessionNo();
    			}else {
    				Util.swalSetMessage("게시글 등록 실패", null, "error", ra);
    				path = "/adminPro/proRegisterDetail";
    				
    			}
    		}
    	}else {
    		Util.swalSetMessage("이미 승인 완료된 상담사입니다. 로그인 해주세요", null, "error", ra);
			path = "/";
    	}
    	
 
    	return "redirect:"+path;
    }
    
    //상담사 프로필 조회 연결
    @RequestMapping(value = "AdminProProfile/{professionNo}")
    public String AdminProProfileView(@ModelAttribute("loginPro") Profession loginPro,
    		@PathVariable int professionNo, Model model) {
    	
    	WorryCategory worryCategory = new WorryCategory();
    	
    	ProfessionInformation proInfo = service.selectProfessionInfo(professionNo);
    	if(proInfo.getProfessionTag() != null) {
    		worryCategory.setWorryName(service.setCategory(professionNo));
    	}
    	
    	ProfessionHospital proHospital = service.selectProfessionHospital(professionNo);
    	List<ProfessionPrice> price = service.selectPrice(professionNo);
    	
    			
    	model.addAttribute("proInfo", proInfo);
    	model.addAttribute("worryCategory", worryCategory);
    	model.addAttribute("proHospital", proHospital);
    	model.addAttribute("price", price);
    	model.addAttribute("css", "proPage/proProfile");
    	
    	return "adminPro/AdminProProfile";
    }
    
    
    //상담사 프로필 수정 연결
    @RequestMapping(value = "update/{professionNo}" , method = RequestMethod.GET)
    public String AdminProProfile(@PathVariable int professionNo, Model model) {
		List<WorryCategory> category = service.selectWorryCategory();
		List<ProfessionPrice> price = service.selectPrice(professionNo);
    	ProfessionInformation proInfo = service.selectProfessionInfo(professionNo);
    	proInfo.setProfessionIntro(Util.changeNewLine2(proInfo.getProfessionIntro()));
		proInfo.setProfessionStory(Util.changeNewLine2(proInfo.getProfessionStory()));
		proInfo.setProfessionCarrer(Util.changeNewLine2(proInfo.getProfessionCarrer()));
    	ProfessionHospital proHospital = service.selectProfessionHospital(professionNo);
		
		//프로필 정보 조회해 오기
		model.addAttribute("price", price);
    	model.addAttribute("proInfo", proInfo);
    	model.addAttribute("proHospital", proHospital);
		model.addAttribute("category", category);
		model.addAttribute("css", "proPage/proProfile");
		
    	 return "adminPro/AdminProProfileUpdate";
    }
    
    //상담사 프로필 삽입
    @RequestMapping(value = "update/{professionNo}", method = RequestMethod.POST)
    public String AdminProProfile(@ModelAttribute("loginPro") Profession loginPro,ProfessionInformation proInfo, ProfessionPrice price, @RequestParam List<String> counselPrice,
    		 MultipartFile proProfile, HttpSession session, @PathVariable int professionNo, String worryCategoryCode, RedirectAttributes ra, Model model ) {
		
		proInfo.setProfessionNo(loginPro.getProfessionNo());
		proInfo.setProfessionTag(worryCategoryCode);
		  
		System.out.println(proInfo.toString());
		
    	//웹 접근경로(web path), 서버 저장경로(serverPath)
		String webPath = "/resources/images/pro/pro_img";
		String serverPath= session.getServletContext().getRealPath(webPath);
		
		//상담사 프로필 사진 업 
		int result = service.updateProProfile(proInfo,proProfile,webPath,serverPath);
		
		 
    	String path = null;
    	if(result >0){
    		
    		int pResult = service.updatePrice(counselPrice,professionNo);
    		
    		if(pResult > 0) {
    			model.addAttribute("proInfo", proInfo);
    			model.addAttribute("price", price);
    			Util.swalSetMessage("상담사 등록 신청 완료","상담사 승인이 완료되면 이메일로 알려드립니다.", "success", ra);
    			
    			
    			path = "../AdminProProfile/"+loginPro.getProfessionNo();
    			
    			
    		}else {
    			Util.swalSetMessage("프로필 수정 실패", null, "error", ra);
    			path = "/update/"+proInfo.getProfessionNo();
    		}
    	}
    	
    	return "redirect:"+path;
    }



	@RequestMapping("chat/room/{reservationNo}")
	public String chatJoin(@PathVariable("reservationNo") int reservationNo, ChatJoin chat, RedirectAttributes ra, Model model, HttpSession session) {

		String path = "redirect:/adminPro/proReservation";
		if (session.getAttribute("loginPro") != null) {

			int professionNo = ((Profession) session.getAttribute("loginPro")).getProfessionNo();
			System.out.println(professionNo);
			System.out.println(chat);

			chat.setProfessionNo(professionNo);
			List<ChatMessage> list = service.joinChat(chat);
			System.out.println(list);

			if (list != null) {
				model.addAttribute("chattingNo", chat.getChattingNo());

//				model.addAttribute("css", "my");
				model.addAttribute("chat", chat);
				model.addAttribute("list", list);

				path = "adminPro/proChat";
			} else {
				Util.swalSetMessage("해당 채팅방이 존재하지 않습니다.", null, "info", ra);
			}
		} else {
			Util.swalSetMessage("로그인이 필요 합니다.", null, "error", ra);
		}

		return path;

	}
	
    @RequestMapping("logout")
    public String logout(SessionStatus status) {
        status.setComplete();

        return "redirect:/adminPro/";
    }
	
    //예외처리
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e, Model model) {
		
		//Model : 데이터 전달용 객체(Map형식, request범위)
		
		model.addAttribute("errorMessage", "회원 관련 서비스 이용 중 문제가 발생했습니다.");
		model.addAttribute("e", e);
		
		return "/common/error";
	}

}
