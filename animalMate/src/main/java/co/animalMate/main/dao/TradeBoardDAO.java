package co.animalMate.main.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import co.animalMate.common.DAO;
import co.animalMate.vo.TradeBoardVO;

public class TradeBoardDAO extends DAO {
	private PreparedStatement psmt; // sql 명령문 실행
	private ResultSet rs; // select 후 결과셋 받기
	private TradeBoardVO vo;
	
	//인서트
	public int ownerInsert(TradeBoardVO vo) { 
		int n = 0;
		try {
			psmt = conn.prepareStatement("INSERT INTO TRADEBOARD " + 
					"(CODE, BUYER, TITLE, TTIME, PRICE, COMM, SDATE, EDATE, STIME, ETIME, TTYPE, LOCATION1, LOCATION2) VALUES " + 
					"(TRADEBOARD_CODE.NEXTVAL, ?, ?, SYSDATE, ?, ?, ?, ?, ?, ?, '돌봐주세요', ?, ?)");
			psmt.setString(1, vo.getBuyer());
			psmt.setString(2, vo.getTitle());
			psmt.setInt(3, vo.getPrice());
			psmt.setString(4, vo.getComm());
			psmt.setString(5, vo.getSdate());
			psmt.setString(6, vo.getEdate());
			psmt.setString(7, vo.getStime());
			psmt.setString(8, vo.getEtime());
			psmt.setString(9, vo.getLocation1());
			psmt.setString(10, vo.getLocation2());
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
