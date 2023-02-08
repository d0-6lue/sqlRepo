package kh.com.app.main;

import java.util.Scanner;

public class Main {

	public static Scanner SC = new Scanner(System.in);

	public static void main(String[] args) throws Exception {

		System.out.println("===== 게시판 =====");

		MainService ms = new MainService();

		// 실행
		ms.processBoard();

	}

}
