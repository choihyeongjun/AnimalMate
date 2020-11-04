package co.animalMate.board.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.MemberVO;
import co.animalMate.vo.TradeBoardVO;
import co.animalMate.vo.TradeVO;

public class BoardDao extends DAO {
	private PreparedStatement psmt; // sql 명령문 실행
	private ResultSet rs; // select 후 결과셋 받기
	private TradeBoardVO vo = new TradeBoardVO();;

	private final String SELECT = "SELECT * FROM TRADEBOARD";

	public List<TradeBoardVO> selectAll() {
		List<TradeBoardVO> list = new ArrayList<TradeBoardVO>();
		try {
			psmt = conn.prepareStatement(SELECT);
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo.setCode(rs.getInt("code")); //
				vo.setBuyer(rs.getString("buyer"));
				vo.setSeller(rs.getString("seller"));
				vo.setTitle(rs.getString("title"));
				vo.setPrice(rs.getInt("price"));
				vo.setComm(rs.getString("comm"));
				vo.setStatus(rs.getString("status"));
				vo.setStime(rs.getString("stime"));
				vo.setEtime(rs.getString("etime"));
				vo.setWtime(rs.getInt("wtime"));
				vo.setTtype(rs.getString("ttype"));
				vo.setLocation1(rs.getString("location1"));
				vo.setLocation2(rs.getString("location2"));
				// 다 담고나면 list 에 add시킴
				list.add(vo);
				// 위 while문에 rs가 있는동안에 계속 담아줌
			}
		} catch (SQLException e) {//
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
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
