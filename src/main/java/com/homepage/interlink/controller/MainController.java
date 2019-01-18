package com.homepage.interlink.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.homepage.interlink.model.Board;
import com.homepage.interlink.model.BoardFile;
import com.homepage.interlink.model.Fileup;
import com.homepage.interlink.service.BoardFileService;
import com.homepage.interlink.service.BoardService;

@Controller
public class MainController {
	
	@Autowired
    BoardService boardService;
	@Autowired
    BoardFileService boardFileService;
	
	@RequestMapping(value = "/main")
	public String main(@RequestParam Map<String, Object> paramMap, Model model, Board board, HttpServletRequest request) {
		

		/*2018-12-05 메인 테스트 겸 권수 추가*/
		
		//조회 하려는 페이지
        int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage")!=null?Integer.parseInt(paramMap.get("startPage").toString()):1);

        //한페이지에 보여줄 리스트 수
        int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages")!=null?Integer.parseInt(paramMap.get("visiblePages").toString()):10);
        //일단 전체 건수를 가져온다.
        int totalCnt = boardService.download_cnt(paramMap);
        
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
        
        paramMap.put("start", startLimitPage);
        paramMap.put("end", visiblePages);
        
        model.addAttribute("startPage", startPage+"");//현재 페이지      
        model.addAttribute("totalCnt", totalCnt);//전체 게시물수
        model.addAttribute("totalPage", totalPage);//페이지 네비게이션에 보여줄 리스트 수
        model.addAttribute("sch_value", paramMap.get("sch_value"));
        model.addAttribute("sch_type", paramMap.get("sch_type"));

		model.addAttribute("download_list", boardService.download_list(paramMap));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");

        Calendar c1 = Calendar.getInstance();

        String pf_year = sdf.format(c1.getTime());
		paramMap.put("pf_year", pf_year);
		board.setPf_this_year(pf_year);
		System.out.println(pf_year);
		model.addAttribute("portfolio_list", boardService.portfolio_list(paramMap));
		model.addAttribute("port_pf_Year", boardService.port_pf_Year(pf_year));
		System.out.println(boardService.port_pf_Year(pf_year));
		
		String path =  request.getServletPath();
		model.addAttribute("servletPath", path);
	
		return "main/main";
	}

	
	@RequestMapping(value = "/mainDownList")
	public String mainDownList(@RequestParam Map<String, Object> paramMap, Model model, Board board, HttpServletRequest request) {
		
		/*2018-12-05 메인 테스트 겸 권수 추가*/
		
		//조회 하려는 페이지
        int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage")!=null?Integer.parseInt(paramMap.get("startPage").toString()):1);

        //한페이지에 보여줄 리스트 수
        int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages")!=null?Integer.parseInt(paramMap.get("visiblePages").toString()):10);
        //일단 전체 건수를 가져온다.
        int totalCnt = boardService.download_cnt(paramMap);
        
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
        
        paramMap.put("start", startLimitPage);
        paramMap.put("end", visiblePages);
        
        model.addAttribute("startPage", startPage+"");//현재 페이지      
        model.addAttribute("totalCnt", totalCnt);//전체 게시물수
        model.addAttribute("totalPage", totalPage);//페이지 네비게이션에 보여줄 리스트 수
        model.addAttribute("sch_value", paramMap.get("sch_value"));
        model.addAttribute("sch_type", paramMap.get("sch_type"));
        
		model.addAttribute("download_list", boardService.download_list(paramMap));
		
		String path =  request.getServletPath();
		model.addAttribute("servletPath", path);
		
		
		return "main/mainDownList";
	}
	//메인 download 수 체크
	@RequestMapping(value = "/mainDownHit", method = RequestMethod.POST)
	@ResponseBody
	public int mainDownHit(@RequestParam Map<String, Object> paramMap, int board_seq) {

		int result = boardService.download_hit(board_seq);
		
		return result;
	}
	
	//메인 contact 작성 액션
		@RequestMapping(value="/mainContactAction", method=RequestMethod.POST)
		@ResponseBody
		public String mainContactAction(@ModelAttribute Board board, Fileup fileup, HttpServletRequest request, Model model, HttpSession session)throws Exception{
					
			    	board.setBoard_writer("GUEST");
			    	board.setBoard_use_yn("Y");
					board.setBoard_hit(0);
					board.setBoard_updateid("GUEST");
					board.setBoard_etc("etc");
			   
					boardService.board_insert(board);
					
					board.setBoard_seq(board.getBoard_seq());
					board.setStatus("0");
					boardService.customer_insert(board);
					
					return "redirect:/main";	
			      
			    }
		@RequestMapping(value = "/mainPortList", method=RequestMethod.POST)
		public String mainport1(@RequestParam Map<String, Object> paramMap, Model model, Board board, HttpServletRequest request) {
			
			
			
			String pf_year = request.getParameter("pf_year");
			model.addAttribute("pf_year", pf_year);
			model.addAttribute("portfolio_list", boardService.portfolio_list(paramMap));
			model.addAttribute("port_pf_Year", boardService.port_pf_Year(pf_year));
			System.out.println("===============================pf_year?" + pf_year);
			String path =  request.getServletPath();
			model.addAttribute("servletPath", path);
			
			
			return "main/mainPortList";
		}
		
	
}