package edu.kh.mind.selftest;

import com.google.gson.Gson;
import edu.kh.mind.member.model.vo.Member;
import edu.kh.mind.selftest.model.service.SelftestService;
import edu.kh.mind.selftest.model.vo.Selftest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/selftest/*")
public class SelftestRestController {


    @Autowired
    private SelftestService service;

    @RequestMapping(value = "selftestQuestion", method = RequestMethod.POST)
    public Map<String, Object> selftestForm(Model model, int categoryNo, Selftest selftest
                                            ,HttpSession session){

        model.addAttribute("css", "selftestForm");
        model.addAttribute("header", "main");


        selftest.setCategoryNo(categoryNo);


        Map<String, Object> selectQ = service.selectQ(selftest);

        System.out.println("List : " + selectQ);



        return selectQ;
    }

    @RequestMapping(value = "mbSelftest", method = RequestMethod.POST)
    public String mbSelftest(Model model) {

        model.addAttribute("css", "mb_selftest");
        model.addAttribute("header", "main");

        return "mbSelftest";
    }

    @RequestMapping(value = "selftestResult", method = RequestMethod.GET)
    public String  selftestResult(Model model, int categoryNo, int score, Selftest selftest
            , HttpSession session) {

        model.addAttribute("css", "selftestResult");
        model.addAttribute("header", "main");

        Member loginMember = (Member)session.getAttribute("loginMember");

        int memberNo = loginMember.getMemberNo();

        System.out.println(memberNo);
        System.out.println(score);
        System.out.println(categoryNo);

        selftest.setCategoryNo(categoryNo);
        selftest.setMemberNo(memberNo);
        selftest.setRate(score);

        System.out.println(selftest);

        Selftest selfTest2 =  service.selectResult(selftest);

        return new Gson().toJson(selfTest2);
    }



}
