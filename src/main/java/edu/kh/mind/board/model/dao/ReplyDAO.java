package edu.kh.mind.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mind.board.model.vo.Image;
import edu.kh.mind.board.model.vo.Reply;


@Repository
public class ReplyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/** 댓글 목록 조회
	 * @param boardNo
	 * @return rList
	 */
	public List<Reply> selectList(int boardNo) {
		
		
		return sqlSession.selectList("replyMapper.selectList", boardNo);
	}


	public int insertReply(Reply reply) {
		// TODO Auto-generated method stub
		return sqlSession.insert("replyMapper.insertReply",reply);
	}


	public int updateReply(Reply reply) {
		// TODO Auto-generated method stub
		return sqlSession.update("replyMapper.updateReply",reply);
	}


	public int deleteReply(int replyNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("replyMapper.deleteReply",replyNo);
	}


	public Reply selectReplyPic(int replyNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("replyMapper.selectReplyPic",replyNo);
	}
}
