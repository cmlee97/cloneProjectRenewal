package kr.ezen.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;

@Configuration
public class MailConfig {

    @Bean(name="mailSender")
    public JavaMailSender getJavaMailSender() {
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.transport.protocol", "smtp");
        properties.put("mail.smtp.starttls.enable", "true");
//        properties.put("mail.smtp.starttls.required", true);
        properties.put("mail.debug", "true");
        properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
        properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);
        mailSender.setUsername("chanmi9968@gmail.com");
        mailSender.setPassword("vlxgcckqhufnhych");
        mailSender.setDefaultEncoding("utf-8");
        mailSender.setJavaMailProperties(properties);

        return mailSender;

    }
}
