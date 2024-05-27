package edu.kh.mind.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.mind.notice.model.service.NoticeService;
import edu.kh.mind.notice.model.vo.Notice;

@Controller
@RequestMapping("/notice/*")
@SessionAttributes({"loginMember"})
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	@RequestMapping("list")

	public String noticeList(Model model) {

		String type = "";
		List<Notice> noticeList = service.noticeList(type);
		
		model.addAttribute("css", "notice/noticeList");
		model.addAttribute("noticeList", noticeList);
		
		return "notice/noticeList";
	}
	
	
	@RequestMapping("view/{noticeNo}")
	public String selectNotice(Model model, @PathVariable("noticeNo") int noticeNo) {
		
		Notice notice = service.selectNotice(noticeNo);
		
		model.addAttribute("css", "notice/noticeView");
		model.addAttribute("notice", notice);
		
		return "notice/noticeView";
	}

}
