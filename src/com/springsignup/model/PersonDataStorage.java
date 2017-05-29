package com.springsignup.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.springsignup.bean.Person;

public class PersonDataStorage {

	private static Map<String, ArrayList<Person>> personData = new HashMap<>();

	public Map<String, ArrayList<Person>> getPersonData() {
		return personData;
	}

	public void addPersonDetail(String username, Person person) {
		if (personData.containsKey(username)) {
			personData.get(username).add(person);
		} else {
			ArrayList<Person> list = new ArrayList<>();
			list.add(person);
			personData.put(username, list);
		}

	}

	public ArrayList<Person> getPersonDetail(String username) {
		if (personData.containsKey(username)) {
			return personData.get(username);
		} else {
			return new ArrayList<Person>();
		}

	}
}
