package edu.kh.mind.notice.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mind.notice.model.vo.Notice;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public List<Notice> noticeList(String type) {
		return sqlSession.selectList("noticeMapper.noticeList", type);
	}


	public Notice selectNotice(int noticeNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice", noticeNo);
	}

}
