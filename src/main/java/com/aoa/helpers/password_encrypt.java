package com.aoa.helpers;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class password_encrypt {
	
	private static MessageDigest md;
	public static String cryptWithMD5(String pass){
	    try {
	        md = MessageDigest.getInstance("MD5");
	        System.out.println(pass);	        
	        byte[] passBytes = pass.getBytes();
	        md.reset();
	        byte[] digested = md.digest(passBytes);
	        StringBuffer sb = new StringBuffer();
	        for(int i=0;i<digested.length;i++){
	            sb.append(Integer.toHexString(0xff & digested[i]));
	        }
	        return sb.toString();
	    } catch (NoSuchAlgorithmException ex) {
	        System.out.println("Error al encryptar contraseña");
	    }
	        return null;


	}
	
	public static String cryptBcrypt(String pass){
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12);
		String encrypted = encoder.encode(pass);
		return encrypted;
	}
}
