package com.springsignup.model;

import java.util.HashMap;
import java.util.Map;

public class UserStorage {
	public static Map<String, String> userStroageDatabaseMap = new HashMap<String, String>();

	public void addUser(String userName, String passWord) {
		userStroageDatabaseMap.put(userName, passWord);
	}

	public boolean checkUser(String userName, String passWord) {
		if (userStroageDatabaseMap.containsKey(userName)) {
			return passWord.equals(userStroageDatabaseMap.get(userName));
		} else
			return false;
	}

	public boolean isUserAvailable(String userName) {
		if (userStroageDatabaseMap.containsKey(userName))
			return true;
		else
			return false;
	}

}
