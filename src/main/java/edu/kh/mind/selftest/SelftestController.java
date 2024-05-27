package edu.kh.mind.selftest;

import edu.kh.mind.common.util.Util;
import edu.kh.mind.member.model.vo.Member;
import edu.kh.mind.selftest.model.service.SelftestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/selftest/*")
public class SelftestController {

    @Autowired
    private SelftestService service;



    @RequestMapping(value = "selftestForm", method = RequestMethod.GET)
    public String selftestForm(Model model, String type,
                               HttpSession session, RedirectAttributes ra){

    	model.addAttribute("css", "selftestForm");
    	model.addAttribute("header", "main");
		model.addAttribute("type", type);
	    System.out.println(type);

        String path = "";

        if(session.getAttribute("loginMember") != null) {

            path = "selftest/selftestForm";
        } else {
            Util.swalSetMessage("로그인 후 이용해주시기 바랍니다.", null, "warning", ra);
            path = "redirect:/";
        }
    	
        return path;
    }




}
