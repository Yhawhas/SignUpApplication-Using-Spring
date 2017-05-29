package com.springsignup.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springsignup.bean.Person;
import com.springsignup.model.PersonDataStorage;

@Controller
public class WelcomePageController {
	public PersonDataStorage personDataStore = new PersonDataStorage();

	@RequestMapping(value = "/welcome", method = { RequestMethod.POST, RequestMethod.GET })
	public String showWelcomePage(HttpServletRequest req, HttpServletResponse resp, Model model) throws IOException {
		HttpSession session = req.getSession(false);
		if (session == null) {
			resp.sendRedirect("/login?message=sessionExpired");
			return null;
		}
		model.addAttribute("personFormData", new Person());
		return "WelcomePage";
	}

	@RequestMapping(value = "/submitPersonData", method = RequestMethod.POST)
	public void storePersonData(HttpServletRequest req, HttpServletResponse resp,
			@ModelAttribute("personFormData") Person person) throws IOException {
		HttpSession session = req.getSession();
		String username = (String) session.getAttribute("usernameSession");
		personDataStore.addPersonDetail(username, person);
		resp.sendRedirect("/profilepage");
	}

};