package com.homepage.interlink.controller;

import java.math.BigDecimal;

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
import com.homepage.interlink.service.Admin_tbService;
import com.homepage.interlink.util.CommandMap;
@Controller
public class CmsController {
	@Autowired
	private Admin_tbService as;
	
	/*@RequestMapping(value = "/login")
	public ModelAndView login(HttpServletRequest request, SessionStatus status, HttpServletResponse response, CommandMap commandMap, Model model, @RequestParam Map<String, Object> paramMap) throws Exception {
		ModelAndView mav = new ModelAndView("cms/admin/login");
		model.addAttribute("result", paramMap.get("result"));
		if (request.getSession().getAttribute("ad_id") != null) {
			세션 종료 삭제
			request.getSession(false).invalidate();
		}
		return mav;
	}*/
	
	/*@RequestMapping(value = "/userIdCheck", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> userIdCheck(@RequestParam("userid") String id){
		int person = as.idcheck(id);
		Map<String,Object>  map = new HashMap<String,Object>();
		map.put("cnt", person);
		return map;
	}*/
	
/*	@RequestMapping(value = "/loginTry")
	public ModelAndView loginTry(HttpServletRequest request, @RequestParam Map<String, Object> map) throws Exception {
		ModelAndView mav = new ModelAndView();
		로그인
		Admin_tb admin_tb = as.selectUserInfo(map);
		System.out.println("admin_tb ============id?"+admin_tb);	
		
	    
		if (admin_tb == null) {
			mav.setViewName("cms/admin/login");
			mav.addObject("result", "fail");
		}else if(admin_tb.getAd_etc().equals("0")){
			mav.setViewName("cms/admin/login");
			mav.addObject("result", "fail_auth");
		}else{
			request.getSession().setAttribute("ad_id", map.get("ad_id"));
			request.getSession().setAttribute("ad_seq", admin_tb.getAd_seq());
			request.getSession().setAttribute("ad_name", admin_tb.getAd_name());
			
			request.getSession().setMaxInactiveInterval(60*30);
			mav.setViewName("cms/admin/cms_main");
		}
		return mav;
	}*/
	
	/*@RequestMapping(value="/sign_form_insert", method = RequestMethod.POST)
	public String sign_form_insert(CommandMap commandmap, Admin_tb admin_tb) throws Exception {
		try {
			admin_tb.setAd_updateid(admin_tb.getAd_id());
			as.insert(admin_tb);
		} catch (Exception e) {
			System.out.println("sign_form, as.insert x");
		}
		return "/cms/admin/login";
	}*/
	
	
	
	
/*	@RequestMapping(value = "/cms_main")
	public String cms_main(HttpServletRequest request, HttpSession session) {

		return "cms/admin/cms_main";
	}*/
	
	/*2018-12-12 권수 추가*/
/*	@RequestMapping(value = "/logout") //로그아웃
	public String logout(HttpServletRequest request) {

		return "cms/admin/logout";
	}
	*/
/*	@RequestMapping(value = "/admin_modify") //관리자정보 수정
	public String admin_modify(@RequestParam Map<String, Object> paramMap, Admin_tb admin, Model model, HttpServletRequest request, HttpSession session) {
		
		model.addAttribute("admin_info", as.admin_read(admin));
		model.addAttribute("result", paramMap.get("result"));
		
		return "cms/admin/admin_modify";
	}*/
	
/*	@RequestMapping(value = "/admin_modify_action", method=RequestMethod.POST) //관리자정보 수정액션
	public String admin_modify_action(Admin_tb admin, Model model, HttpServletRequest request, HttpSession session) {
		
		Object ss_id = session.getAttribute("ad_id");
	    String session_id = ss_id.toString();
	    Object ss_seq = session.getAttribute("ad_seq");
	    String session_seq = ss_seq.toString();
		
		admin.setAd_updateid(session_id);
		
		as.admin_update(admin);
		

		
		return "redirect:/admin_modify?ad_seq=" + session_seq + "&result=sucess";
	}*/
	
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
    
    //사원 목록
    @RequestMapping(value = "/employee_list") 
	public String employee_list(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) {


		//조회 하려는 페이지
        int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage")!=null?Integer.parseInt(paramMap.get("startPage").toString()):1);

        //한페이지에 보여줄 리스트 수
        int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages")!=null?Integer.parseInt(paramMap.get("visiblePages").toString()):10);
        //일단 전체 건수를 가져온다.
        int totalCnt = as.employee_cnt(paramMap);
        
        //아래 1,2는 실제 개발에서는 class로 빼준다. (여기서는 이해를 위해 직접 적음)
        //1.하단 페이지 네비게이션에서 보여줄 리스트 수를 구한다.
        BigDecimal decimal1 = new BigDecimal(totalCnt);
        BigDecimal decimal2 = new BigDecimal(visiblePages);
        BigDecimal totalPage = decimal1.divide(decimal2, 0, BigDecimal.ROUND_UP);
        
        //int allCount = boardService.getallCount(paramMap);
 
        int startLimitPage = 0;
        //2.mysql limit 범위를 구하기 위해 계산
        if(startPage==1){
            startLimitPage = 0;
        }else{
            startLimitPage = (startPage-1)*visiblePages;
        }
        
        //회원가입 대기자 조회
        int waitCnt = as.wait_cnt(paramMap);
        
        paramMap.put("start", startLimitPage);
        paramMap.put("end", visiblePages);
        
        model.addAttribute("startPage", startPage+"");//현재 페이지      
        model.addAttribute("totalCnt", totalCnt);//전체 게시물수
        model.addAttribute("totalPage", totalPage);//페이지 네비게이션에 보여줄 리스트 수
        model.addAttribute("waitCnt", waitCnt);//회원가입대기자 수
        
        
		model.addAttribute("employee_list", as.employee_list(paramMap)); //사원목록 리스트
		model.addAttribute("wait_list", as.wait_list(paramMap)); //회원가입 대기자 리스트
    	
		return "cms/admin/employee_list";
	}
    
    //사원 삭제
  	@RequestMapping(value = "/employee_delete" , method = RequestMethod.GET)
  	public String employee_delete(int[] ad_seq, HttpServletRequest request) {
  		
  		for (int i = 0; i < ad_seq.length; i++) {
  			
  		
  		as.employee_delete(ad_seq[i]);
  		}
  		
  		return "redirect:/employee_list";
  		
  	}
  	
  	//회원가입 승인
  	@RequestMapping(value = "/wait_admit" , method = RequestMethod.GET)
  	public String wait_admit(Admin_tb admin_tb, int[] chk, String[] ad_rank, String[] ad_hiredate, HttpServletRequest request) {
  	
  		
  		for (int i = 0; i < chk.length; i++) {
  		
  					admin_tb.setAd_seq(chk[i]);
  					admin_tb.setAd_etc("1");
  					admin_tb.setAd_rank(ad_rank[i]);
					admin_tb.setAd_hiredate(ad_hiredate[i]);
  					System.out.println("======================>ad_seq[i] :" + chk[i]);
					System.out.println("=====================>ad_rank[i] : " + ad_rank[i]);
					System.out.println("=====================>ad_rank[i] : " + ad_hiredate[i]);
					as.wait_admit(admin_tb);
 

  
  		}
  		return "redirect:/employee_list";
  		
  	}
  	

	
}
