package kh.com.app.main.board;

import kh.com.app.main.Main;

public class BoardInput {

	// 작성하기 관련 데이터 입력 받기
	public BoardData write() {
		System.out.print("제목 : ");
		String title = Main.SC.nextLine();
		System.out.print("내용 : ");
		String contents = Main.SC.nextLine();
		System.out.print("작성자 : ");
		String writer = Main.SC.nextLine();

		BoardData data = new BoardData();
		data.setTitle(title);
		data.setContents(contents);
		data.setWriter(writer);

		return data;
	}

}
