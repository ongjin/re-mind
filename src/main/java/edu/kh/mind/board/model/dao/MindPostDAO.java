package edu.kh.mind.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mind.board.model.vo.MindPost;
import edu.kh.mind.board.model.vo.Pagination;

@Repository
public class MindPostDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	/** 포스트 삽입
	 * @param post
	 * @return postNo
	 */
	public int insertPost(MindPost post) {
		
		int result = sqlSession.insert("board2Mapper.insertPost", post);
		
		if(result > 0) return post.getPostNo();
		else           return 0;
		
	}


	/** 전체 포스트 수 count
	 * @return listCount
	 */
	public int getListCount() {
		return sqlSession.selectOne("board2Mapper.getListCount");
	}


	/** 지정된 범위의 포스트 목록 조회
	 * @param pagination
	 * @return postList
	 */
	public List<MindPost> selectPostList(Pagination pagination) {
		
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		int limit = pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("board2Mapper.selectPostList", null, rowBounds);
	}


	/** 포스트 삭제
	 * @param postNo
	 * @return result
	 */
	public int deletePost(int postNo) {
		return sqlSession.update("board2Mapper.deletePost", postNo);
	}


	/** 포스트 좌표 저장
	 * @param left
	 * @param top
	 * @param postNo
	 * @return result
	 */
	public int updatePost(MindPost post) {
		return sqlSession.update("board2Mapper.updatePost", post );
	}


	/*public MindPost selectPost(int postNo) {
		return sqlSession.selectOne("board2Mapper.selectPost", postNo);
	}*/

}
