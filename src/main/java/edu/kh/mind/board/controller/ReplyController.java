package edu.kh.mind.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import edu.kh.mind.board.model.service.ReplyService;
import edu.kh.mind.board.model.vo.Reply;
import edu.kh.mind.member.model.vo.Member;


@RestController
@RequestMapping("/reply/*")
@SessionAttributes({"loginMember"})
public class ReplyController {
	
	@Autowired
	private ReplyService service;
	
	
	// 댓글 목록 조회
	@RequestMapping(value="select", method=RequestMethod.GET)
	public String selectList(int boardNo, @ModelAttribute("loginMember") Member loginMember, Model model) {
								// ajax코드 -> data 속성에 작성된 key값
		
		List<Reply> rList = service.selectList(boardNo);
		
		
		// 조회된 rList를 JSON 형식으로 변경
		// -> 직접 변경, JSONSimple 라이브러리, GSON 라이브러리(당첨)
		
		// Gson.toJson(object) : object를 JSON형태로 변환
		return new Gson().toJson(rList);
	}
	
	// 댓글 삽입 
		@RequestMapping(value="insert", method=RequestMethod.POST)
		public int insertReply(Reply reply/*커맨드 객체*/, @ModelAttribute("loginMember") Member loginMember) {
			
			reply.setMemberNo(loginMember.getMemberNo());
			
			return service.insertReply(reply);
		}
		
		
		// 댓글 수정 
		@RequestMapping(value="update", method=RequestMethod.POST)
		public int updateReply(Reply reply/*커맨드 객체*/) {
								//replyNo, replyContent
			return service.updateReply(reply);
		}
		
		
		
		// 댓글 삭제 
		@RequestMapping(value="delete", method=RequestMethod.POST)
		public int deleteReply(int replyNo) {
			return service.deleteReply(replyNo);
		}
	
	

}
