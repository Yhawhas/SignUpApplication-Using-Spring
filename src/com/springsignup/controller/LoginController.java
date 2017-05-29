package com.springsignup.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springsignup.bean.UserBean;
import com.springsignup.model.UserStorage;

@Controller
public class LoginController {
	public UserStorage userStorage = new UserStorage();

	@RequestMapping("/login")
	public String showLogInPage(@RequestParam(value = "message", defaultValue = "") String message,
			HttpServletRequest req, HttpServletResponse resp, Model model) throws IOException {
		HttpSession session = req.getSession(false);
		if (session == null) {
			model.addAttribute("loginFormData", new UserBean());
			System.out.println(message);
			if (message.equals("homepage")) {
				String sendMessage = "Sign up to login";
				System.out.println(sendMessage + " " + message);
				req.setAttribute("message", sendMessage);
			}
			if (message.equals("signup")) {
				String sendMessage = "Signed up successfully";
				System.out.println(sendMessage + " " + message);
				req.setAttribute("message", sendMessage);
			}
			if (message.equals("logout")) {
				String sendMessage = "Logged Out successfully";
				System.out.println(sendMessage + " " + message);
				req.setAttribute("message", sendMessage);
			}
			if (message.equals("incorrectData")) {
				String sendMessage = "Invalid Credentials, Try again";
				System.out.println(sendMessage + " " + message);
				req.setAttribute("message", sendMessage);
			}
			if (message.equals("sessionExpired")) {
				String sendMessage = "Session Expired, Login again";
				System.out.println(sendMessage + " " + message);
				req.setAttribute("message", sendMessage);
			}

			return "LogIn";
		} else {
			resp.sendRedirect("/welcome");
			return null;
		}
	}

	@RequestMapping("/checkUser")
	public void checkUserCredentials(HttpServletRequest req, HttpServletResponse resp,
			@ModelAttribute("loginFormData") UserBean userBean) throws IOException {
		boolean userValid = userStorage.checkUser(userBean.getUserName(), userBean.getPassWord());
		if (userValid) {
			HttpSession session = req.getSession();
			session.setAttribute("usernameSession", userBean.getUserName());

			resp.sendRedirect("/welcome");
		} else {
			resp.sendRedirect("/login?message=incorrectData");
		}

	}

}
