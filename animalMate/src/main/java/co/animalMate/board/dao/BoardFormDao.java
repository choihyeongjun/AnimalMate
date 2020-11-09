package co.animalMate.board.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.BoardSearchVO;
import co.animalMate.vo.OwnerInsertVO;
import co.animalMate.vo.OwnerListVO;
import co.animalMate.vo.TradeBoardVO;


public class BoardFormDao extends DAO {
	private PreparedStatement psmt; // sql 명령문 실행
	private ResultSet rs; // select 후 결과셋 받기
	private OwnerListVO vo;
	public BoardSearchVO serarchvo;
	
	private final String SELECT =  "SELECT A.PRICE, A.WTIME, A.LOCATION2 , A.STATUS, B.TYPE, B.PIC"
									+ " FROM TRADEBOARD A"
									+ " INNER JOIN PET B  "
									+ "ON A.BUYER = B.ID ";
	
	private final String SEARCH =  "SELECT A.PRICE, A.WTIME, A.LOCATION2 , A.STATUS, B.TYPE, B.PIC "
														+ "FROM TRADEBOARD A INNER JOIN PET B "
														+ "ON A.BUYER = B.ID"
														+ " WHERE B.TYPE =? AND A.STIME =? AND A.ETIME = ?";
	//거래게시판 
	public List<OwnerListVO> selectAll() {
		List<OwnerListVO> list = new ArrayList<OwnerListVO>();
		try {
			psmt = conn.prepareStatement(SELECT);
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new OwnerListVO();
				vo.setPic(rs.getString("pic"));
				vo.setType(rs.getString("type"));
				vo.setPrice(rs.getInt("price"));
				vo.setWtime(rs.getInt("wtime"));
				vo.setLocation2(rs.getString("location2"));
				vo.setStatus(rs.getString("status"));
				list.add(vo);
			}
		} catch (SQLException e) {//
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	

	//거래게시판 
	public List<BoardSearchVO> search(BoardSearchVO serarchvo) {
		List<BoardSearchVO> list = new ArrayList<BoardSearchVO>();
		
		try {
			psmt = conn.prepareStatement(SEARCH);
			psmt.setString(1,serarchvo.getType());
			psmt.setString(2,serarchvo.getSTime());
			psmt.setString(3,serarchvo.getETime());
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				serarchvo = new BoardSearchVO();
				serarchvo.setPic(rs.getString("pic"));
				serarchvo.setType(rs.getString("type"));
				serarchvo.setPrice(rs.getInt("price"));
				serarchvo.setWtime(rs.getInt("wtime"));
				serarchvo.setLocation2(rs.getString("location2"));
				serarchvo.setStatus(rs.getString("status"));
				list.add(serarchvo);
			}
		} catch (SQLException e) {//
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	

	
	
	private final String INSERT = "INSERT INTO TRADEBOARD "
			+ "(CODE,BUYER,TITLE,TTIME,PRICE,COMM,STATUS,"
			+ "STIME,ETIME,WTIME,TTYPE,LOCATION2) "
			+ "VALUES "
			+ "(BOARD_SEQ.NEXTVAL, ?,?,SYSDATE,?,?,?,"
			+ "?,?,?,?,?)";

	public int insert(OwnerInsertVO insertvo) {
		int n = 0;
		try {
		psmt = conn.prepareStatement(INSERT);
		psmt.setString(1,insertvo.getBuyer());
		psmt.setString(2,insertvo.getTitle());
		psmt.setInt(3, insertvo.getPrice());
		psmt.setString(4,insertvo.getComm());
		psmt.setString(5, insertvo.getStatus());
		psmt.setString(6, insertvo.getStime());
		psmt.setString(7, insertvo.getEtime());
		psmt.setInt(8, insertvo.getWtime());
		psmt.setString(9, insertvo.getTtype());
		psmt.setString(10, insertvo.getLocation2());
		

		
		
		n = psmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return n;
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
