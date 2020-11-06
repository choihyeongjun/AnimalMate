package co.animalMate.main.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import co.animalMate.common.DAO;
import co.animalMate.vo.BlackVO;

public class BlackDAO extends DAO {
	private PreparedStatement psmt; //sql 명령문 실행
	private ResultSet rs; //select 후 결과셋 받기
	
	private final String SELECT_ALL = "SELECT * FROM MEMBERS";
	private final String SELECT_SEARCH="SELECT * FROM MEMBERS WHERE ID=? OR NAME=?";
	private final String SELECT = "SELECT * FROM MEMBER WHERE ID = ? AND PASSWORD=?";
	private final String INSERT = "INSERT INTO BLACK(CODE, TOUSER, FROMUSER, TITLE, COMM, DTIME) VALUES(BLACK_CODE.nextval,?,?,?,?,sysdate)";
	private final String UPDATE = "UPDATE MEMBER SET NAME = ?, PASSWORD = ?, ADDRESS = ?, TEL = ?, ID = ?";
	private final String DELETE = "DELETE FROM MEMBER WHERE ID = ?"; 
	
	//인서트
	public int insert(BlackVO vo) { 
		int n = 0;
		try {
			psmt = conn.prepareStatement(INSERT);
			psmt.setString(1, vo.getToUser());
			psmt.setString(2, vo.getFromUser());
			psmt.setString(3, vo.getTitle());
			psmt.setString(4, vo.getComm());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}
	
	private void close() { //DB연결을 끊어준다
		try {
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
