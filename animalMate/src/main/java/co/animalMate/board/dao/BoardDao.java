package co.animalMate.board.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import co.animalMate.common.DAO;
import co.animalMate.vo.MemberVO;
import co.animalMate.vo.TradeBoardVO;
import co.animalMate.vo.TradeVO;

public class BoardDao extends DAO {
	private PreparedStatement psmt; //sql 명령문 실행
	private ResultSet rs; //select 후 결과셋 받기
	private TradeBoardVO vo;
	
	private final String INSERT = "INTO TRADEBOARD (CODE,TITLE,TTIME,PRICE,COMM,STATUS,STIME,ETIME,TTYPE,LOCATION1,LOCATION2) VALUES (tradeboard_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?,?)";
	
	//인서트
		public int insert(TradeBoardVO tradeBoarddvo) {
			int n = 0;
			try {
				psmt = conn.prepareStatement(INSERT);
				psmt.setString(1, vo.getTitle());
				psmt.setString(2, vo.getTtime());
				psmt.setInt(3, vo.getPrice());
				psmt.setString(4, vo.getComm());
				psmt.setString(5, vo.getStatus());
				psmt.setString(6, vo.getStime());
				psmt.setString(7, vo.getEtime());
				psmt.setString(8, vo.getTtype());
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
