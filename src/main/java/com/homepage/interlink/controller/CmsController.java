package com.homepage.interlink.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.homepage.interlink.model.Admin_tb;
import com.homepage.interlink.model.Board;
import com.homepage.interlink.model.BoardFile;
import com.homepage.interlink.model.Fileup;
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
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("cms/admin/login");
		
		/*if (request.getSession().getAttribute("loginInfo") != null) {
			mav.setViewName("cms/admin/cms_main");
		}else {
			mav.setViewName("cms/admin/login");
		}*/
		return mav;
	}
	
	@RequestMapping(value = "/userIdCheck", method = RequestMethod.GET)
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
			request.getSession().setAttribute("ad_name", admin_tb.getAd_name());
			request.getSession().setMaxInactiveInterval(60*30);
			
			mav.setViewName("cms/admin/cms_main");
		}
		return mav;
	}
	
	@RequestMapping(value="/sign_form_insert", method = RequestMethod.POST)
	public String sign_form_insert(CommandMap commandmap, Admin_tb admin_tb) throws Exception {
		try {
			as.insert(admin_tb);
		} catch (Exception e) {
			System.out.println("sign_form, as.insert x");
		}
		return "/cms/admin/login";
	}
	
	
	
	
	@RequestMapping(value = "/cms_main")
	public String cms_main(HttpServletRequest request) {
		System.out.println(request.getSession().getAttribute("ad_id"));
		System.out.println(request.getSession().getAttribute("ad_name"));
		
		return "cms/admin/cms_main";
	}

	
}
