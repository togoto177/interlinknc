package com.homepage.interlink.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.homepage.interlink.model.Admin_tb;
import com.homepage.interlink.model.Board;
import com.homepage.interlink.model.BoardFile;
import com.homepage.interlink.model.Fileup;
import com.homepage.interlink.service.Admin_tbService;
import com.homepage.interlink.service.BoardFileService;
import com.homepage.interlink.service.BoardService;
import com.homepage.interlink.util.CommandMap;

@Controller
public class view_cms {
	
	@Autowired
	private Admin_tbService as;
	@Autowired
    BoardService boardService;
	@Autowired
    BoardFileService boardFileService;
	//로그인 및 회원가입
	@RequestMapping(value = "/view_cms_main") 
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
	//아이디 중복 검사
	@RequestMapping(value = "/userIdCheck", method = RequestMethod.POST) 
	@ResponseBody
	public Map<String, Object> userIdCheck(@RequestParam("userid") String id){
		int person = as.idcheck(id);
		Map<String,Object>  map = new HashMap<String,Object>();
		map.put("cnt", person);
		return map;
	}
	//login try
	@RequestMapping(value = "/loginTry")
	public ModelAndView loginTry(HttpServletRequest request, @RequestParam Map<String, Object> map) throws Exception {
		ModelAndView mav = new ModelAndView();
		/*로그인*/
		Admin_tb admin_tb = as.selectUserInfo(map);
		System.out.println("admin_tb ============id?"+admin_tb);	
		
	    
		if (admin_tb == null) {
			mav.setViewName("cms_view/cms_main");
			mav.addObject("result", "fail");
		}else if(admin_tb.getAd_auth().equals("0")){
			mav.setViewName("cms_view/cms_main");
			mav.addObject("result", "fail_auth");
		}else{
			request.getSession().setAttribute("ad_id", map.get("ad_id"));
			request.getSession().setAttribute("ad_seq", admin_tb.getAd_seq());
			request.getSession().setAttribute("ad_name", admin_tb.getAd_name());
			request.getSession().setAttribute("ad_contact", admin_tb.getAd_contact());
			request.getSession().setAttribute("ad_email", admin_tb.getAd_email());
			
			request.getSession().setMaxInactiveInterval(60*30);
			mav.setViewName("redirect:/portfolioList?board_division=portfolio");
		}
		return mav;
	}
	//회원가입
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
	//내정보수정
	@RequestMapping(value = "/info")
	public String info(@RequestParam Map<String, Object> paramMap, Admin_tb admin, Model model, HttpServletRequest request, HttpSession session) {

		String division = "info";
        model.addAttribute("division", division);
		
		model.addAttribute("admin_info", as.admin_read(admin));
		model.addAttribute("result", paramMap.get("result"));
		
		return "cms_view/admin/info";
	}
	//관리자정보 공통 수정액션
	@RequestMapping(value = "/admin_modify_action", method=RequestMethod.POST) 
	public String admin_modify_action(Admin_tb admin, Model model, HttpServletRequest request, HttpSession session, String division) {
		
		Object ss_id = session.getAttribute("ad_id");
	    String session_id = ss_id.toString();
	    Object ss_seq = session.getAttribute("ad_seq");
	    String session_seq = ss_seq.toString();
		
		admin.setAd_updateid(session_id);
		
		as.admin_update(admin);
		
		System.out.println("========================================request.getServletPath(); >" + request.getRequestURI());
		
		if(division.equals("info")) {
		return "redirect:/info?ad_seq=" + session_seq + "&result=sucess";
		}else {
		return "redirect:/adminList";	
		}
		
	}
	//로그아웃
	@RequestMapping(value = "/logout") 
	public String logout(HttpServletRequest request) {

		return "cms_view/admin/logout";
	}
	//비밀번호 변경 폼
	@RequestMapping(value = "/password") 
	public String password(@RequestParam Map<String, Object> paramMap, Admin_tb admin, Model model, HttpServletRequest request, HttpSession session) {
		
		String division = "password";
        model.addAttribute("division", division);
		
		model.addAttribute("admin_info", as.admin_read(admin));
		model.addAttribute("result", paramMap.get("result"));
		
		return "cms_view/admin/password";
	}
	//비밀번호 변경 액션
    @RequestMapping(value = "/password_modify_action", method=RequestMethod.POST) 
    public String password_modify_action(@RequestParam Map<String, Object> paramMap, String ad_password, String ad_passwordChk, @ModelAttribute Admin_tb admin, Model model, HttpServletRequest request, HttpSession session) {
       boolean result = as.passwordCheck(admin);

        Object ss_id = session.getAttribute("ad_id");
	    String session_id = ss_id.toString();
		
		admin.setAd_updateid(session_id);
		
		if(result == true){
			if(!ad_password.equals(ad_passwordChk)){
	        	return "redirect:/password?result=fail_id";
	        }
			as.password_update(admin);
			return "redirect:/password?result=sucsess";
			
        }else { 
        	return "redirect:/password?result=fail";
        }

    }
    //포트폴리오 목록
	@RequestMapping(value = "/portfolioList") 
	public String portfolioList(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) {
		
		//조회 하려는 페이지
        int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage")!=null?Integer.parseInt(paramMap.get("startPage").toString()):1);

        //한페이지에 보여줄 리스트 수
        int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages")!=null?Integer.parseInt(paramMap.get("visiblePages").toString()):10);
        //일단 전체 건수를 가져온다.
        int totalCnt = boardService.board_cnt(paramMap);
        
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
        
		model.addAttribute("board_division", paramMap.get("board_division"));
		model.addAttribute("board_list", boardService.board_list(paramMap));
		
		return "cms_view/portfolio/portfolioList";
	}
	//포트폴리오 작성 폼
	@RequestMapping(value = "/portfolioWrite")
	public String portfolioWrite(@RequestParam Map<String, Object> paramMap, Model model) {
		
		model.addAttribute("board_division", paramMap.get("board_division"));
		
		return "cms_view/portfolio/portfolioWrite";
	}
	//포트폴리오 수정 폼
	@RequestMapping(value = "/portfolioUpdate", method=RequestMethod.GET)
	public String portfolioUpdate(@RequestParam Map<String, Object> paramMap, Board board, Model model) {

		model.addAttribute("board_update",boardService.board_read(board));
 		model.addAttribute("file_list",boardFileService.file_list(paramMap));
 		model.addAttribute("board_division", paramMap.get("board_division"));
 		model.addAttribute("board_seq", paramMap.get("board_seq"));
		return "cms_view/portfolio/portfolioUpdate";
	}
	//고객센터 목록
	@RequestMapping(value = "/contactList")
	public String contactList(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) {
		
		//조회 하려는 페이지
        int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage")!=null?Integer.parseInt(paramMap.get("startPage").toString()):1);

        //한페이지에 보여줄 리스트 수
        int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages")!=null?Integer.parseInt(paramMap.get("visiblePages").toString()):10);
        //일단 전체 건수를 가져온다.
        int totalCnt = boardService.board_cnt(paramMap);
        
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
        
		model.addAttribute("board_division", paramMap.get("board_division"));
		model.addAttribute("board_list", boardService.board_list(paramMap));
		
		return "cms_view/contact/contactList";
	}
	//고객센터 수정폼
	@RequestMapping(value = "/contactUpdate")
	public String contactUpdate(@RequestParam Map<String, Object> paramMap, Model model, Board board) {
		
	   model.addAttribute("board_division", paramMap.get("board_division"));
       model.addAttribute("file_list",boardFileService.file_list(paramMap));
	   model.addAttribute("board_body",boardService.board_read(board));
		
		return "cms_view/contact/contactUpdate";
	}
	//다운로드 목록
	@RequestMapping(value = "/downloadsList")
	public String downloadsList(@RequestParam Map<String, Object>paramMap, Model model) {
		
		//조회 하려는 페이지
        int startPage = (!"".equals(paramMap.get("startPage")) && paramMap.get("startPage")!=null?Integer.parseInt(paramMap.get("startPage").toString()):1);

        //한페이지에 보여줄 리스트 수
        int visiblePages = (!"".equals(paramMap.get("visiblePages")) && paramMap.get("visiblePages")!=null?Integer.parseInt(paramMap.get("visiblePages").toString()):10);
        //일단 전체 건수를 가져온다.
        int totalCnt = boardService.board_cnt(paramMap);
        
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
        
		model.addAttribute("board_division", paramMap.get("board_division"));
		model.addAttribute("board_list", boardService.board_list(paramMap));
		
		return "cms_view/downloads/downloadsList";
	}
	//다운로드 작성 폼
	@RequestMapping(value = "/downloadsWrite")
	public String downloadsWrite(@RequestParam Map<String, Object>paramMap, Model model) {
		
		model.addAttribute("board_division", paramMap.get("board_division"));
		
		return "cms_view/downloads/downloadsWrite";
	}
	//다운로드 수정 폼
	@RequestMapping(value = "/downloadsUpdate")
	public String downloadsUpdate(@RequestParam Map<String, Object> paramMap, Model model, Board board) {
		
	   model.addAttribute("board_division", paramMap.get("board_division"));
       model.addAttribute("file_list",boardFileService.file_list(paramMap));
	   model.addAttribute("board_update",boardService.board_read(board));
		
		return "cms_view/downloads/downloadsUpdate";
	}
	//공통 CMS 게시판 작성 액션
	@RequestMapping(value="/boardWriteAction", method=RequestMethod.POST)
	public String boardWriteAction(@ModelAttribute Board board, Fileup fileup, HttpServletRequest request, Model model, HttpSession session)throws Exception{
				
				String board_division =  board.getBoard_division();
				
				
			    if(!session.equals(null)) {
			    	board.setBoard_writer("GUEST");
			    	board.setBoard_use_yn("Y");
					board.setBoard_hit(0);
					board.setBoard_updateid("GUEST");
					board.setBoard_etc("etc");
			    }else{
			    	Object objss_id = session.getAttribute("ad_id");
			    	String session_id = objss_id.toString();
			    	System.out.println("======================session_id======>" + session_id);
			    	board.setBoard_writer(session_id);
			    	board.setBoard_use_yn("Y");
					board.setBoard_hit(0);
					board.setBoard_updateid(session_id);
					board.setBoard_etc("etc");
			    }
			
				

				boardService.board_insert(board);
				
				System.out.println("==========================>" + board);
				
			
				//포트폴리오 테이블 작성 액션
				if(board_division.equals("portfolio")) {
				board.setBoard_seq(board.getBoard_seq());
				boardService.portfolio_insert(board);
				}else if(board_division.equals("contact")) {
				board.setBoard_seq(board.getBoard_seq());
				board.setStatus("0");
				boardService.customer_insert(board);
				}
				
				
				
				board = boardService.board_read(board);
				
		        BoardFile boardFile = new BoardFile();
		        boardFile.setBoard_seq(board.getBoard_seq());
		        boardFile.setFile_updateid(board.getBoard_writer());
		        boardFile.setFile_use_yn("Y");
		        
		        //파일
		        Calendar cal = Calendar.getInstance()  ;
		        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd-HHmmSS");
		        String time = dateFormat.format(cal.getTime());
		        
		        List<MultipartFile> files = fileup.getUploadfile();
				System.out.println("File ----->" + files);
				if (null != files && files.size() > 0) {
					
					
					for (MultipartFile multipartFile : files) {
						if (!"".equals(multipartFile.getOriginalFilename()) && multipartFile.getSize() > 0) {
						
							System.out.println("file = " + multipartFile.getOriginalFilename() + "/" + multipartFile.getSize());
							// 상대경로 
							String file_path = request.getSession().getServletContext().getRealPath("/");
							
							String file_ori_name = multipartFile.getOriginalFilename();
							String file_sub_name = time + "-" + UUID.randomUUID().toString() +"_" +file_ori_name;
							String attach_path = "";
							
							if(board_division.equals("download")) {
								attach_path = "resources/download/download_uploadfile/";
							}else if (board_division.equals("portfolio")) {
								attach_path = "resources/portfolio/portfolio_uploadfile/";
							}
							
							File f = new File(file_path + attach_path + file_sub_name);
							
							System.out.println("===========자료실 파일업로드 실제 Path=========" + f);
							
							if(!f.exists())
								f.mkdirs();
							
							//	이력서 model에 파일명,주소 저장
							//         파일명에서 확장자 추출 
							String filename = file_ori_name;
							int fileLen = filename.length();
							int lastDot = filename.lastIndexOf('.');
							String fileExt = filename.substring(lastDot, fileLen).toLowerCase();
							boardFile.setExtention_name(fileExt);
							boardFile.setFile_ori_name(file_ori_name);
							boardFile.setFile_sub_name(file_sub_name);
							boardFile.setFile_path("/" + attach_path);
							
							long fsize = multipartFile.getSize();
							String Fsize = String.valueOf(fsize);

					        System.out.println(" size = " + Fsize + " bytes");
					 
							
							boardFile.setFile_size(Fsize);

							System.out.println("확장명 : " + fileExt);
							
							boardFileService.file_insert(boardFile);
							
							try {
								multipartFile.transferTo(f);
							} catch (IllegalStateException e) {
								e.printStackTrace();
							} catch (IOException e) {
								e.printStackTrace();
							}
							
							
							
							
							try { 						
								
							} catch (Exception e) {
								model.addAttribute("msg", "다시 입력하세요.");
							}
							
						}
					}
					
					
				}

		        if(board_division.equals("contact")) {
		        	return "redirect:/main_test";	
		        }else if (board_division.equals("portfolio")) {
		        	return "redirect:/portfolioList?board_division=" + board.getBoard_division();
				}
		        return "redirect:/downloadsList?board_division=" + board.getBoard_division();
		    }
	//공통 CMS 게시판 수정 액션
	@RequestMapping(value="/boardUpdateAction", method=RequestMethod.POST)
	public String boardUpdateAction(@ModelAttribute Board board, Fileup fileup, HttpServletRequest request, Model model,  String[] file_key, String[] flag/*, String[] fName*/, HttpSession session)throws Exception{
				
					String board_division =  board.getBoard_division();
					
					if (!board_division.equals("contact")) {
					
					Object objss_id = session.getAttribute("ad_id");
				    String session_id = objss_id.toString();
					
					board.setBoard_updateid(session_id);

					boardService.board_update(board);
							
			        BoardFile boardFile = new BoardFile();
			        boardFile.setBoard_seq(board.getBoard_seq());
			        boardFile.setFile_updateid(session_id);
			        boardFile.setFile_use_yn("Y");
			        
			        //파일
			        Calendar cal = Calendar.getInstance()  ;
			        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd-HHmmSS");
			        String time = dateFormat.format(cal.getTime());
			        
			        List<MultipartFile> files = fileup.getUploadfile();
					
					//List<String> fileNames = new ArrayList<String>();
					if (null != files && files.size() > 0) {
						
						
						for (MultipartFile multipartFile : files) {
							if (!"".equals(multipartFile.getOriginalFilename()) && multipartFile.getSize() > 0) {
							
								System.out.println("file = " + multipartFile.getOriginalFilename() + "/" + multipartFile.getSize());
								// 상대경로 
								String file_path = request.getSession().getServletContext().getRealPath("/");
								String file_ori_name = multipartFile.getOriginalFilename();
								String file_sub_name = time + "-" + UUID.randomUUID().toString() +"_" +file_ori_name;
								
								System.out.println("file_ori_name ----->" + file_ori_name);
								
								String attach_path = "";
								if(board_division.equals("download")) {
									attach_path = "resources/download/download_uploadfile/";
								}else if (board_division.equals("portfolio")) {
									attach_path = "resources/portfolio/portfolio_uploadfile/";
								}
								
								File f = new File(file_path + attach_path + file_sub_name);
								
								System.out.println("===========자료실 파일업로드 실제 Path=========" + f);
								
								if(!f.exists())
									f.mkdirs();
								
								//	이력서 model에 파일명,주소 저장
								//         파일명에서 확장자 추출 
								String filename = file_ori_name;
								int fileLen = filename.length();
								int lastDot = filename.lastIndexOf('.');
								String fileExt = filename.substring(lastDot, fileLen).toLowerCase();
								boardFile.setExtention_name(fileExt);
								boardFile.setFile_ori_name(file_ori_name);
								boardFile.setFile_sub_name(file_sub_name);
								boardFile.setFile_path("/" + attach_path);
								
								long test = multipartFile.getSize();
								String test2 = String.valueOf(test);

						        System.out.println(" size = " + test2 + " bytes");
						 
								
								boardFile.setFile_size(test2);

								System.out.println("확장명 : " + fileExt);
								
								boardFileService.file_insert(boardFile);
								
								try {
									multipartFile.transferTo(f);
								} catch (IllegalStateException e) {
									e.printStackTrace();
								} catch (IOException e) {
									e.printStackTrace();
								}
								
								
								
								
								try { 						
									
								} catch (Exception e) {
									model.addAttribute("msg", "다시 입력하세요.");
								}
								
							}
						}
						
						
					}
					if(file_key != null) {
			    		
			    		for(int i=0; i<file_key.length ; i++) {
			    			
			    			System.out.println("===========fileKey==============>" + file_key[i]);
			    			System.out.println("===========flag==============>" + flag[i]);
			        		/*System.out.println("===========fName==============>" + fName[i]);*/

			        		//flag가 D인건 삭제. 데이터도 삭제, 파일도 삭제.
			    			if("D".equals(flag[i])) {
			    				boardFile.setFile_seq(Integer.parseInt(file_key[i]));
			    				boardFile.setFile_updateid(session_id);
			    				

			    				boardFileService.file_updateform_delete(boardFile);
									
			    			}
			    		}
			    		}
					}else{
					boardService.board_update(board);
					}
					
				if(board.getBoard_division().equals("portfolio")) {
					return "redirect:/portfolioList?board_division="+board.getBoard_division();
				}else if(board.getBoard_division().equals("contact")) {
					//2018-12-26 권수 수정
					//리스트에서 수정창으로 변경
					return "redirect:/contactUpdate?board_division="+board.getBoard_division()+"&board_seq="+board.getBoard_seq();  
				}else {
					return "redirect:/downloadsList?board_division="+board.getBoard_division();
				}
		    }
	//공통 CMS 게시판 삭제 액션
	@RequestMapping(value = "/board_delete" , method = RequestMethod.GET)
	public String board_delete(Board board, BoardFile boardFile, int[] board_seq, HttpServletRequest request) {
			
		System.out.println("=======================board_seq?" + board_seq);
		
			for (int i = 0; i < board_seq.length; i++) {
				
			board.setBoard_updateid("delete success");
			board.setBoard_seq(board_seq[i]);
			System.out.println("=======================board_seq[i]?" + board_seq[i]);
			
			boardService.board_delete(board);
			
			boardFile.setFile_updateid("delete success");
			boardFile.setBoard_seq(board_seq[i]);
			
			boardFileService.file_delete(boardFile);
			}
			if (board.getBoard_division().equals("portfolio")) {
				return "redirect:/portfolioList?board_division=" + board.getBoard_division();
				
			}else if(board.getBoard_division().equals("contact")){
				return "redirect:/contactList?board_division=" + board.getBoard_division();
			}else {
				return "redirect:/downloadsList?board_division=" + board.getBoard_division();
			}
			
		}
	//공통 CMS 게시판 다운로드 액션
	@RequestMapping("/boardFileDown")
    private void boardFileDown(String file_name, String file_seq, String board_division, HttpServletRequest request, HttpServletResponse response) throws Exception{
   	request.setCharacterEncoding("UTF-8");

   		System.out.println("=========================> file_seq1---   " + file_name);
   		System.out.println("=========================> file_seq2---   " + file_seq);
   		
   		//자료실 다운 액션
   		try {
			 /*상대경로 */
   		String file_path = request.getSession().getServletContext().getRealPath("/");
   		String attach_path = "";
   		
   		if(board_division.equals("download")) {
   			attach_path = "resources/download/download_uploadfile/";
   		}else if (board_division.equals("portfolio")) {
   			attach_path = "resources/portfolio/portfolio_uploadfile/";
		}

   		String savePath = file_path+attach_path;
   		String fileName = file_name;
   		//실제 내보낼 파일명
   		String oriFileName = file_name;
   		
   		String oriFileNames = oriFileName.substring(oriFileName.indexOf("_")+1);

   		
   		System.out.println(oriFileNames); 
   		
   		InputStream in = null;
   		OutputStream os = null;
   		File file = null;
   		boolean skip = false;
   		String client = "";
   		
   		
   		//파일을 읽어 스트림에 담기
   		try {
				file = new File(savePath, fileName);
				in = new FileInputStream(file);
			} catch (FileNotFoundException fe) {
				skip = true;
			}
   		
   		client = request.getHeader("User-Agent");
   		
   		
   		//파일 다운로드 헤더 지정 
           response.reset();
           response.setContentType("application/octet-stream");
           response.setHeader("Content-Description", "JSP Generated Data");
           
           
           
           if (!skip) {
               // IE
               if (client.indexOf("MSIE") != -1) {
                   response.setHeader("Content-Disposition", "attachment; filename=\""
                           + java.net.URLEncoder.encode(oriFileNames, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                   
                   // IE 11 이상.
               } else if (client.indexOf("Trident") != -1) {
                   response.setHeader("Content-Disposition", "attachment; filename=\""
                           + java.net.URLEncoder.encode(oriFileNames, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
               } else {
                   // 한글 파일명 처리
                   response.setHeader("Content-Disposition",
                           "attachment; filename=\"" + new String(oriFileNames.getBytes("UTF-8"), "ISO8859_1") + "\"");
                   response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
               }
               response.setHeader("Content-Length", "" + file.length());
               os = response.getOutputStream();
               byte b[] = new byte[(int) file.length()];
               int leng = 0;
               while ((leng = in.read(b)) > 0) {
                   os.write(b, 0, leng);
               
                   boardFileService.file_hit(file_seq);
               
               }
           } else {
               response.setContentType("text/html;charset=UTF-8");
               System.out.println("파일을 찾을 수 없습니다.");
           }
           in.close();
           os.close();
       } catch (Exception e) {
           System.out.println("ERROR : " + e.getMessage());
       }
   		
   	}
	//관리자 목록폼
	@RequestMapping(value = "/adminList")
	public String adminList(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) {
		
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
        
        String division = "admin";
        model.addAttribute("division", division);      
        
        model.addAttribute("startPage", startPage+"");//현재 페이지      
        model.addAttribute("totalCnt", totalCnt);//전체 게시물수
        model.addAttribute("totalPage", totalPage);//페이지 네비게이션에 보여줄 리스트 수
        model.addAttribute("waitCnt", waitCnt);//회원가입대기자 수
        
        
		model.addAttribute("employee_list", as.employee_list(paramMap)); //사원목록 리스트
		model.addAttribute("wait_list", as.wait_list(paramMap)); //회원가입 대기자 리스트
		
		return "cms_view/admin/adminList";
	}
	//관리자 수정폼
	@RequestMapping(value = "/adminUpdate")
	public String adminUpdate(@RequestParam Map<String, Object> paramMap, Admin_tb admin, Model model, HttpServletRequest request, HttpSession session) {
		
		String division = "admin";
        model.addAttribute("division", division); 
		model.addAttribute("admin_info", as.admin_read(admin));
		
		return "cms_view/admin/adminUpdate";
	}
	//관리자 삭제
  	@RequestMapping(value = "/admin_delete" , method = RequestMethod.GET)
  	public String admin_delete(int[] ad_seq, HttpServletRequest request) {
  		for (int i = 0; i < ad_seq.length; i++) {
  			
  		
  		as.employee_delete(ad_seq[i]);
  		}
  		
  		return "redirect:/adminList";
  		
  	}
  	//관리자 승인(회원가입)
  	@RequestMapping(value = "/wait_admit" , method = RequestMethod.GET)
  	public String wait_admit(Admin_tb admin_tb, int[] chk, String[] ad_rank, String[] ad_hiredate, HttpServletRequest request) {
  	
  		
  		for (int i = 0; i < chk.length; i++) {
  		
  					admin_tb.setAd_seq(chk[i]);
  					admin_tb.setAd_auth("1");
  					admin_tb.setAd_rank(ad_rank[i]);
					admin_tb.setAd_hiredate(ad_hiredate[i]);
  					System.out.println("======================>ad_seq[i] :" + chk[i]);
					System.out.println("=====================>ad_rank[i] : " + ad_rank[i]);
					System.out.println("=====================>ad_rank[i] : " + ad_hiredate[i]);
					as.wait_admit(admin_tb);
 

  
  		}
  		return "redirect:/adminList";
  		
  	}
  	//관리자 승인거절(회원가입)
  	@RequestMapping(value = "/wait_delete" , method = RequestMethod.GET)
  	public String wait_delete(int[] chk, HttpServletRequest request) {
  		for (int i = 0; i < chk.length; i++) {
  			
  		
  		as.employee_delete(chk[i]);
  		}
  		
  		return "redirect:/adminList";
  		
  	}
}