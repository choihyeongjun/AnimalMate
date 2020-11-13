package co.animalMate.main.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.ApplytradeVO;

public class ApplytradeDAO extends DAO {
	private PreparedStatement psmt; // sql 명령문 실행
	private ResultSet rs; // select 후 결과셋 받기
	private ApplytradeVO vo;
	
	// ID로 select하기
	public List<ApplytradeVO> selectById(ApplytradeVO vo) {
		List<ApplytradeVO> list = new ArrayList<ApplytradeVO>();
		try {
			psmt = conn.prepareStatement("SELECT * FROM APPLYTRADE WHERE ID = ?");
			psmt.setString(1, vo.getId());
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new ApplytradeVO();
				vo.setCode(rs.getInt("code"));
				vo.setId(rs.getString("id"));
				vo.setStatus(rs.getString("status"));
				vo.setTdate(rs.getString("tdate"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
		
	private void close() { // DB연결을 끊어준다
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
