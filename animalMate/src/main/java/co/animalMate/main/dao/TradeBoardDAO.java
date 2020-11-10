package co.animalMate.main.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.CommentsVO;
import co.animalMate.vo.TradeBoardVO;
import co.animalMate.vo.TradeBoardVO;

public class TradeBoardDAO extends DAO {
	private PreparedStatement psmt; // sql 명령문 실행
	private ResultSet rs; // select 후 결과셋 받기
	private TradeBoardVO vo;
	
	//id로 select하기
			public List<TradeBoardVO> selectById(TradeBoardVO vo){
				List<TradeBoardVO> list = new ArrayList<TradeBoardVO>();
				try {
					
					psmt=conn.prepareStatement("SELECT * FROM TRADEBOARD WHERE SELLER = ? and status = '거래완료'");
					psmt.setString(1, vo.getSeller());
					rs = psmt.executeQuery();
					while(rs.next()) {
						vo = new TradeBoardVO();
						vo.setCode(rs.getInt("code"));
						list.add(vo);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}finally{
					close();
				}
				return list;
			}
	
	//인서트
	public int ownerInsert(TradeBoardVO vo) { 
		int n = 0;
		try {
			//시퀀스 조회
			psmt = conn.prepareStatement("select tradeboard_code.nextval from dual");
			ResultSet rs = psmt.executeQuery();
			rs.next();
			int code = rs.getInt(1); //설렉트해온 첫 번째 컬럼
			vo.setCode(code);
			
			//인서트 쿼리
			psmt = conn.prepareStatement("INSERT INTO TRADEBOARD " + 
					"(CODE, BUYER, TITLE, TTIME, PRICE, COMM, SDATE, EDATE, STIME, ETIME, TTYPE, LOCATION1, LOCATION2) VALUES " + 
					"(?, ?, ?, SYSDATE, ?, ?, ?, ?, ?, ?, '돌봐주세요', ?, ?)");
			psmt.setInt(1, vo.getCode());
			psmt.setString(2, vo.getBuyer());
			psmt.setString(3, vo.getTitle());
			psmt.setInt(4, vo.getPrice());
			psmt.setString(5, vo.getComm());
			psmt.setString(6, vo.getSdate());
			psmt.setString(7, vo.getEdate());
			psmt.setString(8, vo.getStime());
			psmt.setString(9, vo.getEtime());
			psmt.setString(10, vo.getLocation1());
			psmt.setString(11, vo.getLocation2());
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
