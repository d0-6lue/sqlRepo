package com.kh.app.main;

import com.kh.app.board.BoardService;
import com.kh.app.member.MemberService;

public class MainService {

	MemberService ms = new MemberService();
	BoardService bs = new BoardService();
	private boolean b = true;
	
	public void startService() throws Exception {

		
		while(b) {
			
			for(int i = 0; i < 168; i++ )
				System.out.print("=");
			System.out.println();
			
			showMenu();

			String input = Main.SC.nextLine();

			processMenu(input);
		}

	}

	private void showMenu() {
		System.out.println("1. 회원가입    2. 로그인    3. 게시글 작성    4. 게시글 목록    9. 종료");
	}

	private void processMenu(String input) throws Exception {

		switch (input) {
		case "1":// 회원가입
			ms.signUp();
			break;
		case "2":// 로그인
			ms.signIn();
			break;
		case "3":// 게시글 작성
			bs.write();
			break;
		case "4":// 게시글 목록
			bs.show();
			break;
		case "9":// 종료
			b = false;
			System.out.println("종료합니다...");
			break;
		default:
			System.out.println("잘못된 입력입니다.");
		}
	}
	
}
