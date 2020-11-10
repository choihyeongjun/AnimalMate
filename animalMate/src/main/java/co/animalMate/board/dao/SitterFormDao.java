package co.animalMate.board.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.BoardSearchVO;
import co.animalMate.vo.OwnerFormVO;
import co.animalMate.vo.SitterVO;



public class SitterFormDao extends DAO {
	private PreparedStatement psmt;
	private ResultSet rs;
private SitterVO vo;
	
	//아이디로 단 건 조회
		public SitterVO selectById(SitterVO vo) { 
			try {
				psmt = conn.prepareStatement("SELECT * FROM SITTER WHERE CODE = ?");
				psmt.setString(1, vo.getCode());
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

	// DB자원해제
	private void close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
