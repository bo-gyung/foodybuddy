package com.foodybuddy.common.filter;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class PasswordEncodingWrapper extends HttpServletRequestWrapper{

	public PasswordEncodingWrapper(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String name) {
		String result = super.getParameter(name);
		
		if("user_pw".equals(name)) {
			// 암호화 진행하기
			String ori = super.getParameter(name);
			System.out.println("before : "+ori);
			String enc = getSHA512(ori);
			System.out.println("after : "+enc);
			result = enc;
		}
		return result;
	}
	
	// 암호화 진행할때 쓸 메소드 생성
	// 매개변수로 문자열을 받아서 암호화 된 문자열 리턴
	private String getSHA512(String oriStr) {
		// Java에서 제공하는 암호화 처리 클래스
		MessageDigest md = null;
		try {
			// 적용할 알고리즘(SHA-512) 선택하여 인스턴스화
			md = MessageDigest.getInstance("SHA-512");
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		// String을 byte배열로 자름
		byte[] oriData = oriStr.getBytes();
		// 자른 데이터를 암호화 처리
		md.update(oriData);
		// 암호화 된 데이터를 받아오기
		byte[] encryptData = md.digest();
		// byte배열 데이터를 다시 String으로 변환해서 리턴
		return Base64.getEncoder().encodeToString(encryptData);
	}
	
}
