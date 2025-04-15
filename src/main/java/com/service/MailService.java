package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.entity.HabitEntity;
import com.entity.ReminderEntity;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class MailService {

	@Autowired
	JavaMailSender mailSender;

	public void sendWelcomeMail(String toEmail, String firstName) {

		try {
			String text = "<div style=\"background-color: #f3f4f6; padding: 20px; font-family: Arial, sans-serif;\">\r\n"
					+ "\r\n"
					+ "    <div style=\"max-width: 600px; background-color: #ffffff; margin: 0 auto; padding: 20px; border-radius: 10px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); text-align: center;\">\r\n"
					+ "        \r\n" + "        <!-- Header Section -->\r\n"
					+ "        <div style=\"background-color: #4CAF50; color: white; padding: 20px; font-size: 24px; font-weight: bold; border-top-left-radius: 10px; border-top-right-radius: 10px;\">\r\n"
					+ "            🎉 Welcome to Our Community! 🎉\r\n" + "        </div>\r\n" + "\r\n"
					+ "        <!-- Content Section -->\r\n" + "        <div style=\"padding: 20px;\">\r\n"
					+ "            <p style=\"font-size: 18px; color: #333;\">\r\n" + "                Hello <strong>"
					+ firstName + "</strong>,\r\n" + "            </p>\r\n"
					+ "            <p style=\"color: #555; font-size: 16px;\">\r\n"
					+ "                We’re excited to have you join us! Thank you for signing up. You’re now part of an amazing community. \r\n"
					+ "            </p>\r\n" + "\r\n" + "            <!-- Benefits -->\r\n"
					+ "            <div style=\"background-color: #e8f5e9; padding: 15px; border-radius: 5px; margin: 20px 0;\">\r\n"
					+ "                <h3 style=\"color: #388E3C;\">🌟 Here's what you get:</h3>\r\n"
					+ "                <ul style=\"list-style-type: none; padding: 0; text-align: left; color: #333;\">\r\n"
					+ "                    <li style=\"margin-bottom: 10px;\">✅ Exclusive Member Benefits</li>\r\n"
					+ "                    <li style=\"margin-bottom: 10px;\">📩 Regular Updates & News</li>\r\n"
					+ "                    <li style=\"margin-bottom: 10px;\">🎁 Special Offers Just for You</li>\r\n"
					+ "                </ul>\r\n" + "            </div>\r\n" + "\r\n"
					+ "            <!-- CTA Button -->\r\n"
					+ "            <a href=\"https://www.example.com\" style=\"display: inline-block; background-color: #4CAF50; color: white; text-decoration: none; padding: 12px 25px; font-size: 18px; border-radius: 5px; margin-top: 20px;\">\r\n"
					+ "                Get Started 🚀\r\n" + "            </a>\r\n" + "        </div>\r\n" + "\r\n"
					+ "        <!-- Footer Section -->\r\n"
					+ "        <hr style=\"border: 0; height: 1px; background: #ddd; margin: 20px 0;\">\r\n"
					+ "        <p style=\"color: #777; font-size: 14px;\">\r\n"
					+ "            If you have any questions, feel free to <a href=\"mailto:support@example.com\" style=\"color: #4CAF50; text-decoration: none;\">contact us</a>.  \r\n"
					+ "        </p>\r\n" + "        <p style=\"font-weight: bold; font-size: 16px;\">\r\n"
					+ "            Happy to have you onboard! 🎉\r\n" + "        </p>\r\n" + "    </div>\r\n" + "\r\n"
					+ "</div>\r\n" + "";

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

			helper.setTo(toEmail);
			helper.setFrom("hp.tp8080@gmail.com");
			helper.setText(text, true);
			helper.setSubject("Welcome mail");

			mailSender.send(message);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void sendOtpMail(String toEmail, int otp) {

		String htmlContent = "<!DOCTYPE html>" + "<html lang='en'>" + "<head><meta charset='UTF-8'></head>"
				+ "<body style='font-family: Arial, sans-serif; text-align: center; padding: 30px;'>"
				+ "<h2 style='color: #333;'>Your OTP Code</h2>"
				+ "<p style='font-size: 18px;'>Use the following OTP to complete your verification:</p>"
				+ "<div style='font-size: 24px; font-weight: bold; background-color: #f4f4f4; padding: 10px; display: inline-block; border-radius: 5px;'>"
				+ otp + "</div>"
				+ "<p style='margin-top: 20px;'>This OTP is valid for 5 minutes. Please do not share it with anyone.</p>"
				+ "</body></html>";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

			helper.setTo(toEmail);
			helper.setFrom("hp.tp8080@gmail.com");
			helper.setText(htmlContent, true);
			helper.setSubject("Otp mail");

			mailSender.send(message);
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	public void sendResetPasswdMail(String to, String resetToken) {

		String resetLink = "http://localhost:9898/resetpassword?token=" + resetToken;

		String emailContent = "<div style=\"max-width: 600px; margin: 20px auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px; font-family: Arial, sans-serif; background-color: #f9f9f9;\">\r\n"
				+ "    \r\n" + "    <!-- Header -->\r\n"
				+ "    <div style=\"background-color: #4caf50; color: #fff; padding: 20px; text-align: center; border-radius: 8px 8px 0 0;\">\r\n"
				+ "        <h1 style=\"margin: 0; font-size: 24px;\">Reset Your Password</h1>\r\n" + "    </div>\r\n"
				+ "\r\n" + "    <!-- Body -->\r\n" + "    <div style=\"padding: 20px; color: #333;\">\r\n"
				+ "        <p>Hello,</p>\r\n"
				+ "        <p>You recently requested to reset your password. Click the button below to reset it:</p>\r\n"
				+ "\r\n" + "        <!-- Reset button -->\r\n"
				+ "        <div style=\"text-align: center; margin: 30px 0;\">\r\n" + "            <a href=\""
				+ resetLink + "\" \r\n"
				+ "               style=\"background-color: #4caf50; color: white; padding: 12px 25px; text-decoration: none; font-size: 16px; border-radius: 5px; display: inline-block;\">\r\n"
				+ "                Reset Password\r\n" + "            </a>\r\n" + "        </div>\r\n" + "\r\n"
				+ "        <p>This link will expire in <strong>15 minutes</strong>. If you did not request a password reset, please ignore this email.</p>\r\n"
				+ "        <p>Thanks,<br><strong>YourApp Team</strong></p>\r\n" + "    </div>\r\n" + "\r\n"
				+ "    <!-- Footer -->\r\n"
				+ "    <div style=\"font-size: 12px; color: #777; text-align: center; padding: 20px; border-top: 1px solid #ddd;\">\r\n"
				+ "        <p>If you have any questions, contact us at <a href=\"mailto:support@yourapp.com\" style=\"color: #4caf50; text-decoration: none;\">support@yourapp.com</a></p>\r\n"
				+ "        <p>© 2024 Habit Tracker. All rights reserved.</p>\r\n" + "    </div>\r\n" + "\r\n"
				+ "</div>\r\n" + "";

		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
			helper.setTo(to);
			helper.setSubject("Password Reset Request");
			helper.setText(emailContent, true);

			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public void sendReminderMail(HabitEntity habitEntity, String to) {

		String emailTemplate = "<div style=\"max-width: 600px; margin: 20px auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px; font-family: Arial, sans-serif; background-color: #f9f9f9;\">\r\n"
				+ "    \r\n" + "    <!-- Header -->\r\n"
				+ "    <div style=\"background-color: #4caf50; color: #fff; padding: 20px; text-align: center; border-radius: 8px 8px 0 0;\">\r\n"
				+ "        <h1 style=\"margin: 0; font-size: 24px;\">🔔 Reminder Notification</h1>\r\n"
				+ "    </div>\r\n" + "\r\n" + "    <!-- Body -->\r\n"
				+ "    <div style=\"padding: 20px; color: #333;\">\r\n" + "        <p>Hello,</p>\r\n"
				+ "        <p>Here is your scheduled reminder for today:</p>\r\n" + habitEntity.getCount() + " " + habitEntity.getContext() +"\r\n"
				+ "        <table style=\"width: 100%; border-collapse: collapse;\">\r\n" + "            <tr>\r\n"
				+ "                <td style=\"font-weight: bold; padding: 8px; background-color: #f2f2f2;\">📌 Title:</td>\r\n"
				+ "                <td style=\"padding: 8px;\">" + habitEntity.getTitle() + "</td>\r\n"
				+ "            </tr>\r\n" + "            <tr>\r\n"
				+ "                <td style=\"font-weight: bold; padding: 8px; background-color: #f2f2f2;\">📖 Description:</td>\r\n"
				+ "                <td style=\"padding: 8px;\">" + habitEntity.getDesciption() + "</td>\r\n"
				+ "            </tr>\r\n" + "            <tr>\r\n"
				+ "                <td style=\"font-weight: bold; padding: 8px; background-color: #f2f2f2;\">⏳ Duration:</td>\r\n"
				+ "                <td style=\"padding: 8px;\">" + habitEntity.getDuration() + " Days</td>\r\n"
				+ "            </tr>\r\n" + "            <tr>\r\n"
				+ "                <td style=\"font-weight: bold; padding: 8px; background-color: #f2f2f2;\">📂 Category:</td>\r\n"
				+ "                <td style=\"padding: 8px;\">" + habitEntity.getCatagory() + "</td>\r\n"
				+ "            </tr>\r\n" + "            <tr>\r\n"
				+ "                <td style=\"font-weight: bold; padding: 8px; background-color: #f2f2f2;\">📝 Notes:</td>\r\n"
				+ "                <td style=\"padding: 8px;\">" + habitEntity.getNotes() + "</td>\r\n"
				+ "            </tr>\r\n" + "                     </table>\r\n" + "\r\n"
				+ "        <p style=\"margin-top: 20px;\">Stay on track and complete your habit today! 💪</p>\r\n"
				+ "\r\n" + "        <p>Best Regards, <br><strong>Your Habit Tracker Team</strong></p>\r\n"
				+ "    </div>\r\n" + "\r\n" + "    <!-- Footer -->\r\n"
				+ "    <div style=\"font-size: 12px; color: #777; text-align: center; padding: 15px; border-top: 1px solid #ddd;\">\r\n"
				+ "        <p>If you have any questions, contact us at <a href=\"mailto:support@yourapp.com\" style=\"color: #4caf50; text-decoration: none;\">support@yourapp.com</a></p>\r\n"
				+ "        <p>© 2024 YourApp. All rights reserved.</p>\r\n" + "    </div>\r\n" + "\r\n" + "</div>\r\n"
				+ "";

		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
			helper.setTo(to);
			helper.setSubject("🔔 Your Habit Reminder");
			helper.setText(emailTemplate, true);

			mailSender.send(message);
		} catch (

		MessagingException e) {
			e.printStackTrace();
		}

	}

}
