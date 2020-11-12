package co.animalMate.board.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.BoardSearchVO;
import co.animalMate.vo.OwnerListVO;
import co.animalMate.vo.SitterListVO;


public class BoardDao extends DAO {
	private PreparedStatement psmt; // sql 명령문 실행
	private ResultSet rs; // select 후 결과셋 받기
	private OwnerListVO vo;
	private SitterListVO sitvo;
	private BoardSearchVO serarchvo;
	
	private final String SELECT =  "SELECT A.PRICE, A.CODE, A.STIME, A.ETIME, A.LOCATION1, TO_CHAR(A.SDATE,'MM-DD') AS SDATE,"
														+ " TO_CHAR(A.EDATE,'MM-DD') AS EDATE , A.STATUS, B.TYPE, B.PIC  "
														+ "FROM TRADEBOARD A "
														+ "INNER JOIN PET B ON A.BUYER = B.ID";
	
	private final String SEARCH =  "SELECT A.PRICE, A.CODE, A.STIME, A.ETIME, A.LOCATION1, TO_CHAR(A.SDATE,'MM-DD') AS SDATE,"
														+ " TO_CHAR(A.EDATE,'MM-DD') AS EDATE , A.STATUS, B.TYPE, B.PIC  "
														+ "FROM TRADEBOARD A INNER JOIN PET B "
														+ "ON A.BUYER = B.ID"
														+ " WHERE B.TYPE =? AND (A.STIME >=?  AND  A.ETIME <=?)";
	
	private final String SITSELECT = "SELECT A.NNAME, A.PIC, C.CODE, B.MAXP, C.LOCATION1, TO_CHAR(C.SDATE,'MM-DD') AS SDATE, TO_CHAR(C.EDATE,'MM-DD')AS EDATE,  "
															+ "C.STIME, C.ETIME,   C.PRICE,  C.STATUS FROM MEMBERS A, SITTER B, TRADEBOARD C WHERE A.ID = B.ID AND B.ID = C.SELLER";
	
	private final String SITSEARCH = "SELECT A.NNAME, A.PIC, B.MAXP, C.LOCATION1, TO_CHAR(C.SDATE,'MM-DD') AS SDATE, TO_CHAR(C.EDATE,'MM-DD')AS EDATE,  "
															+ "C.STIME, C.ETIME,   C.PRICE,  C.STATUS FROM MEMBERS A, SITTER B, TRADEBOARD C "
															+ "WHERE A.ID = B.ID AND B.ID = C.SELLER AND (C.STIME >=?  AND  C.ETIME <= ?) AND B.MAXP=?";

	
	
	//ownerList 전체 리스트 select
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
	

	//ownerList 상세 검색 select
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
	

	//sitterList 전체 리스트 select
	public List<SitterListVO> sitselectAll() {
		List<SitterListVO> list = new ArrayList<SitterListVO>();
		try {
			psmt = conn.prepareStatement(SITSELECT);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				sitvo = new SitterListVO();
				sitvo.setNname(rs.getString("nname"));
				sitvo.setPic(rs.getString("pic"));
				sitvo.setMaxp(rs.getInt("maxp"));
				sitvo.setCode(rs.getInt("code"));
				sitvo.setLocation1(rs.getString("location1"));
				sitvo.setSdate(rs.getString("sdate"));
				sitvo.setEdate(rs.getString("edate"));
				sitvo.setStime(rs.getString("stime"));
				sitvo.setEtime(rs.getString("etime"));
				sitvo.setPrice(rs.getInt("price"));
				sitvo.setStatus(rs.getString("status"));
				list.add(sitvo);
			}
		} catch (SQLException e) {//
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	//sitterList 상세 검색 select
	public List<BoardSearchVO> sitsearch(BoardSearchVO serarchvo) {
		List<BoardSearchVO> list = new ArrayList<BoardSearchVO>();
		
		try {
			psmt = conn.prepareStatement(SITSEARCH);
			psmt.setString(1,serarchvo.getStime());
			psmt.setString(2,serarchvo.getEtime());
			psmt.setString(3,serarchvo.getMaxp());
			rs = psmt.executeQuery();
			while (rs.next()) {
				serarchvo = new BoardSearchVO();
				serarchvo.setPic(rs.getString("pic"));
				//serarchvo.setCode(rs.getInt("code"));
				serarchvo.setMaxp(rs.getString("maxp"));
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
