package com.homepage.interlink.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.homepage.interlink.model.Admin_tb;
import com.homepage.interlink.service.Admin_tbService;
import com.homepage.interlink.util.CommandMap;

@Controller
public class view_cms {
	
	@Autowired
	private Admin_tbService as;
	
	@RequestMapping(value = "/view_cms_main") //로그인 및 회원가입
	public ModelAndView view_cms_main(HttpServletRequest request, SessionStatus status, HttpServletResponse response,
			CommandMap commandMap, Model model, @RequestParam Map<String, Object> paramMap) throws Exception {
		
		ModelAndView mav = new ModelAndView("cms_view/cms_main");
		model.addAttribute("result", paramMap.get("result"));
		
		if (request.getSession().getAttribute("ad_id") != null) {
			/*세션 종료 삭제*/
			request.getSession(false).invalidate();
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/userIdCheck", method = RequestMethod.POST) //아이디 중복 검사
	@ResponseBody
	public Map<String, Object> userIdCheck(@RequestParam("userid") String id){
		int person = as.idcheck(id);
		Map<String,Object>  map = new HashMap<String,Object>();
		map.put("cnt", person);
		return map;
	}
	
	@RequestMapping(value = "/loginTry")
	public ModelAndView loginTry(HttpServletRequest request, @RequestParam Map<String, Object> map) throws Exception {
		ModelAndView mav = new ModelAndView();
		/*로그인*/
		Admin_tb admin_tb = as.selectUserInfo(map);
		System.out.println("admin_tb ============id?"+admin_tb);	
		
	    
		if (admin_tb == null) {
			mav.setViewName("cms_view/cms_main");
			mav.addObject("result", "fail");
		}else if(admin_tb.getAd_etc().equals("0")){
			mav.setViewName("cms_view/cms_main");
			mav.addObject("result", "fail_auth");
		}else{
			request.getSession().setAttribute("ad_id", map.get("ad_id"));
			request.getSession().setAttribute("ad_seq", admin_tb.getAd_seq());
			request.getSession().setAttribute("ad_name", admin_tb.getAd_name());
			
			request.getSession().setMaxInactiveInterval(60*30);
			mav.setViewName("cms_view/admin/info");
		}
		return mav;
	}
	
	@RequestMapping(value="/sign_form_insert", method = RequestMethod.POST)
	public String sign_form_insert(CommandMap commandmap, Admin_tb admin_tb) throws Exception {
		try {
			admin_tb.setAd_updateid(admin_tb.getAd_id());
			as.insert(admin_tb);
		} catch (Exception e) {
			System.out.println("sign_form, as.insert x");
		}
		return "cms_view/cms_main";
	}
	
	@RequestMapping(value = "/info")
	public String info(@RequestParam Map<String, Object> paramMap, Admin_tb admin, Model model, HttpServletRequest request, HttpSession session) {

		model.addAttribute("admin_info", as.admin_read(admin));
		model.addAttribute("result", paramMap.get("result"));
		
		return "cms_view/admin/info";
	}
	
	@RequestMapping(value = "/admin_modify_action", method=RequestMethod.POST) //관리자정보 수정액션
	public String admin_modify_action(Admin_tb admin, Model model, HttpServletRequest request, HttpSession session) {
		
		Object ss_id = session.getAttribute("ad_id");
	    String session_id = ss_id.toString();
	    Object ss_seq = session.getAttribute("ad_seq");
	    String session_seq = ss_seq.toString();
		
		admin.setAd_updateid(session_id);
		
		as.admin_update(admin);
		
		return "redirect:/info?ad_seq=" + session_seq + "&result=sucess";
	}
	
	@RequestMapping(value = "/logout") //로그아웃
	public String logout(HttpServletRequest request) {

		return "cms_view/admin/logout";
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
	
	@RequestMapping(value = "/adminList")
	public String adminList() {
		return "cms_view/admin/adminList";
	}

	@RequestMapping(value = "/adminUpdate")
	public String adminUpdate(@RequestParam Map<String, Object> paramMap, Admin_tb admin, Model model, HttpServletRequest request, HttpSession session) {
		
		model.addAttribute("admin_info", as.admin_read(admin));
		model.addAttribute("result", paramMap.get("result"));
		
		return "cms_view/admin/adminUpdate";
	}

	@RequestMapping(value = "/password")
	public String password() {
		return "cms_view/admin/password";
	}
}