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
	private TradeVO tradevo;
	

		
		
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
