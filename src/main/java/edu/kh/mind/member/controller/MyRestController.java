package edu.kh.mind.member.controller;

import com.google.gson.Gson;
import edu.kh.mind.board.model.vo.*;
import edu.kh.mind.common.util.Util;
import edu.kh.mind.member.model.service.MyService;
import edu.kh.mind.member.model.vo.Member;
import edu.kh.mind.member.model.vo.Profession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/my/*")
public class MyRestController {

    @Autowired
    MyService service;

    @PostMapping("myReplyList")
    public String selectMyReplyList(@RequestParam(value = "memberNo", required = false) int memberNo,
                                    @RequestParam(value = "first", required = false) int first,
                                    @RequestParam(value = "last", required = false) int last){

        Map<String, Integer> map = new HashMap<>();

        map.put("memberNo", memberNo);
        map.put("first", first);
        map.put("last", last);

        List<Reply> selectMyReplyList = service.selectMyReplyList(map);

        Reply reply = new Reply();
        reply.setMaxValue(service.countReplyList(map));

        selectMyReplyList.add(reply);

        return new Gson().toJson(selectMyReplyList);
    }

    @PostMapping("myBoardList")
    public String myBoardList(@RequestParam(value = "memberNo", required = false) int memberNo,
                              @RequestParam(value = "first", required = false) int first,
                              @RequestParam(value = "last", required = false) int last){

        Map<String, Integer> map = new HashMap<>();

        System.out.println("first : " + first + " / last : " + last);

        map.put("memberNo", memberNo);
        map.put("first", first);
        map.put("last", last);

        Board board = new Board();
        board.setMaxValue(service.countBoardList(map));

        List<Board> myBoardList = service.myBoardList(map);
        myBoardList.add(board);

        return new Gson().toJson(myBoardList);
    }

    @PostMapping("myScrapList")
    public String myScrapList(@RequestParam(value = "memberNo", required = false) int memberNo,
                              @RequestParam(value = "first", required = false) int first,
                              @RequestParam(value = "last", required = false) int last){

        Map<String, Integer> map = new HashMap<>();

        map.put("memberNo", memberNo);
        map.put("first", first);
        map.put("last", last);

        Scrap scrap = new Scrap();
        scrap.setMaxValue(service.countScrapList(map));

        List<Scrap> sList = service.myScrapList(map);

        sList.add(scrap);

        return new Gson().toJson(sList);
    }


    @RequestMapping(value = "myEmpathyList", method = RequestMethod.POST)
    public String myEmpathyList(@RequestParam(value = "memberNo", required = false) int memberNo,
                              @RequestParam(value = "first", required = false) int first,
                              @RequestParam(value = "last", required = false) int last){
        Map<String, Integer> map = new HashMap<>();

        map.put("memberNo", memberNo);
        map.put("first", first);
        map.put("last", last);

        Board board = new Board();
        board.setMaxValue(service.countEmpathyList(map));

        List<Board> myEmpathyList = service.myEmpathyList(map);

        myEmpathyList.add(board);

        return new Gson().toJson(myEmpathyList);
    }

    @RequestMapping(value = "myLetterList", method = RequestMethod.GET)
    public List<Letter> myLetterList(HttpSession session, Model model){
        int memberNo = ((Member)session.getAttribute("loginMember")).getMemberNo();
        System.out.println(memberNo);
        System.out.println("qwe");

//
        List<Letter> data = service.myLetterList(memberNo);
        System.out.println(data);
//
//        System.out.println(data);
//
        return data;
    }


}
