package com.kh.app.main;

import java.sql.Connection;

public class Main {

	public static void main(String[] args) throws Exception {
		
		Connection conn = ConnectDB.connetDB();
		
		PrintBoardAll.printBoardAll(conn);
		
		SearchBoard.searchBoard(conn);
		
		conn.close();
	}

}
