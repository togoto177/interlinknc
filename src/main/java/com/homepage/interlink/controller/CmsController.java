package com.homepage.interlink.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.homepage.interlink.model.Admin_tb;
import com.homepage.interlink.service.BoardService;
import com.homepage.interlink.service.Admin_tbService;
import com.homepage.interlink.service.BoardFileService;
import com.homepage.interlink.util.CommandMap;
@Controller
public class CmsController {
	@Autowired
	private Admin_tbService as;
	@Autowired
    BoardService boardService;
	@Autowired
    BoardFileService boardFileService;
	
	@RequestMapping(value = "/login")
	public ModelAndView login(HttpServletRequest request, SessionStatus status, HttpServletResponse response, CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("cms/admin/login");
		
		if (request.getSession().getAttribute("ad_id") != null) {
			/*세션 종료 삭제*/
			request.getSession(false).invalidate();
		}
		return mav;
	}
	
	@RequestMapping(value = "/userIdCheck", method = RequestMethod.POST)
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
		String k = admin_tb.getAd_id();
		System.out.println(k);
		if (k==null) {
			mav.setViewName("cms/admin/login");
		}else {
			request.getSession().setAttribute("ad_id", map.get("ad_id"));
			request.getSession().setAttribute("ad_seq", admin_tb.getAd_seq());
			request.getSession().setAttribute("ad_name", admin_tb.getAd_name());

			request.getSession().setMaxInactiveInterval(60*30);
			mav.setViewName("cms/admin/cms_main");
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
		return "/cms/admin/login";
	}
	
	
	
	
	@RequestMapping(value = "/cms_main")
	public String cms_main(HttpServletRequest request, HttpSession session) {

		return "cms/admin/cms_main";
	}
	
	/*2018-12-12 권수 추가*/
	@RequestMapping(value = "/logout") //로그아웃
	public String logout(HttpServletRequest request) {

		return "cms/admin/logout";
	}
	
	@RequestMapping(value = "/admin_modify") //관리자정보 수정
	public String admin_modify(@RequestParam Map<String, Object> paramMap, Admin_tb admin, Model model, HttpServletRequest request, HttpSession session) {
		
		model.addAttribute("admin_info", as.admin_read(admin));
		model.addAttribute("result", paramMap.get("result"));
		
		return "cms/admin/admin_modify";
	}
	
	@RequestMapping(value = "/admin_modify_action", method=RequestMethod.POST) //관리자정보 수정액션
	public String admin_modify_action(Admin_tb admin, Model model, HttpServletRequest request, HttpSession session) {
		
		Object ss_id = session.getAttribute("ad_id");
	    String session_id = ss_id.toString();
	    Object ss_seq = session.getAttribute("ad_seq");
	    String session_seq = ss_seq.toString();
		
		admin.setAd_updateid(session_id);
		
		as.admin_update(admin);
		

		
		return "redirect:/admin_modify?ad_seq=" + session_seq + "&result=sucess";
	}
	
	@RequestMapping(value = "/password_modify") //관리자정보 수정
	public String password_modify(@RequestParam Map<String, Object> paramMap, Admin_tb admin, Model model, HttpServletRequest request, HttpSession session) {
		
		model.addAttribute("admin_info", as.admin_read(admin));
		
		model.addAttribute("result", paramMap.get("result"));
		
		return "cms/admin/password_modify";
	}
	
	//문의하기 사용자 수정 비밀번호 확인 처리
    @RequestMapping(value = "password_modify_action", method=RequestMethod.POST)
    public String password_modify_action(@RequestParam Map<String, Object> paramMap, @ModelAttribute Admin_tb admin, Model model, HttpServletRequest request, HttpSession session) {
       boolean result = as.passwordCheck(admin);
       
        Object ss_id = session.getAttribute("ad_id");
	    String session_id = ss_id.toString();
		
		admin.setAd_updateid(session_id);
		
		String[] arrayStr = request.getParameterValues("ad_password");
		System.out.println(Arrays.toString(arrayStr));
    	
       if(result == true){ 
    	   	
 
    	    as.password_update(admin);
            return "redirect:/password_modify?result=sucsess";
        } else { 
        	return "redirect:/password_modify?result=fail";
        }

    }


	
}
