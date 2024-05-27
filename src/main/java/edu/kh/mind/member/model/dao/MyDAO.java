package edu.kh.mind.member.model.dao;

import edu.kh.mind.board.model.vo.*;

import edu.kh.mind.member.model.vo.EmotionCategory;
import edu.kh.mind.member.model.vo.EmotionDiary;
import edu.kh.mind.member.model.vo.ProfessionHospital;
import edu.kh.mind.member.model.vo.Review;

import edu.kh.mind.member.model.vo.*;
import edu.kh.mind.member.social.naver.vo.Naver;

import edu.kh.mind.pro.model.vo.Reservation;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class MyDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    public List<ProfessionHospital> loadProMap(Map<String, Object> map) {
        return sqlSession.selectList("professionMapper.loadProMap", map);
    }

	public List<EmotionCategory> emotionCategory() {
		return sqlSession.selectList("emotionMapper.emotionCategory");
	}

	/**
	 * 감정 기록 등록
	 * @param emotionDiary
	 * @return result
	 */
	public int insertEmotionDiary(EmotionDiary emotionDiary) {
		return sqlSession.insert("emotionMapper.insertEmotionDiary", emotionDiary);
	}

	/**
	 * 감정 기록 select
	 * @param map
	 * @return result
	 */
	public EmotionDiary selectEmotionRecord(Map<String, String> map) {
		return sqlSession.selectOne("emotionMapper.selectEmotionRecord", map);
	}

	/**
	 * 감정 기록 등록일 list
	 * @param memberNo
	 * @return list
	 */
    public List<String> selectEmotionDiaryDate(int memberNo) {
		return sqlSession.selectList("emotionMapper.selectEmotionDiaryDate", memberNo);
    }

	/**
	 * 감정 기록 update
	 * @param emotionDiary
	 * @return result
	 */
	public int updateEmotionDiary(EmotionDiary emotionDiary) {
		return sqlSession.update("emotionMapper.updateEmotionDiary", emotionDiary);
	}

	// 내 게시글 보기
    public List<Board> myBoardList(Map<String, Integer> map) {
		return sqlSession.selectList("boardMapper.myBoardList", map);
	}


	// 내 댓글 보기
    public List<Reply> selectMyReplyList(Map<String, Integer> map) {
//		System.out.println(memberNo); 담김
		return sqlSession.selectList("replyMapper.selectMyReplyList", map);
    }


    // 후기 등록
	public int reviewInsert(Review review) {
		return sqlSession.insert("reviewMapper.reviewInsert", review);
	}

	public List<Mute> selectMuteMember(int memberNo) {
		return sqlSession.selectList("memberMapper.selectMuteMember", memberNo);
	}

	public int clearMember(Mute mute) {
		return sqlSession.delete("memberMapper.clearMember", mute);
	}

	public int deleteToken(Naver naver) {
		return sqlSession.delete("memberMapper.deleteToken", naver);
	}

	public int deleteSocial(Member loginMember) {
		return sqlSession.update("memberMapper.deleteSocial", loginMember);
	}

	public int secessionMember(Member loginMember) {
		return sqlSession.update("memberMapper.secessionMember", loginMember);

	}


	public List<Scrap> myScrapList(Map<String, Integer> map) {
		return sqlSession.selectList("boardMapper.myScrapList", map);
	}

	public int countBoardList(Map<String, Integer> map) {
		return sqlSession.selectOne("boardMapper.countBoardList", map);
	}

	public int countReplyList(Map<String, Integer> map) {
		return sqlSession.selectOne("replyMapper.countReplyList", map);
	}

	public int countScrapList(Map<String, Integer> map) {
		return sqlSession.selectOne("boardMapper.countScrapList", map);
	}

	/**
	 * 상담 예약 조회
	 * @param reservation
	 * @return reservationList
	 */
	public List<Reservation> selectReservation(Reservation reservation) {
		return sqlSession.selectList("memberMapper.selectReservation", reservation);
	}

	/**
	 * 상담 예약 취소
	 * @param reservation
	 * @return result
	 */
	public int appointmentDecrease(Reservation reservation) {
		return sqlSession.update("memberMapper.appointmentDecrease", reservation);
	}

	/**
	 * 상담 예약 취소
	 * @param reservation
	 * @return result
	 */
	public int appointmentCancel(Reservation reservation) {
		return sqlSession.update("memberMapper.appointmentCancel", reservation);
	}

	// 내가 공감한 게시글(수)
	public int countEmpathyList(Map<String, Integer> map) {
		return sqlSession.selectOne("boardMapper.countEmpathyList", map);
	}

	// 내가 공감한 게시글
	public List<Board> myEmpathyList(Map<String, Integer> map) {
//		System.out.println(map.get("memberNo"));
		return sqlSession.selectList("boardMapper.myEmpathyList",map);
	}

	public Image getMyImage(int memberNo) {
		return sqlSession.selectOne("boardMapper.getMyImage", memberNo);
	}
	public int selectProfile(Image image) {
		return sqlSession.selectOne("boardMapper.selectProfile", image);
	}

	public int updateImage(Image image) {
		return sqlSession.update("boardMapper.updateImage", image);
	}

	public int insertImage(Image image) {
		return sqlSession.insert("boardMapper.insertImage", image);
	}

	// 내 찜 사 페이징
	public int getCounselorPagination(int memberNo) {
//		System.out.println(memberNo);
		return sqlSession.selectOne("boardMapper.getCounselorListCount", memberNo);
	}

	// 내가 찜한 상담사 목록
	public List<Board> selectCounselorList(Pagination pagination) {
		int offset = (pagination.getCurrentPage() -1) * pagination.getLimit();
		int limit = pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList("boardMapper.selectCounselorList", pagination, rowBounds);
	}

	public String selectPw(Member member) {
		return sqlSession.selectOne("memberMapper.selectPw", member);
	}

	public int updateMemberFName(Member member) {
		return sqlSession.update("memberMapper.updateMemberFName", member);
	}

    public int deleteCounselor(Board board) {
		return sqlSession.delete("boardMapper.deleteCounselor",board);
    }

	public List<Letter> myLetterList(int memberNo) {
		return sqlSession.selectList("boardMapper.myLetterList", memberNo);
	}

	public List<Reservation> appointmentPast(int memberNo) {

		return sqlSession.selectList("reservationMapper.appointmentPast", memberNo);
	}

	public int loadProMapCount() {
		return sqlSession.selectOne("professionMapper.loadProMapCount");
	}
}
