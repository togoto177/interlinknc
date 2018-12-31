package com.homepage.interlink.controller;



import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/*import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;*/
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.homepage.interlink.model.Fileup;
import com.homepage.interlink.model.Sms_tb;
import com.homepage.interlink.model.Surem_admin;
import com.homepage.interlink.service.Admin_tbService;
import com.homepage.interlink.service.BoardFileService;
import com.homepage.interlink.service.BoardService;
import com.homepage.interlink.service.etcService;

@Controller
public class EtcController {
	
	@Autowired
	private Admin_tbService as;
	@Autowired
    BoardService boardService;
	@Autowired
    BoardFileService boardFileService;
	@Autowired
	etcService etc;
	
	//메일보내기
  	@RequestMapping(value = "/emailSend")
  	public String emailSend(HttpServletRequest request, Model model, ModelMap mo) throws AddressException, MessagingException {
  		
  		String division = "email";
        model.addAttribute("division", division); 
        
  		return "/cms_view/etc/emailSend";
  		
  	}
	
  	//메일보내기
  	@RequestMapping(value = "/emailSendAction" , method = RequestMethod.POST)
  	public String emailSendAction(HttpServletRequest request, Model model, ModelMap mo) throws AddressException, MessagingException {
  		
  		String division = "email";
        model.addAttribute("division", division); 
        
        
        
        String fromEmail = request.getParameter("fromEmail");
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        
     // 네이버일 경우 smtp.naver.com 을 입력합니다. 
     // Google일 경우 smtp.gmail.com 을 입력합니다. 
        String host = "smtp.naver.com"; 
        final String username = "pks9109"; //네이버 아이디를 입력해주세요. @nave.com은 입력하지 마시구요. 
        final String password = "**********"; //네이버 이메일 비밀번호를 입력해주세요. 
        int port=465; //포트번호 
        
        // 메일 내용 
        String recipient = "pks9109@interlinknc.com"; //받는 사람의 메일주소를 입력해주세요. 
        String subject = title; //메일 제목 입력해주세요. 
        String body = "보낸사람 메일 : " + fromEmail + "\n\n\n\n" + "보낸 내용 : " + content; //메일 내용 입력해주세요. 
        Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성
        
        // SMTP 서버 정보 설정 
        props.put("mail.smtp.host", host); 
        props.put("mail.smtp.port", port); 
        props.put("mail.smtp.auth", "true"); 
        props.put("mail.smtp.ssl.enable", "true"); 
        props.put("mail.smtp.ssl.trust", host); 
        //Session 생성
        
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
        	/*Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {*/
        	String un=username; 
        	String pw=password; 
        	protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
        		return new javax.mail.PasswordAuthentication(un, pw); 
        		} 
        	}); 
        session.setDebug(true); //for debug 
        Message mimeMessage = new MimeMessage(session); //MimeMessage 생성 
        mimeMessage.setFrom(new InternetAddress("pks9109@naver.com")); //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요. 
        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음
        mimeMessage.setSubject(subject); //제목셋팅
        mimeMessage.setText(body); //내용셋팅 
        Transport.send(mimeMessage); //javax.mail.Transport.send() 이용


  		return "/cms_view/etc/emailSend";
  		
  	}
  	
  	@RequestMapping(value = "/smsSend")
  	public String smsSend(HttpServletRequest request, Model model){
  		
  		String division = "smsSend";
        model.addAttribute("division", division); 
        
  		return "/cms_view/etc/smsSend";
  	}
  	@RequestMapping(value = "/sms_get")
  	public String sms_get() {
  		return "/cms_view/etc/sms_get";
  	}
  	
  	/*sms api 전송*/
	@RequestMapping(value = "/send_api.do", method = RequestMethod.POST)
	public String send_api(Map<String, Object> paramMap, String[] user_name, Surem_admin surem_admin, Sms_tb sms_tb,
			String[] tell, HttpSession session, Fileup fileup, HttpServletRequest request) {

		surem_admin = etc.surem_admin_select(paramMap);
		String usercode = surem_admin.getSurem_usercode();
		String deptcode = surem_admin.getSurem_deptcode();
		String from = surem_admin.getSurem_tell();
		String reserved_time = surem_admin.getSurem_reserved_time();
		String text = sms_tb.getSms_messages();
		String division = sms_tb.getSms_division();
		String result ="";
		int message_id = etc.smsMessage_id_select(paramMap);
		//message_id 값 없을경우 체크 확인해야함
		if(message_id < 0) {
			message_id = 0;
		}
		message_id += 1;
		
		
		String stringData1 = "{'usercode':'" + usercode + "',\n" + "'deptcode':'" + deptcode + "',\n"
				+ "'messages':[{'message_id' : '"+message_id+"','to':'" + tell[0] + "'}";
		if(user_name.length > 1) {
		for (int i = 1; i < user_name.length; i++) {
			String q = "";
			if (user_name[i] != q) {
				message_id += 1;
				stringData1 += ",{'message_id' : '"+message_id+"','to':'" + tell[i] + "'}";
			}
		}
		}
		stringData1 += "],\n" + "'text':'" + text + "',\n" + "'from':'" + from + "',\n" + "'reserved_time':'"
				+ reserved_time + "'}";
		
		System.out.println(division+"------------"+stringData1);


		/* sms 문자전송 */
		String url = "";
		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "resources/sms/";
		List<String> fileNames = new ArrayList<String>();

		if ("S".equals(division)) {
			url = "https://api.surem.com/sms/v1/json";
			System.out.println("sms url-----*");
		} else if ("L".equals(division)) {
			url = "https://api.surem.com/lms/v1/json";
			System.out.println("lms url-----*");
		} else if ("M".equals(division)) {
			url = "https://api.surem.com/mms/v1";
			System.out.println("mms url-----*");
		}
		
/*
		  try {
		        CloseableHttpClient httpclient = HttpClients.createDefault();
		        HttpPost httpPost = new HttpPost(url);
		        //전달하고자 하는 PARAMETER를 List객체에 담는다
		        
		        if("S".equals(division)) {
		        	@SuppressWarnings("deprecation")
					StringEntity params =new StringEntity(stringData1,HTTP.UTF_8);
		        	httpPost.setHeader("Content-type", "application/json");
		        	httpPost.setEntity(params);
		        }else if ("L".equals(division)) {
		        	@SuppressWarnings("deprecation")
					StringEntity params =new StringEntity(stringData1,HTTP.UTF_8);
		        	httpPost.setHeader("Content-type", "application/json");
		        	httpPost.setEntity(params);
		        }else if ("M".equals(division)) {
		        	
		        	 파일저장 
		        	List<MultipartFile> files = fileup.getUploadfile();
		        	
		    		if (null != files && files.size() > 0) {
		    			for (MultipartFile multipartFile : files) {
		    				if (!"".equals(multipartFile.getOriginalFilename()) && multipartFile.getSize() > 0) {
		    				 상대경로 
		    				String fileName = multipartFile.getOriginalFilename();
		    				
		    				File f = new File(root_path + attach_path + fileName);
		    				try {
		    					multipartFile.transferTo(f);
		    				} catch (IllegalStateException e) {
		    					e.printStackTrace();
		    				} catch (IOException e) {
		    					e.printStackTrace();
		    				}
		    				fileNames.add(fileName);
		    				}
		    			}
		    		}
		    		 파일저장 end 
		    		
		        	httpPost.setHeader("Connection", "Keep-Alive");
		        	httpPost.setHeader("Accept-Charset", "UTF-8");
		        	MultipartEntity reqEntity = new MultipartEntity(HttpMultipartMode.BROWSER_COMPATIBLE,     
		                    null, Charset.forName("UTF-8"));
		        	
		        	for(int k=0; k<fileNames.size(); k++) {
		        	File f1 = new File(root_path + attach_path + fileNames.get(k).toString());
		        	File f1 = new File("C:\\Users\\interlink\\Desktop\\KakaoTalk_20180724_104457508.jpg");
		        	FileBody bin = new FileBody(f1);
		        	int v = k+1;
		        	reqEntity.addPart("image"+v+"", bin);
		        	}
					reqEntity.addPart("reqJSON", new StringBody(stringData1, Charset.forName("utf-8")));
					
					httpPost.setEntity(reqEntity);
					
		        }
		        //UTF-8은 한글
		        httpPost.setEntity(new UrlEncodedFormEntity(reqEntity,"UTF-8"));
		        
				


		        CloseableHttpResponse response = httpclient.execute(httpPost);
		        try {
		            System.out.println(response.getStatusLine());
		            //API서버로부터 받은 JSON 문자열 데이터
		            result = EntityUtils.toString(response.getEntity());
		            HttpEntity entity = response.getEntity();
		            EntityUtils.consume(entity);
		            System.out.println(result);
		        } finally {
		            response.close();
		        }  
		        httpclient.close();
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		  
		   파일삭제 
		  for(int k=0; k<fileNames.size(); k++) {
			  File file = new File(root_path + attach_path + fileNames.get(k).toString());
				System.out.println("=========path============>" + root_path + attach_path + fileNames.get(k).toString());
	
				if (file.exists()) {
					if (file.delete()) {
						System.out.println("파일삭제 성공");
					} else {
						System.out.println("파일삭제 실패");
					}
				} else {
					System.out.println("파일이 존재하지 않습니다.");
				}
			  }

		  
		 sms DB 저장 
		
		  for(int i = 0; i < user_name1.length; i++) { 
			  String q = "";
			  if(user_name1[i]!=q) {
				  sms_td.setUser_name(user_name1[i]);
				  sms_td.setTell(tell1[i]);
				  sms_td.setAdmin_id((String)session.getAttribute("admin_id"));
				  String sendresult = result.substring(9,12);
				  sms_td.setSend_result(sendresult);
			      sms_td.setEtc("null"); 
			      try { 
			    	  sms.sms_td_insert(sms_td); 
			      } catch (Exception e){
			    	  System.out.println("sms DB insert fail");
			    	  System.out.println(e);
				  } 
			  } 
		  }
		  */
		  
		return "redirect:/sms_view1.do";
	}
}