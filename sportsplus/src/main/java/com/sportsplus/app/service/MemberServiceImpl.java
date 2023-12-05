package com.sportsplus.app.service;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.sportsplus.app.dao.MemberDao;
import com.sportsplus.app.domain.Member;

@Service
public class MemberServiceImpl implements MemberService{

	private BCryptPasswordEncoder pwEncoder;
	private MemberDao memberDao;
	@Autowired
	public MemberServiceImpl(MemberDao memberDao, BCryptPasswordEncoder pwEncoder) {
		this.memberDao = memberDao;
		this.pwEncoder = pwEncoder;
	}
	
	@Override
	public void addMember(Member m) {
		m.setPass(pwEncoder.encode(m.getPass()));
		memberDao.addMember(m);
	}

	@Override
	public int loginProcess(String id, String pass) {
				
		int result = 0;
		Member m = memberDao.getMember(id);	
		if(m == null) result = -1;
		else if(! pwEncoder.matches(pass, m.getPass())) result = 0;
		else result = 1;
		
		return result;
	}

	@Override
	public Member getMember(String id) {
		return memberDao.getMember(id);
	}

	@Override
	public void updateMember(Member m, String newPass) {
		m.setPass(pwEncoder.encode(newPass));
		memberDao.updateMember(m);
	}

	@Override
	public boolean passCheck(Member m) {
		
		boolean result = false;
		
		Member member = memberDao.getMember(m.getId());
		
		if(pwEncoder.matches(m.getPass(), member.getPass())) result = true;
		
		return result;
	}

	@Override
	public Member idFind(Member m) {
		return memberDao.idFind(m);
	}
	
	//비밀번호 찾기 했을때 이메일로 임시비밀번호 발송
	@Override
	public void sendFindPassEmail(Member m) {
		
        int min = 10000;
        int max = 99999;
        int tempPass = (int)(Math.random() * (max - min +1))  + min;
        
        m.setPass(pwEncoder.encode(tempPass+""));        
        memberDao.updateMember(m);
		
    	String body = "<div style='width : 500px; height: 350px; border-radius: 10px; border: 1px solid black;'>"
    			+ "<div style='height : 100px; text-align: center;background-color: black;border-radius: 9px 9px 0 0;'>"
    			+ "<span style='color : white; font-size: 40px; font-weight:bolder;line-height: 100px;'>SportsPlus</span><br></div>"
    			+ "<div style='height : 200px; text-align: center;'><span style='line-height: 50px; color : black; font-size : 20px;'>"
    			+ "비밀번호 재설정 안내<br></span>"
    			+ "<div style='background-color: black; width : 75%; margin: auto; padding: 5px 0; border-radius: 10px 10px 0 0; border: 1px solid black;'>"
    			+ "<span style='color : white; font-size : 30px;'>임시 비밀번호<br></span></div>"
    			+ "<div style='background-color: white; width : 75%; margin: auto; padding: 10px 0; border-radius: 0 0 10px 10px; border : 1px solid black;'>"
    			+ "<span style='color : black; font-size : 50px;'>" + tempPass + "<br></span></div><div>"
    			+ "<span style='color : #c70000e5'>빠른 시일내에 임시 비밀번호로 접속하셔서<br>비밀번호를 재설정 하시길 바랍니다</span></div></div></div>";
        String recipient = m.getEmail();
        
        final String user = "rlaeogus9145@gmail.com";
        final String password = "mdnq npwg zmsf qqje";
 
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", 465);
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.ssl.enable", "true");
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
 
        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });
        
        MimeMessage message = new MimeMessage(session);
        
        try {
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
            message.setSubject("[SportsPlus] 임시비밀번호를 보내드립니다");
            message.setContent(body, "text/html;charset=utf-8");
            Transport.send(message);}
        catch (AddressException e) {e.printStackTrace();}
        catch (MessagingException e) {e.printStackTrace();}     
    }

	
}
