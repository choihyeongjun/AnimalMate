package co.animalMate.main.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import co.animalMate.common.DAO;
import co.animalMate.vo.PetCodeVO;

public class PetCodeDAO extends DAO {
	private PreparedStatement psmt; // sql 명령문 실행
	private ResultSet rs; // select 후 결과셋 받기
	private PetCodeVO vo;
	
	//인서트
	public int ownerInsert(PetCodeVO vo) { 
		int n = 0;
		try {
			psmt = conn.prepareStatement("INSERT INTO PETCODE " + 
					"(CODE, PETCODE) VALUES " + 
					"(TRADEBOARD_CODE.CURRVAL, ?)");
			psmt.setInt(1, vo.getPetCode());
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
