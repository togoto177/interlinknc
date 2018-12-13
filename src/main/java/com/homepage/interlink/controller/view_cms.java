package com.homepage.interlink.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class view_cms {
	@RequestMapping(value = "/view_cms_main")
	public String view_cms_main() {
		return "cms_view/cms_main";
	}
	@RequestMapping(value = "/portfoiloList")
	public String portfoiloList() {
		return "cms_view/portfolio/portfolioList";
	}
	@RequestMapping(value = "/portfolioWrite")
	public String portfolioWrite() {
		return "cms_view/portfolio/portfolioWrite";
	}
	@RequestMapping(value = "/portfolioUpdate")
	public String portfolioUpdate() {
		return "cms_view/portfolio/portfolioUpdate";
	}
}