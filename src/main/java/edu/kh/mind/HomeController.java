package edu.kh.mind;

import edu.kh.mind.board.model.service.BoardService;
import edu.kh.mind.notice.model.service.NoticeService;
import edu.kh.mind.notice.model.vo.Notice;
import edu.kh.mind.pro.model.service.ProService;
import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.member.model.vo.Profession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private BoardService boardService;

	@Autowired
	private ProService proService;

	@Autowired
	private NoticeService noticeService;


	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {

		// 커뮤니티
		List<Board> listBoard = boardService.selectMainBoardList();

		// 상담사 랜덤
		List<Profession> profession = proService.selectProRandom();

		// 공지사항
		List<Notice> noticeList = noticeService.noticeList("main");


		model.addAttribute("listBoard", listBoard);
		model.addAttribute("profession", profession);
		model.addAttribute("noticeList", noticeList);

		model.addAttribute("header", "main");
		model.addAttribute("css", "main");

		return "common/main";

	}
	
}
