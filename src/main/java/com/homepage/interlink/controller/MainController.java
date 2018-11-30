package com.homepage.interlink.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	@RequestMapping(value = "/home")
	public String join() {
		return "home";
	}
	@RequestMapping(value = "/about")
	public String about() {
		return "sub/about";
	}
	@RequestMapping(value = "/portfolio")
	public String portfolio() {
		return "sub/portfolio";
	}
	@RequestMapping(value = "/customer")
	public String customer() {
		return "sub/customer";
	}
}