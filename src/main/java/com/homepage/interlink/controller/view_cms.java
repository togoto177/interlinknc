package com.homepage.interlink.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class view_cms {
	@RequestMapping(value = "/view_cms_main")
	public String view_cms_main() {
		return "cms_view/cms_main";
	}
	@RequestMapping(value = "/portfolioList")
	public String portfolioList() {
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
	@RequestMapping(value = "/downloadsList")
	public String downloadsList() {
		return "cms_view/downloads/downloadsList";
	}
	@RequestMapping(value = "/downloadsWrite")
	public String downloadsWrite() {
		return "cms_view/downloads/downloadsWrite";
	}
	@RequestMapping(value = "/downloadsUpdate")
	public String downloadsUpdate() {
		return "cms_view/downloads/downloadsUpdate";
	}
	@RequestMapping(value = "/contactList")
	public String contactList() {
		return "cms_view/contact/contactList";
	}
	@RequestMapping(value = "/contactUpdate")
	public String contactUpdate() {
		return "cms_view/contact/contactUpdate";
	}
	@RequestMapping(value = "/info")
	public String info() {
		return "cms_view/admin/info";
	}
	@RequestMapping(value = "/adminList")
	public String adminList() {
		return "cms_view/admin/adminList";
	}
	@RequestMapping(value = "/adminUpdate")
	public String adminUpdate() {
		return "cms_view/admin/adminUpdate";
	}
	@RequestMapping(value = "/password")
	public String password() {
		return "cms_view/admin/password";
	}
}