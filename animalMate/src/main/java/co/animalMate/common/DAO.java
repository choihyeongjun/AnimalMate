package co.animalMate.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@192.168.0.92:xe";
	private String user = "mongde";
	private String password = "1234";
	
	public Connection conn; //db 연결객체(private은 상속 안 돼서 public으로 설정
	
	public DAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException | SQLException e) { //예외처리는 프로그램 오류가 아니다!!
			e.printStackTrace(); //어떤 예외가 발생했는지 알 수 있다!!
		}
	}
}
