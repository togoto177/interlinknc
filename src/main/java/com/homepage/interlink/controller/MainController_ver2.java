package com.homepage.interlink.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController_ver2 {
	@RequestMapping(value = "/main")
	public String main() {
		return "ver2/front/main";
	}
	@RequestMapping(value = "/main1")
	public String main1() {
		return "ver2/main1/main1";
	}
	@RequestMapping(value = "/main2")
	public String main2() {
		return "ver2/main2/main2";
	}
	@RequestMapping(value = "/main3")
	public String main3() {
		return "ver2/main3/main3";
	}
	@RequestMapping(value = "/main4")
	public String main4() {
		return "ver2/main4/main4";
	}
}