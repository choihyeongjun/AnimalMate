package co.animalMate.main.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import co.animalMate.common.DAO;
import co.animalMate.vo.SitterVO;

public class SitterDAO extends DAO  {
	private PreparedStatement psmt; //sql 명령문 실행
	private ResultSet rs; //select 후 결과셋 받기
	private SitterVO vo;
	
	//아이디로 단 건 조회
		public SitterVO selectById(SitterVO vo) { 
			try {
				psmt = conn.prepareStatement("SELECT * FROM SITTER WHERE ID = ?");
				psmt.setString(1, vo.getId());
				rs = psmt.executeQuery();
				if(rs.next()) {
					vo.setMaxP(rs.getInt("maxp"));
					vo.setStatus(rs.getString("status"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return vo;
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
