package com.kh.app.main;

import java.util.Scanner;

public class Main {

	public static final Scanner SC = new Scanner(System.in);
	public static String LoginMemberNick;

	public static void main(String[] args) throws Exception {

		// 로직 실행
		new MainService().startService();
		
	}

}
