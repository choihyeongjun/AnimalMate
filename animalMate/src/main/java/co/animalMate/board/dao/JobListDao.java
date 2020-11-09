package co.animalMate.board.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.JoblistVO;



public class JobListDao extends DAO {
	private PreparedStatement psmt; // sql 명령문 실행
	private ResultSet rs; // select 후 결과셋 받기
	private JoblistVO vo;
	
	private final String SELECT = "SELECT * FROM JOBLIST WHERE CODE=?" ;
	
	//거래게시판 
	public JoblistVO selectAll(JoblistVO vo) {
		try {
			psmt = conn.prepareStatement(SELECT);
			psmt.setInt(1, vo.getCode());
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				vo = new JoblistVO();
				vo.setCode(rs.getInt("code"));
				vo.setConfirm(rs.getString("confirm"));
				vo.setComm(rs.getString("comm"));
				vo.setPic(rs.getString("pic"));

			}
		} catch (SQLException e) {//
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
