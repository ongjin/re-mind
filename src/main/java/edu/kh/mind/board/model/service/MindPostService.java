package edu.kh.mind.board.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.kh.mind.board.model.vo.MindPost;
import edu.kh.mind.board.model.vo.Pagination;

public interface MindPostService {

	
	
	/** 포스트 등록 
	 * @param post
	 * @return postNo
	 */
	int insertPost(MindPost post);

	
	/** 전체 포스트 수 count + 페이징 처리에 필요한 값 계산 
	 * @param cp
	 * @return pagination
	 */
	Pagination getPagination(int cp);


	/** 지정된 범위의 포스트 목록 조회 
	 * @param pagination
	 * @return postList
	 */
	List<MindPost> selectPostList(Pagination pagination);


	/** 포스트 삭제
	 * @param postNo
	 * @return result
	 */
	int deletePost(int postNo);


	/** 포스트 좌표 저장
	 * @param post
	 * @return result
	 */
	int updatePost(MindPost post);


	/** 포스트 상세 조회
	 * @param postNo
	 * @param memberNo
	 * @return post
	 */
	/*MindPost selectPost(int postNo, int memberNo);*/

}
