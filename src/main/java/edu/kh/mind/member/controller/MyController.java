package edu.kh.mind.member.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.Image;
import edu.kh.mind.board.model.vo.Pagination;
import edu.kh.mind.common.util.Util;
import edu.kh.mind.member.model.service.MyService;

import edu.kh.mind.member.model.vo.EmotionCategory;
import edu.kh.mind.member.model.vo.EmotionDiary;
import edu.kh.mind.member.model.vo.Member;
import edu.kh.mind.member.model.vo.ProfessionHospital;
import edu.kh.mind.member.model.vo.Review;

import edu.kh.mind.member.model.vo.*;
import edu.kh.mind.member.social.naver.vo.Naver;

import edu.kh.mind.pro.model.vo.Reservation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/my/*")
@SessionAttributes({"loginMember", "naver", "counselorList"})
public class MyController {

    @Autowired
    private MyService service;
    

    // 상담 예약 조회 페이지
    @RequestMapping(value="appointment", method=RequestMethod.GET)
    public String appointment(Model model, @ModelAttribute("loginMember") Member loginMember,
                              HttpSession session, RedirectAttributes ra) {

    	model.addAttribute("css", "my");
        String path = "";

        if(session.getAttribute("loginMember") != null) {
            path = "my/appointment";
        } else {
            Util.swalSetMessage("로그인 후 이용해주시기 바랍니다.", null, "info", ra);

            path = "redirect:/";
        }
        return path;
    }

    // 상담 예약 조회
    @ResponseBody
    @RequestMapping(value="appointment", method=RequestMethod.POST)
    public String appointmentAjax(Model model, @ModelAttribute("loginMember") Member loginMember, Reservation reservation) {


        int memberNo = loginMember.getMemberNo();
        reservation.setMemberNo(memberNo);

        List<Reservation> reservationList = service.selectReservation(reservation);

        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

        return gson.toJson(reservationList);
    }

    // 상담 예약 취소
    @ResponseBody
    @RequestMapping(value="appointmentCancel", method=RequestMethod.POST)
    public int appointmentCancel(@ModelAttribute("loginMember") Member loginMember, Reservation reservation) {

        System.out.println(loginMember.getMemberNo());
        System.out.println(reservation.getReservationNo());

        reservation.setMemberNo(loginMember.getMemberNo());
        int result = service.appointmentCancel(reservation);


        return result;
    }



    @RequestMapping("appointment/past")
    public String appointmentPast(Model model, HttpSession session, RedirectAttributes ra,
    		@ModelAttribute("loginMember") Member loginMember) {
    	model.addAttribute("css", "my");

        String path = "";

        if(session.getAttribute("loginMember") != null) {
        	
        	List<Reservation> rList = service.appointmentPast(loginMember.getMemberNo());
        	
        	model.addAttribute("rList",rList);
        	
        	System.out.println(rList);
        	
            path = "my/appointmentPast";
        } else {
            Util.swalSetMessage("로그인 후 이용해주시기 바랍니다.", null, "info", ra);

            path = "redirect:/";
        }
        return path;
    }

    // 감정 기록 페이지
    @RequestMapping("emotionRecord")
    public String emotionRecord(Model model, HttpSession session) {
        List<EmotionCategory> emotionCategoryList = service.emotionCategory();

        // 감정 기록 등록일 list
        String emotionDiaryDate = "[]";

        String gsonData = "";
        if (session.getAttribute("loginMember")  != null) {
            int memberNo = ((Member)session.getAttribute("loginMember")).getMemberNo();

            // 감정 기록 등록일
            List<String> emotionDiaryDateList = service.selectEmotionDiaryDate(memberNo);
            emotionDiaryDate = new Gson().toJson(emotionDiaryDateList);

            // 오늘 등록된 감정 기록
            Map<String, String> map = new HashMap<String, String>();
            map.put("memberNo", memberNo +"");
            map.put("selectDate", todayFormat());
            EmotionDiary emotionRecordData = service.selectEmotionRecord(map);
            gsonData = new Gson().toJson(emotionRecordData);
        }

        model.addAttribute("emotionRecordData", gsonData);
        model.addAttribute("emotionDiaryDate", emotionDiaryDate);
        model.addAttribute("emotionCategoryList", emotionCategoryList);
        model.addAttribute("css", "my");

        return "my/emotionRecord";
    }

    // 감정 기록 select
    @RequestMapping(value="emotionRecordData", method=RequestMethod.POST)
    @ResponseBody
    public EmotionDiary emotionRecordData(String selectDate, HttpSession session, RedirectAttributes ra) {
        EmotionDiary emotionRecordData = null;
        if(session.getAttribute("loginMember") != null) {
            int memberNo = ((Member)session.getAttribute("loginMember")).getMemberNo();

            Map<String, String> map = new HashMap<String, String>();
            map.put("memberNo", memberNo +"");
            map.put("selectDate", selectDate);

            emotionRecordData = service.selectEmotionRecord(map);
        } else {
            Util.swalSetMessage("로그인이 필요합니다.", null, "info", ra);
        }

        return emotionRecordData;
    }


    // 감정기록 form
    @RequestMapping(value="emotionDiary", method= RequestMethod.GET)
    public String emotionDiary(Model model, HttpSession session, RedirectAttributes ra) {

        if (session.getAttribute("loginMember") != null) {
            List<EmotionCategory> emotionCategoryList = service.emotionCategory();

            int memberNo = ((Member)session.getAttribute("loginMember")).getMemberNo();

            // 오늘 등록된 감정 기록
            Map<String, String> map = new HashMap<String, String>();
            map.put("memberNo", memberNo +"");
            map.put("selectDate", todayFormat());
            EmotionDiary emotionRecordData = service.selectEmotionRecord(map);
            String gsonData = new Gson().toJson(emotionRecordData);

            model.addAttribute("emotionRecordData", gsonData);
            model.addAttribute("emotionCategoryList", emotionCategoryList);
            model.addAttribute("css", "my");

            return "my/emotionDiary";
        } else {
            Util.swalSetMessage("로그인이 필요합니다.", null, "info", ra);
            return "redirect:emotionRecord";
        }


    }

    // 감정기록 등록
    @RequestMapping(value="emotionDiary", method=RequestMethod.POST)
    public String emotionDiaryInsert(EmotionDiary emotionDiary, @ModelAttribute("loginMember") Member loginMember, HttpServletRequest req, HttpSession session, RedirectAttributes ra) {

        emotionDiary.setEmotionDate(todayFormat());

        if (session.getAttribute("loginMember") != null) {
            emotionDiary.setMemberNo(loginMember.getMemberNo());
            int result = service.insertEmotionDiary(emotionDiary);

            return "redirect:/my/emotionRecord";

        } else {
            Util.swalSetMessage("로그인이 필요합니다.", null, "info", ra);
            return null;
        }

    }

    private String todayFormat() {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date today = new Date(System.currentTimeMillis());
        return dateFormat.format(today);
    }
    
    // 리뷰 등록
    @ResponseBody
    @RequestMapping(value="reviewInsert", method=RequestMethod.POST)
    public int reviewInsert(@ModelAttribute("loginMember") Member loginMember,Review review) {
    	
    	// 전문가 번호 추가해야함
    	review.setMemberNo(loginMember.getMemberNo());

    	int result = service.reviewInsert(review);

    	return result;
    }



    @GetMapping("counselor")
    public String counselor(Model model, HttpSession session, RedirectAttributes ra, Board board,
                            @RequestParam(value="cp", required = false, defaultValue="1")int cp){
    	model.addAttribute("css", "my/counselor");

        int memberNo = 0;
        Pagination pagination = null;
        List<Board> counselorList = null;
        String path = "";

        if(session.getAttribute("loginMember") != null) {
            memberNo = ((Member)session.getAttribute("loginMember")).getMemberNo();

//            System.out.println(memberNo);
            pagination = service.getCounselorPagination(cp, memberNo);
            pagination.setMemberNo(memberNo);

            counselorList = service.selectCounselorList(pagination);

//            System.out.println(counselorList);

            model.addAttribute("pagination", pagination);
            model.addAttribute("counselorList", counselorList);
            path = "my/counselor";
        } else {
            Util.swalSetMessage("로그인 후 이용해주시기 바랍니다.", null, "info", ra);

            path = "redirect:/";
        }

        return path;
    }

    // 찜삭제
    @ResponseBody
    @RequestMapping(value = "deleteCounselor", method = RequestMethod.POST)
    public String deleteCounselor(Model model, HttpSession session, RedirectAttributes ra,Board board){

        String path = null;


        int result = service.deleteCounselor(board);
        System.out.println(result);

        if (result > 0) {
            Util.swalSetMessage("삭제 되었습니다.", null, "success", ra);

        } else {
            Util.swalSetMessage("삭제에 실패하셨습니다.", null, "error", ra);
        }

        return "my/counselor";
    }

    @GetMapping("enquiry")
    public String enquiry(Model model, HttpSession session, RedirectAttributes ra){
    	model.addAttribute("css", "my/enquiry");

        String path = "";

        if(session.getAttribute("loginMember") != null) {
            path = "my/enquiry";
        } else {
            Util.swalSetMessage("로그인 후 이용해주시기 바랍니다.", null, "info", ra);

            path = "redirect:/";
        }
        
        return path;
    }

    @GetMapping("letterList")
    public String letterList(Model model, HttpSession session, RedirectAttributes ra){
    	model.addAttribute("css", "my/letterList");

        String path = "";

        if(session.getAttribute("loginMember") != null) {
            path = "my/letterList";
        } else {
            Util.swalSetMessage("로그인 후 이용해주시기 바랍니다.", null, "info", ra);

            path = "redirect:/";
        }



        return path;
    }

    @GetMapping("map")
    public String map(Model model, HttpSession session, RedirectAttributes ra){
        model.addAttribute("css", "my/map");

        String path = "";

        if(session.getAttribute("loginMember") != null) {
            path = "my/map";
        } else {
            Util.swalSetMessage("로그인 후 이용해주시기 바랍니다.", null, "info", ra);

            path = "redirect:/";
        }

        return path;
    }

    @GetMapping("muteMember")
    public String muteMember(Model model, @ModelAttribute("loginMember") Member loginMember,
                             HttpSession session, RedirectAttributes ra){
        model.addAttribute("css", "my/muteMember");
//        model.addAttribute("header", "main");
        String path = "";

        if(session.getAttribute("loginMember") != null) {

            List<Mute> mList = service.selectMuteMember(loginMember.getMemberNo());

            model.addAttribute("mList", mList);
            path = "my/muteMember";
        } else {
            Util.swalSetMessage("로그인 후 이용해주시기 바랍니다.", null, "info", ra);

            path = "redirect:/";
        }

        return path;
    }

    @GetMapping("clearMember")
    @ResponseBody
    public int clearMember(@ModelAttribute("loginMember") Member loginMember,
                              @RequestParam(value = "muteNo", required = false) int muteNo){

        Mute mute = new Mute();
        mute.setMemberNo(loginMember.getMemberNo());
        mute.setMuteNo(muteNo);

        int result = service.clearMember(mute);

        return result;
    }

    @GetMapping("myBoardList")
    public String myBoardList(Model model, HttpSession session, RedirectAttributes ra){
        model.addAttribute("css", "my/myBoardList");

        String path = "";

        if(session.getAttribute("loginMember") != null) {

            path = "my/myBoardList";
        } else {
            Util.swalSetMessage("로그인 후 이용해주시기 바랍니다.", null, "info", ra);

            path = "redirect:/";
        }

        return path;
    }

    @GetMapping("postscript")
    public String postscript(Model model, HttpSession session, RedirectAttributes ra){
        model.addAttribute("css", "my/postscript");

        String path = "";

        if(session.getAttribute("loginMember") != null) {

            path = "my/postscript";
        } else {
            Util.swalSetMessage("로그인 후 이용해주시기 바랍니다.", null, "info", ra);

            path = "redirect:/";
        }
        return path;
    }

    @GetMapping("secession")
    public String secession(Model model, HttpSession session, RedirectAttributes ra){
        model.addAttribute("css", "my/secession");

        String path = "";

        if(session.getAttribute("loginMember") != null) {


            Naver naver = ((Naver)session.getAttribute("naver"));
            model.addAttribute("naver", naver);

            path = "my/secession";
        } else {
            Util.swalSetMessage("로그인 후 이용해주시기 바랍니다.", null, "info", ra);

            path = "redirect:/";
        }

        return path;
    }

    @PostMapping("secessionMember")
    public String secessionMember(Model model, @ModelAttribute("loginMember") Member loginMember,
                                  HttpSession session, RedirectAttributes ra, SessionStatus status,
                                  @RequestParam(value = "memberPw", required = false) String memberPw){

        Naver naver = ((Naver)session.getAttribute("naver"));

        int result = service.secessionMember(naver, loginMember);

        if(result > 0) {
            Util.swalSetMessage("회원 탈퇴 성공", null, "success", ra);
            status.setComplete();
        }else {
            Util.swalSetMessage("회원 탈퇴 실패", null, "info", ra);
        }

        return "redirect:/";
    }

    @GetMapping("updateMyInfo")
    public String updateMyInfo(Model model, HttpSession session, RedirectAttributes ra,
                               @ModelAttribute("loginMember") Member loginMember){
        Naver naver = ((Naver)session.getAttribute("naver"));

        String path = null;
        Image image = null;

        if(session.getAttribute("loginMember") != null) {
            if(naver == null){
                image = service.getMyImage(loginMember.getMemberNo());
                path = "my/updateMyInfo";
            }else{
                Util.swalSetMessage("소셜로그인 회원은 정보수정이 불가능합니다.", null, "info", ra);
                path = "redirect:/";
            }
        } else {
            Util.swalSetMessage("로그인 후 이용해주시기 바랍니다.", null, "info", ra);

            path = "redirect:/";
        }



        model.addAttribute("memberImage", image);
        return path;
    }

    @PostMapping("updateMyInfoo")
    public String updateMyInfo(Member member, Model model,
                               Image image,
                               @ModelAttribute("loginMember") Member loginMember,
                               HttpSession session, RedirectAttributes ra,
                               @RequestParam Map<String, String> param,
                               @RequestParam(value = "images", required = false) MultipartFile images){

        // 1) 로그인 회원 번호를 image에 세팅
        image.setMemberNo(loginMember.getMemberNo());

        member.setMemberPw(param.get("memberPw"));
        if(param.get("memberFName").equals(loginMember.getMemberFName())){
            member.setMemberFName(param.get("mobile_memberFName"));
        }else if(param.get("mobile_memberFName").equals(loginMember.getMemberFName())){
            member.setMemberFName(param.get("memberFName"));
        }
        member.setMemberNo(loginMember.getMemberNo());

        // 2) 웹 접근 경로, 서버 저장 경로
        String webPath = "/resources/images/my/";
        String serverPath = session.getServletContext().getRealPath(webPath);
        System.out.println("serverPath : " + serverPath);

        int result = service.updateMyForm(member, image, images, webPath, serverPath);

        String path = null;

        if(result > 0){
            path = "redirect:/";
            Util.swalSetMessage("회원 정보 수정 성공!", null, "success", ra);

            loginMember.setMemberFName(member.getMemberFName());
            loginMember.setImagePath(image.getImagePath());
            loginMember.setImageName(image.getImageName());
            
            model.addAttribute("loginMember", loginMember);
        }else{

            path = "redirect:/";
            Util.swalSetMessage("회원 정보 수정 실패!", null, "error", ra);
        }

        return path;
    }

    @GetMapping("loadProMap")
    @ResponseBody
    public String loadProMap(@RequestParam Map<String, Integer> param){

        Map<String, Object> map = new HashMap<>();

        map.put("first", param.get("first"));
        map.put("last", param.get("last"));

        List<ProfessionHospital> proList = service.loadProMap(map);

        int result = 0;
        // pList 결과가 비어있지 않으면 총 count를 가져옵니다.
        if(!proList.isEmpty())
            result = service.loadProMapCount();

        ProfessionHospital p = new ProfessionHospital();
        p.setMaxValue(result);
        proList.add(p);

        return new Gson().toJson(proList);
    }






	/*
	 * // @ExceptionHandler(처리할 예외.class)
	 * 
	 * @ExceptionHandler(Exception.class) public String exceptionHandler(Exception
	 * e, Model model) {
	 * 
	 * // Model : 데이터 전달용 객체 (Map형식, request범위) model.addAttribute("errorMessage",
	 * "회원 관련 서비스 이용중 문제가 발생했습니다."); model.addAttribute("e", e);
	 * 
	 * return "common/error"; }
	 */

}
