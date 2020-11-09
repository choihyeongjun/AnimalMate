package co.animalMate.main.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import co.animalMate.common.DAO;
import co.animalMate.vo.JoblistVO;
import co.animalMate.vo.TradeBoardVO;
import co.animalMate.vo.JoblistVO;

public class JoblistDAO extends DAO {
	private PreparedStatement psmt; // sql 명령문 실행
	private ResultSet rs; // select 후 결과셋 받기
	private JoblistVO vo;
	
	//인서트
	public int ownerInsert(JoblistVO vo) { 
		int n = 0;
		try {
			psmt = conn.prepareStatement("INSERT INTO JOBLIST " + 
					"(CODE, COMM) VALUES " + 
					"(TRADEBOARD_CODE.CURRVAL-1, ?)");
			psmt.setString(1, vo.getComm());
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
