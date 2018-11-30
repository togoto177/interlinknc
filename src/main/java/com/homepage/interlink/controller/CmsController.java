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
	@RequestMapping(value = "/cms_portfolio")
	public String cms_portfolio() {
		return "cms/board/cms_portfolio";
	}
	@RequestMapping(value = "/cms_contact")
	public String cms_contact() {
		return "cms/board/cms_contact";
	}
	
	/*	2018-11-27 
		작업자 : 박권수
		다운로드 작업시작
	*/	
	//자료실 목록 화면
	@RequestMapping(value = "/cms_data")
	public String cms_data(@RequestParam Map<String, Object> paramMap, Model model) {
		
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
		
		return "cms/board/cms_data";
	}
	//자료실 작성 화면
	@RequestMapping(value = "/cms_data_insert", method=RequestMethod.GET)
	public String cms_data_insert(@RequestParam Map<String, Object> paramMap, Model model) {
		
		model.addAttribute("board_division", paramMap.get("board_division"));
		return "cms/board/cms_data_insert";
	}
	//자료실 작성 액션
	@RequestMapping(value="/cms_data_insert_action", method=RequestMethod.POST)
	    public String cms_data_insert_action(@ModelAttribute Board board, Fileup fileup, HttpServletRequest request, Model model)throws Exception{
			
			
		
			board.setBoard_use_yn("Y");
			board.setBoard_hit(9999);
			board.setBoard_writer("admin");
			board.setBoard_updateid("admin");
			board.setBoard_etc("etc");


			boardService.board_insert(board);
			
			
			board = boardService.board_read(board.getBoard_seq());
			
			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!" + board.getBoard_seq());
			
	        BoardFile boardFile = new BoardFile();
	        boardFile.setBoard_seq(board.getBoard_seq());
	        boardFile.setFile_updateid(board.getBoard_writer());
	        boardFile.setFile_use_yn("Y");
	        
	        System.out.println("????????????????????????" + boardFile);
	        
	        //파일
	        Calendar cal = Calendar.getInstance()  ;
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd-HHmmSS");
	        String time = dateFormat.format(cal.getTime());
	        
	        List<MultipartFile> files = fileup.getUploadfile();
			System.out.println("File ----->" + files);
			//List<String> fileNames = new ArrayList<String>();
			if (null != files && files.size() > 0) {
				
				
				for (MultipartFile multipartFile : files) {
					if (!"".equals(multipartFile.getOriginalFilename()) && multipartFile.getSize() > 0) {
					
						System.out.println("file = " + multipartFile.getOriginalFilename() + "/" + multipartFile.getSize());
						// 상대경로 
						String file_path = request.getSession().getServletContext().getRealPath("/");
						String attach_path = "resources/data/";
						String file_ori_name = multipartFile.getOriginalFilename();
						String file_sub_name = time + "-" + UUID.randomUUID().toString() +"_" +file_ori_name;
						
						File f = new File(file_path + attach_path + file_sub_name);
						
						System.out.println("===========자료실 파일업로드 실제 Path=========" + f);

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

	        
	        return "redirect:/cms_data?board_division=" + board.getBoard_division();
	    }
	
    /*자료실 다운로드 */
   @RequestMapping("/dataFileDown")
   private void dataFileDown(String file_name, HttpServletRequest request, HttpServletResponse response) throws Exception{
   	request.setCharacterEncoding("UTF-8");
   	
//   	String u = boardFileService.file_select(file_ori_name);
   	System.out.println("dddddddddd" + file_name);
   	//파일 업로드된 경로

   	
   	try {
			 /*상대경로 */
   		String file_path = request.getSession().getServletContext().getRealPath("/");
   		String attach_path = "resources/data/";
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
   @RequestMapping(value = "/cms_data_body")
	public String cms_data_body(@ModelAttribute Board board, Model model) {
   
	   model.addAttribute("board_body",boardService.board_read(board.getBoard_seq()));
	   
   return "cms/board/cms_data_body";
   }
   @RequestMapping(value = "/cms_data_body")
	public String cms_data_body(@ModelAttribute Board board, Model model) {
   
	   model.addAttribute("board_body",boardService.board_read(board.getBoard_seq()));
	   
   return "cms/board/cms_data_body";
   }
   @RequestMapping(value = "/cms_data_body")
	public String cms_data_body(@ModelAttribute Board board, Model model) {
   
	   model.addAttribute("board_body",boardService.board_read(board.getBoard_seq()));
	   
   return "cms/board/cms_data_body";
   }
   
	
//	------------end---------------------
}
