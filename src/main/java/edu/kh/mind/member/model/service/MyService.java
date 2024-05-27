package edu.kh.mind.member.model.service;

import edu.kh.mind.board.model.vo.*;

import edu.kh.mind.member.model.vo.EmotionCategory;
import edu.kh.mind.member.model.vo.EmotionDiary;
import edu.kh.mind.member.model.vo.Member;
import edu.kh.mind.member.model.vo.Mute;
import edu.kh.mind.member.model.vo.ProfessionHospital;
import edu.kh.mind.member.model.vo.Review;

import edu.kh.mind.member.social.naver.vo.Naver;
import edu.kh.mind.pro.model.vo.Reservation;
import org.springframework.web.multipart.MultipartFile;


import java.util.List;
import java.util.Map;


public interface MyService {

    List<ProfessionHospital> loadProMap(Map<String, Object> map);

	/**
	 * 스트레스 증상 목록
	 * @return emotionCategoryList
	 */
	List<EmotionCategory> emotionCategory();


	/**
	 * 감정 기록 등록
	 * @param emotionDiary
	 * @return result
	 */
	int insertEmotionDiary(EmotionDiary emotionDiary);

	/**
	 * 감정 기록 select
	 * @param map
	 * @return result
	 */
	EmotionDiary selectEmotionRecord(Map<String, String> map);

	/**
	 * 감정 기록 등록일 list
	 * @param memberNo
	 * @return list
	 */
	List<String> selectEmotionDiaryDate(int memberNo);


	// 내가 쓴글 조회
	List<Board> myBoardList(Map<String, Integer> map);


	// 내가 쓴 댓글 조회
    List<Reply> selectMyReplyList(Map<String, Integer> map);

    
    // 후기 등록
	int reviewInsert(Review review);


	List<Mute> selectMuteMember(int memberNo);

	int clearMember(Mute mute);


	int secessionMember(Naver naver, Member loginMember);

	List<Scrap> myScrapList(Map<String, Integer> map);

	int countBoardList(Map<String, Integer> map);

	int countReplyList(Map<String, Integer> map);

	int countScrapList(Map<String, Integer> map);

	/**
	 * 상담 예약 조회
	 * @param reservation
	 * @return reservationList
	 */
	List<Reservation> selectReservation(Reservation reservation);

	/**
	 * 상담 예약 취소
	 * @param reservation
	 * @return result
	 */
	int appointmentCancel(Reservation reservation);

	// 내가 공감한 게시글(수)
	int countEmpathyList(Map<String, Integer> map);

	// 내가 공감한 게시글
	List<Board> myEmpathyList(Map<String, Integer> map);

	Image getMyImage(int memberNo);
  
	int updateMyForm(Member member, Image image, MultipartFile images, String webPath, String serverPath);

	// 내 찜 사 페이징
	Pagination getCounselorPagination(int cp, int memberNo);

	// 내가 찜한 상담사 목록
	List<Board> selectCounselorList(Pagination pagination);

	// 쪽지 리스트 조회
	List<Letter> myLetterList(int memberNo);

    int deleteCounselor(Board board);

	List<Reservation> appointmentPast(int memberNo);

	int loadProMapCount();
}
