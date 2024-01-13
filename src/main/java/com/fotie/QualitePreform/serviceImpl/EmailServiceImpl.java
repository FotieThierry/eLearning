package com.fotie.QualitePreform.serviceImpl;

import com.fotie.QualitePreform.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import java.time.LocalDate;

@Component
public class EmailServiceImpl implements EmailService {

    @Autowired
    private JavaMailSender emailSender;

    public void sendSimpleMessage(String emailUserReceiver, String text) {

        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("projetinsam@gmail.com");
        message.setTo(emailUserReceiver);
        message.setSubject("Résultat de l'évaluation du "+ LocalDate.now());
        message.setText(text);
        emailSender.send(message);

    }
}
