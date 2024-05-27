package edu.kh.mind.board.model.service;

import java.util.List;

import edu.kh.mind.board.model.vo.Reply;

public interface ReplyService {

	/** 댓글 목록 조회
	 * @param boardNo
	 * @return rList
	 */
	List<Reply> selectList(int boardNo);

	int insertReply(Reply reply);

	int updateReply(Reply reply);

	int deleteReply(int replyNo);

}
