package co.animalMate.main.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.CommentsVO;
import co.animalMate.vo.TradeBoardVO;
import co.animalMate.vo.CommentsVO;

public class CommentsDAO extends DAO {
	private PreparedStatement psmt; // sql 명령문 실행
	private ResultSet rs; // select 후 결과셋 받기
	private CommentsVO vo;

	//code값으로 단문 select하기
	public CommentsVO selectByCode(CommentsVO vo) {
		try {
			psmt = conn.prepareStatement("SELECT * FROM COMMENTS WHERE CODE = ?");
			psmt.setInt(1, vo.getCode());
			rs = psmt.executeQuery();
			rs.next();
				vo.setScore(rs.getInt("score"));
				vo.setComm(rs.getString("comm"));
				vo.setPic(rs.getString("pic"));
				vo.setTitle(rs.getString("title"));				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
