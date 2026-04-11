package com.nilavu.util;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil{
	
	//hashing the password
	public static String hashPassword(String password) {
		return BCrypt.hashpw(password, BCrypt.gensalt(10));
	}
	
	//verification
	public static Boolean checkPassword(String inputPassword, String storedHash) {
		return BCrypt.checkpw(inputPassword, storedHash);
	}
}



