package kh.com.app.main;

import java.sql.Connection;

import kh.com.app.main.board.BoardService;

public class MainService {

	private BoardService bs = new BoardService();

	// 메뉴 보여주기
	private String showMenuAndGetInput() {
		System.out.println("1. 게시글 작성");
		System.out.println("2. 게시글 목록");
		System.out.println("3. 게시글 상세");

		return Main.SC.nextLine();
	}

	// 서비스 실행
	private void executeService(Connection conn, String input, BoardService bs) throws Exception {

		// 실행
		switch (input) {
		case "1":
			bs.write(conn);
			break;
		case "2":
			bs.selectBoardList(conn);
			break;
		case "3":
			bs.selectBoardone(conn);
			break;
		default:
			System.out.println("잘못 입력하셨습니다.");
		}
	}

	public void processBoard() throws Exception {
		// 메뉴 보여주기
		String input = showMenuAndGetInput();

		// 커넥션 얻기
		Connection conn = JdbcTemplate.getConnection();

		// 서비스 실행
		executeService(conn, input, bs);

		// 커넥션 정리
		conn.close();
	}
}
