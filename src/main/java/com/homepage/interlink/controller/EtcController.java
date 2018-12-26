package com.homepage.interlink.controller;



import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.homepage.interlink.service.Admin_tbService;
import com.homepage.interlink.service.BoardFileService;
import com.homepage.interlink.service.BoardService;

@Controller
public class EtcController {
	
	@Autowired
	private Admin_tbService as;
	@Autowired
    BoardService boardService;
	@Autowired
    BoardFileService boardFileService;
	
	//메일보내기
  	@RequestMapping(value = "/emailSend")
  	public String emailSend(HttpServletRequest request, Model model, ModelMap mo) throws AddressException, MessagingException {
  		
  		String division = "email";
        model.addAttribute("division", division); 
        System.out.println("ee");
        
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
}