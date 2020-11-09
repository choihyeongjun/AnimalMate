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


public class BoardDao extends DAO {
	private PreparedStatement psmt; // sql 명령문 실행
	private ResultSet rs; // select 후 결과셋 받기
	private OwnerListVO vo;
	public BoardSearchVO serarchvo;
	
	private final String SELECT =  "SELECT A.PRICE, A.CODE, A.STIME, A.ETIME, A.LOCATION1, TO_CHAR(A.SDATE,'MM-DD') AS SDATE,"
														+ " TO_CHAR(A.EDATE,'MM-DD') AS EDATE , A.STATUS, B.TYPE, B.PIC  "
														+ "FROM TRADEBOARD A "
														+ "INNER JOIN PET B ON A.BUYER = B.ID";
	
	private final String SEARCH =  "SELECT A.PRICE, A.CODE, A.STIME, A.ETIME, A.LOCATION1, TO_CHAR(A.SDATE,'MM-DD') AS SDATE,"
														+ " TO_CHAR(A.EDATE,'MM-DD') AS EDATE , A.STATUS, B.TYPE, B.PIC  "
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
				vo.setPrice(rs.getInt("price"));
				vo.setCode(rs.getInt("code"));
				vo.setStime(rs.getString("stime"));
				vo.setEtime(rs.getString("etime"));
				vo.setLocation1(rs.getString("location1"));
				vo.setSdate(rs.getString("sdate"));
				vo.setEdate(rs.getString("edate"));
				vo.setType(rs.getString("type"));
				vo.setPic(rs.getString("pic"));
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
			psmt.setString(2,serarchvo.getStime());
			psmt.setString(3,serarchvo.getEtime());
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				serarchvo = new BoardSearchVO();
				serarchvo.setPic(rs.getString("pic"));
				serarchvo.setCode(rs.getInt("code"));
				serarchvo.setType(rs.getString("type"));
				serarchvo.setPrice(rs.getInt("price"));
				serarchvo.setSdate(rs.getString("sdate"));
				serarchvo.setEdate(rs.getString("edate"));
				serarchvo.setStime(rs.getString("stime"));
				serarchvo.setEtime(rs.getString("etime"));
				serarchvo.setLocation1(rs.getString("location1"));
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
			+ "STIME,ETIME,WTIME,TTYPE,LOCATION1) "
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
		psmt.setString(10, insertvo.getLocation1());
		

		
		
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
