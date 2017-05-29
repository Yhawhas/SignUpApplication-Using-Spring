package com.springsignup.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springsignup.bean.UserBean;
import com.springsignup.model.UserStorage;

@Controller
public class SignupController {

	public UserStorage userStorage = new UserStorage();

	@RequestMapping("/signup")
	public String showSignUpPage(Model model) {
		model.addAttribute("userFormData", new UserBean());
		return "SignUp";
	}

	@RequestMapping(value = "/registerUser", method = RequestMethod.POST)
	public String addUser(HttpServletRequest req, HttpServletResponse resp,
			@ModelAttribute("userFormData") UserBean userBean) throws IOException, ServletException {
		userStorage.addUser(userBean.getUserName(), userBean.getPassWord());
		return "redirect:/login?message=signup";
	}

	@RequestMapping(value = "/checkUserAvailability", method = RequestMethod.POST)
	public @ResponseBody String checkUser(@RequestParam("username") String username, HttpServletResponse resp)
			throws IOException {
		boolean result = userStorage.isUserAvailable(username);
		resp.getWriter().print(result);
		return null;

	}

}
