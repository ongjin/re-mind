package edu.kh.mind.board.model.dao;

import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.Empathy;
import edu.kh.mind.board.model.vo.Image;
import edu.kh.mind.board.model.vo.WorryCategory;
import edu.kh.mind.member.model.vo.Member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class WorryDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 고민상담 게시글
	 * @return list
	 */
	public List<Board> selectWorryList(Map<String, String> map) {
		return sqlSession.selectList("boardMapper.selectWorryList", map);
	}

	/**
	 * 고민상담 카테고리
	 * @return list
	 */
	public List<WorryCategory> selectWorryCategory() {
		return sqlSession.selectList("worryMapper.selectWorryCategory");
	}

	/**
	 * 고민상담 게시글 작성
	 * @param board
	 * @return result
	 */
	public int insertWorryBoard(Board board) {
		int result = sqlSession.insert("boardMapper.insertWorryBoard", board);

		int boardNo=0;
		if (result > 0) {
			boardNo =  board.getBoardNo();
		}

		return boardNo;
	}

	/**
	 * 고민상담 게시글 이미지 등록
	 * @param image
	 * @return result
	 */
	public int insertImgList(Image image) {
		return sqlSession.insert("boardMapper.insertImgList", image);
	}


	/** 회원 차단
	 * @param map
	 * @return result
	 */
	public int memberBlock(HashMap<String, Integer> map) {
		return sqlSession.insert("secretMapper.memberBlock", map);
	}

	

	/**
	 * 고민상담 상세
	 * @param map
	 * @return result
	 */
	public Board selectWorryBoard(Map<String, Integer> map) {
		return sqlSession.selectOne("boardMapper.selectWorryBoard", map);
	}

	public int increaseReadCount(int boardNo) {
		return sqlSession.update("boardMapper.increaseReadCount",boardNo);
	}

	public Empathy selectEmpathy(Empathy empathy) {
		return sqlSession.selectOne("secretMapper.selectEmpathy",empathy);
	}


	public int insertEmpathy(Empathy empathy) {
		return sqlSession.insert("secretMapper.insertEmpathy",empathy);
	}


	public int deleteEmpathy(Empathy empathy) {
		return sqlSession.delete("secretMapper.deleteEmpathy",empathy);
	}


	public int countEmpathy(Empathy empathy) {
		return sqlSession.selectOne("boardMapper.selectEmpathyList", empathy);
	}

	public int updateWorryBoard(Board board) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.updateBoard",board);
	}

	public int worryDelete(Board board) {
		// TODO Auto-generated method stub
		return sqlSession.delete("boardMapper.deleteBoard",board);
	}

//	public WorryCategory seletedCategory(int boardNo) {
//		// TODO Auto-generated method stub
//		return sqlSession.selectOne("boardMapper.selectedCategory", sqlSession);
//	}
	
	
}
