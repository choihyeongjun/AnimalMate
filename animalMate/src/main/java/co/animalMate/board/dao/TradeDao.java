package co.animalMate.board.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import co.animalMate.common.DAO;
import co.animalMate.vo.MemberVO;
import co.animalMate.vo.TradeBoardVO;
import co.animalMate.vo.TradeVO;

public class TradeDao extends DAO {
	private PreparedStatement psmt; //sql 명령문 실행
	private ResultSet rs; //select 후 결과셋 받기
	private TradeVO vo;
	
	private final String INSERT = "INSERT INTO TRADE("+", BUYER, NAME, ZOOMIN1,ZOOMIN2, TEL, LOCATION1,LOCATION2,EMAIL) VALUES (?,?,?,?,?,?,?,?,?)";
	
	//인서트
		public int insert(TradeVO tradevo) { 
			int n = 0;
			try {
				psmt = conn.prepareStatement(INSERT);
				psmt.setString(1, vo.getId());
				psmt.setString(2, vo.getPw());
				psmt.setString(3, vo.getName());
				psmt.setString(4, vo.getTel() );
				psmt.setInt(5, vo.getZoomin1());
				psmt.setInt(6, vo.getZoomin2());
				psmt.setString(7, vo.getLocation1());
				psmt.setString(8, vo.getLocation2());
				psmt.setString(9, vo.getEmail());
				
				n = psmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return n;
		}
		
		
		//DB자원해제
		private void close() { 
			try {
				if(rs != null) rs.close();
				if(psmt != null) psmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
}
