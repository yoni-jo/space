package space.main.service;

import java.util.Map;
import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.annotation.Resource;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;


import space.main.dao.JoinDAO;

@Service("JoinService")
public class JoinServiceImpl implements JoinService{
	
	@Resource(name="joinDAO") 
	 private JoinDAO joinDAO;
	
	// org.springframework.mail.javamail.JavaMailSender
    private JavaMailSender javaMailSender;
 
    public void setJavaMailSender(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    } 

	@Override
	public void insertUserData(Map<String, Object> map) throws Exception {
		joinDAO.insertUserData(map);		
	}

	@Override
	public int selectUserID(Map<String, Object> map) throws Exception {
		return joinDAO.selectUserID(map);
	}

	@Override
	public boolean send(String subject, String text, String from, String to, String filePath) { 
        // javax.mail.internet.MimeMessage
        MimeMessage message = javaMailSender.createMimeMessage();
 
        try {
            // org.springframework.mail.javamail.MimeMessageHelper
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setSubject(subject);
            helper.setText(text, true);
            helper.setFrom(from);
            helper.setTo(to);
 
            // 梅何 颇老 贸府
            if (filePath != null) {
                File file = new File(filePath);
                if (file.exists()) {
                    helper.addAttachment(file.getName(), new File(filePath));
                }
            }
 
            javaMailSender.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return false;
    }
	 
	 

}
