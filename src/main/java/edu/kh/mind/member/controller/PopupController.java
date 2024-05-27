package edu.kh.mind.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/popup/*")
public class PopupController {

	@RequestMapping(value="{layerPopup}", method= RequestMethod.GET)
	public String layerPopup(@PathVariable("layerPopup") String layerPopup, Model model) {

		return "popup/" + layerPopup;
	}


}
