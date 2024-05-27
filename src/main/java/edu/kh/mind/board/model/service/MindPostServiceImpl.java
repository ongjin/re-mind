package edu.kh.mind.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.mind.board.model.dao.BoardDAO;
import edu.kh.mind.board.model.dao.MindPostDAO;
import edu.kh.mind.board.model.vo.MindPost;
import edu.kh.mind.board.model.vo.Pagination;
import edu.kh.mind.common.util.Util;

/**
 * @author 82105
 *
 */
@Service
public class MindPostServiceImpl implements MindPostService{

	@Autowired
	private MindPostDAO dao;

	
	// 포스트 삽입
	@Transactional
	@Override
	public int insertPost(MindPost post) {
		
		post.setPostContent( Util.XSS(post.getPostContent()));
		post.setPostContent( Util.changeNewLine( post.getPostContent()));
		
		int postNo = dao.insertPost(post);
		
		return postNo;
	}


	// 전체 포스트 수 count + 페이징 처리에 필요한 값 계산
	@Override
	public Pagination getPagination(int cp) {
		
		// 전체 포스트 수 
		int listCount = dao.getListCount();
		
		// 페이징처리에 필요한 값 계산
		return new Pagination(listCount, cp);
		
	}

	// 지정된 범위의 게시글 목록 조회
	@Override
	public List<MindPost> selectPostList(Pagination pagination) {
		return dao.selectPostList(pagination);
	}


	// 포스트 삭제
	@Override
	public int deletePost(int postNo) {
		return dao.deletePost(postNo);
	}


	// 포스트 좌표 저장
	@Override
	@Transactional
	public int updatePost(MindPost post) {
		return dao.updatePost(post);
	}


	
	
	
	
	/*@Override
	public MindPost selectPost(int postNo, int memberNo) {
		MindPost post = dao.selectPost(postNo);
		
		return post;
	}*/
	
	
	
	
}
