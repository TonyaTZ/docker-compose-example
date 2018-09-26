package com.atolbakova.review.filter.service;

import com.atolbakova.review.model.Review;
import freemarker.core.ParseException;
import freemarker.template.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import static java.lang.String.format;
import static java.util.Collections.singletonMap;

@Service
public class EmailSenderService {

    /**
     * Logger.
     */
    private static final Logger LOG = LoggerFactory.getLogger(EmailSenderService.class);

    /**
     * Email server.
     */
    private final JavaMailSender emailSender;
    /**
     * Template engine.
     */
    private Configuration freemarkerConfig;


    @Autowired
    public EmailSenderService(JavaMailSender emailSender, Configuration freemarkerConfig) {
        this.emailSender = emailSender;
        this.freemarkerConfig = freemarkerConfig;
    }

    /**
     * Send email notification about sucessful review.
     *
     * @param review info.
     */
    public void sendEmail(Review review) {
        try {
            MimeMessage message = emailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message,
                    MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
                    StandardCharsets.UTF_8.name());

            Template t = freemarkerConfig.getTemplate("email-template.ftl");

            helper.setTo(review.getEmail());
            helper.setText(FreeMarkerTemplateUtils.processTemplateIntoString(t, singletonMap("name", review.getName())), true);
            helper.setSubject(format("Review #%d is published", review.getId()));
            emailSender.send(message);
            LOG.info(format("Email notification was sent for review: %d", review.getId()));
        } catch (MessagingException | TemplateException | IOException e) {
            LOG.error(format("Failed to send email notification to user: %s about review %d", review.getEmail(), review.getId()), e);
        }
    }
}
