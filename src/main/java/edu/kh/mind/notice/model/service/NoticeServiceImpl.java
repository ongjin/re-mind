package edu.kh.mind.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import edu.kh.mind.notice.model.dao.NoticeDAO;
import edu.kh.mind.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO dao;

	@Override
	public List<Notice> noticeList(String type) {
		return dao.noticeList(type);
	}

	@Override
	public Notice selectNotice(int noticeNo) {
		return dao.selectNotice(noticeNo);
	}
	
	
}
