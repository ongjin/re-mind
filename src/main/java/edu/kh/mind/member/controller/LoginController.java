package edu.kh.mind.member.controller;

import edu.kh.mind.member.model.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/login/*")
public class LoginController {

    @Autowired
    private LoginService service;



    @PostMapping("kakao")
    @ResponseBody
    public int kakaoLogin(String kakaoEmail, String kakaoGender, String kakaonickname) {

        if (kakaoGender.equals("male")) kakaoGender = "남";
        else kakaoGender = "여";

        Map map = new HashMap();
        map.put("kakaoEmail", kakaoEmail);
        map.put("kakaoGender", kakaoGender);
        map.put("kakaonickname", kakaonickname);

        System.out.println(map.get("kakaoEmail") + " / " + map.get("kakaoGender") + " / " + map.get("kakaonickname"));

        int result = service.kakaoLogin(map);

        return result;
    }








}
