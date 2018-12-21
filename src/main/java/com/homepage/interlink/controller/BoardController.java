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
import org.springframework.web.multipart.MultipartFile;

import com.homepage.interlink.model.Board;
import com.homepage.interlink.model.BoardFile;
import com.homepage.interlink.model.Fileup;
import com.homepage.interlink.service.BoardService;
import com.homepage.interlink.service.BoardFileService;

@Controller
public class BoardController {

	@Autowired
    BoardService boardService;
	@Autowired
    BoardFileService boardFileService;
	
	/*	2018-11-27 
		작업자 : 박권수
		다운로드 작업시작
	*/	
	//게시판 목록 화면
	@RequestMapping(value = "/cms_board")
	public String cms_board(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) {
		
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
		
		return "cms/board/cms_board";
	}
	//게시판 작성 화면
	@RequestMapping(value = "/cms_board_insert", method=RequestMethod.GET)
	public String cms_board_insert(@RequestParam Map<String, Object> paramMap, Model model) {
		
		model.addAttribute("board_division", paramMap.get("board_division"));
		return "cms/board/cms_board_insert";
	}
	//게시판 작성 액션
	@RequestMapping(value="/cms_board_insert_action", method=RequestMethod.POST)
	public String cms_board_insert_action(@ModelAttribute Board board, Fileup fileup, HttpServletRequest request, Model model, HttpSession session)throws Exception{
			
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
			}else if(board_division.equals("customer")) {
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
							attach_path = "resources/downloads/";
						}else if (board_division.equals("portfolio")) {
							attach_path = "resources/portfolio/";
						}
						
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

	        if(board_division.equals("customer")) {
	        return "redirect:/main1";	
	        }
	        return "redirect:/cms_board?board_division=" + board.getBoard_division();
	    }
/*	//게시판 다운로드
	@RequestMapping("/boardFileDown")
    private void boardFileDown(String file_name, String file_seq, String board_division, HttpServletRequest request, HttpServletResponse response) throws Exception{
   	request.setCharacterEncoding("UTF-8");

   		System.out.println("=========================> file_seq1---   " + file_name);
   		System.out.println("=========================> file_seq2---   " + file_seq);
   		
   		//자료실 다운 액션
   		try {
			 상대경로 
   		String file_path = request.getSession().getServletContext().getRealPath("/");
   		String attach_path = "";
   		
   		if(board_division.equals("download")) {
   			attach_path = "resources/downloads/";
   		}else if (board_division.equals("portfolio")) {
   			attach_path = "resources/portfolio/";
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
   		
   	}*/
    //게시판 상세보기
    @RequestMapping(value = "/cms_board_body")
	public String cms_board_body(@RequestParam Map<String, Object> paramMap, @ModelAttribute Board board, Model model) {
       model.addAttribute("board_division", paramMap.get("board_division"));
       model.addAttribute("file_list",boardFileService.file_list(paramMap));
	   model.addAttribute("board_body",boardService.board_read(board));
	   
   return "cms/board/cms_board_body";
   }
    //게시판 수정 화면
 	@RequestMapping(value = "/cms_board_update", method=RequestMethod.GET)
 	public String cms_board_update(@RequestParam Map<String, Object> paramMap, Board board, Model model) {
 		model.addAttribute("board_update",boardService.board_read(board));
 		model.addAttribute("file_list",boardFileService.file_list(paramMap));
 		model.addAttribute("board_division", paramMap.get("board_division"));
 		model.addAttribute("board_seq", paramMap.get("board_seq"));
 		
 		return "cms/board/cms_board_update";
 	}
	//게시판 수정 액션
	@RequestMapping(value="/cms_board_update_action", method=RequestMethod.POST)
	public String cms_board_update_action(@ModelAttribute Board board, Fileup fileup, HttpServletRequest request, Model model,  String[] file_key, String[] flag, String[] fName, HttpSession session)throws Exception{
			
				String board_division =  board.getBoard_division();
				System.out.println("========================board_division>" + board_division);
				
				if (!board_division.equals("customer")) {
				
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
								attach_path = "resources/downloads/";
							}else if (board_division.equals("portfolio")) {
								attach_path = "resources/portfolio/";
							}
							
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
				if(file_key != null) {
		    		
		    		for(int i=0; i<file_key.length ; i++) {
		    			
		    			System.out.println("===========fileKey==============>" + file_key[i]);
		    			System.out.println("===========flag==============>" + flag[i]);
		        		System.out.println("===========fName==============>" + fName[i]);

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
			
	        return "redirect:/cms_board_body?board_division="+board.getBoard_division()+"&board_seq=" + board.getBoard_seq();
	    }
	//게시판 목록 및 상세보기에서 삭제 액션 실제로 use_yn = 'N' 처리
	/*@RequestMapping(value = "/cms_board_delete" , method = RequestMethod.GET)
	public String cms_board_delete(Board board, BoardFile boardFile, int[] board_seq, HttpServletRequest request) {
		
		for (int i = 0; i < board_seq.length; i++) {
			
		board.setBoard_updateid("delete success");
		board.setBoard_seq(board_seq[i]);
		
		boardService.board_delete(board);
		
		boardFile.setFile_updateid("delete success");
		boardFile.setBoard_seq(board_seq[i]);
		
		boardFileService.file_delete(boardFile);
		}
		
		return "redirect:/cms_board?board_division=" + board.getBoard_division();
		
	}*/
	
//	------------end---------------------
	
}
