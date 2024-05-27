package edu.kh.mind.member.model.service;

import edu.kh.mind.board.model.vo.*;
import edu.kh.mind.common.util.Util;
import edu.kh.mind.member.model.dao.MyDAO;

import edu.kh.mind.member.model.vo.EmotionCategory;
import edu.kh.mind.member.model.vo.EmotionDiary;
import edu.kh.mind.member.model.vo.Member;
import edu.kh.mind.member.model.vo.Mute;
import edu.kh.mind.member.model.vo.ProfessionHospital;
import edu.kh.mind.member.model.vo.Review;


import edu.kh.mind.member.social.naver.vo.Naver;

import edu.kh.mind.pro.model.vo.Reservation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MyServiceImpl implements MyService {

    @Autowired
    private MyDAO dao;

    @Autowired
    private BCryptPasswordEncoder encoder;

    @Override
    public int secessionMember(Naver naver, Member loginMember) {

        int result = 0;

        if(naver.getMemberSocialToken() != null){

            result = dao.deleteToken(naver);

            if(result > 0)  result = dao.deleteSocial(loginMember);
        }else{

            result = dao.secessionMember(loginMember);
        }

        return result;
    }

    @Override
    public int clearMember(Mute mute) {
        return dao.clearMember(mute);
    }

    @Override
    public List<Mute> selectMuteMember(int memberNo) {
        return dao.selectMuteMember(memberNo);
    }

    @Override
    public List<ProfessionHospital> loadProMap(Map<String, Object> map) {
        return dao.loadProMap(map);
    }

    @Override
    public List<EmotionCategory> emotionCategory() {
        return dao.emotionCategory();
    }

    @Override
    public int loadProMapCount() {
        return dao.loadProMapCount();
    }

    // 감정 기록 등록
    @Override
    public int insertEmotionDiary(EmotionDiary emotionDiary) {

        emotionDiary.setEmotionContent(Util.XSS(emotionDiary.getEmotionContent()));
        emotionDiary.setEmotionContent(Util.changeNewLine(emotionDiary.getEmotionContent()));

        Map<String, String> map = new HashMap<>();
        map.put("memberNo", emotionDiary.getMemberNo()+"");
        map.put("selectDate", emotionDiary.getEmotionDate());
        EmotionDiary emotionRecord = dao.selectEmotionRecord(map);
        if (emotionRecord == null) {
            return dao.insertEmotionDiary(emotionDiary);
        } else {
            emotionDiary.setEmotionNo(emotionRecord.getEmotionNo());
            System.out.println(emotionDiary);
            return dao.updateEmotionDiary(emotionDiary);
        }

    }

    // 감정 기록 select
    @Override
    public EmotionDiary selectEmotionRecord(Map<String, String> map) {
        return dao.selectEmotionRecord(map);
    }

    // 감정 기록 등록일 list
    @Override
    public  List<String> selectEmotionDiaryDate(int memberNo) {
        return dao.selectEmotionDiaryDate(memberNo);
    }


    // 내 게시글 조회
    @Override
    public List<Board> myBoardList(Map<String, Integer> map) {
        return dao.myBoardList(map);
    }

    @Override
    public int countBoardList(Map<String, Integer> map) {
        return dao.countBoardList(map);
    }

    @Override
    public int updateMyForm(Member member, Image image, MultipartFile images, String webPath, String serverPath) {

        int result = 0;

        String memberPw = dao.selectPw(member);
        System.out.println("memberPw : " + memberPw);

        if(encoder.matches(member.getMemberPw(), memberPw)){// 비밀번호 일치 하면

            // 닉네임 변경
            result = dao.updateMemberFName(member);

            System.out.println("result : " + result);
            
            if(images.getOriginalFilename() != null && !images.getOriginalFilename().equals("")) {
                image.setImagePath(webPath);
                image.setImageOriginal(images.getOriginalFilename());
                image.setImageName(Util.fileRename(image.getImageOriginal()));
                image.setImageLevel(0);

                // 프로필 이미지가 이미 있는지 체크 count
                result = dao.selectProfile(image);
                if(result > 0) {//업데이트
                    if(!images.isEmpty())   result = dao.updateImage(image);

                    File saveFile = new File(serverPath, image.getImageName());
                    try {
                        images.transferTo(saveFile);
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                }else{// 인설트
                    if(!images.isEmpty())   result = dao.insertImage(image);
                    File saveFile = new File(serverPath, image.getImageName());
                    try {
                        images.transferTo(saveFile);
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                }
            }
        }else{
            result = 0;
        }


        return result;
    }

    @Override
    public Image getMyImage(int memberNo) {
        return dao.getMyImage(memberNo);
    }

    @Override
    public int countScrapList(Map<String, Integer> map) {
        return dao.countScrapList(map);
    }

    @Override
    public List<Scrap> myScrapList(Map<String, Integer> map) {
        return dao.myScrapList(map);
    }

    @Override
    public int countReplyList(Map<String, Integer> map) {
        return dao.countReplyList(map);
    }

    // 내 댓글 조회
    @Override
    public List<Reply> selectMyReplyList(Map<String, Integer> map) {
        return dao.selectMyReplyList(map);
    }

    // 후기 등록
    @Transactional
	@Override
	public int reviewInsert(Review review) {
		
		review.setReviewContent(Util.XSS(review.getReviewContent()));
		review.setReviewContent(Util.changeNewLine(review.getReviewContent()));
		
		return dao.reviewInsert(review);
	}

    // 상담 예약 조회
    @Override
    public List<Reservation> selectReservation(Reservation reservation) {
        return dao.selectReservation(reservation);
    }

    // 내가 공감한 게시글(수)
    @Override
    public int countEmpathyList(Map<String, Integer> map) {
        return dao.countEmpathyList(map);
    }

    // 내가 공감한 게시글
    @Override
    public List<Board> myEmpathyList(Map<String, Integer> map) {
        return dao.myEmpathyList(map);
    }

    // 내 찜 사 페이징 처리
    @Transactional
    @Override
    public Pagination getCounselorPagination(int cp, int memberNo) {
        int listCount = dao.getCounselorPagination(memberNo);
        return new Pagination(listCount, cp);
    }

    // 내 찜 사
    @Override
    public List<Board> selectCounselorList(Pagination pagination) {
        return dao.selectCounselorList(pagination);
    }

    @Override
    public int deleteCounselor(Board board) {
        return dao.deleteCounselor(board);
    }

    // 상담 예약 취소
    @Override
    public int appointmentCancel(Reservation reservation) {

        // 상담 예약 사용 횟수 감소
        int result = dao.appointmentDecrease(reservation);

        if (result > 0) {
            // 상담 예약 취소
            result = dao.appointmentCancel(reservation);
        }

        return result;
    }

    // 쪽지 리스트
    @Override
    public List<Letter> myLetterList(int memberNo) {
        return dao.myLetterList(memberNo);
    }
    
    @Override
    public List<Reservation> appointmentPast(int memberNo) {
    	return dao.appointmentPast(memberNo);
    }
}
