package com.springsignup.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springsignup.bean.Person;
import com.springsignup.model.PersonDataStorage;

@Controller
public class ProfilePageController {
	PersonDataStorage personDataStoreObj = new PersonDataStorage();

	@Autowired
	ServletContext context;

	@RequestMapping("profilepage")
	public String showProfilePage(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession(false);
		if (session == null) {
			resp.sendRedirect("/login?message=sessionExpired");
			return null;
		} else {
			Map<String, ArrayList<Person>> personDataMap = personDataStoreObj.getPersonData();
			context.setAttribute("personDataMap", personDataMap);
			return "ProfilePage";
		}
	}

}
