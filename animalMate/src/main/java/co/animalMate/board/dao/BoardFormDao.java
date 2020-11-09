package co.animalMate.board.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.BoardSearchVO;
import co.animalMate.vo.OwnerFormVO;



public class BoardFormDao extends DAO {
	private PreparedStatement psmt;
	private ResultSet rs;
	private OwnerFormVO vo;
	
	
	private final String SELECT = "SELECT A.CODE, A.TITLE, A.BUYER, B.NAME, B.AGE, B.GENDER, B.TYPE, B.PIC, B.CUT, "
														+" A.LOCATION1, A.LOCATION2, TO_CHAR(A.SDATE,'YYYY-MM-DD') AS SDATE, "
														+ "TO_CHAR(A.EDATE,'YYYY-MM-DD') AS EDATE,"
														+ " A.STIME, A.ETIME, A.PRICE, A.BUYER, "
														+ "B.COMM FROM TRADEBOARD A"
														+ " INNER JOIN PET B"
														+ " ON A.BUYER = B.ID "
														+ "WHERE A.CODE =?";

	//반려인글 상세보기
	public List<OwnerFormVO> selectAll(OwnerFormVO vo) {
		List<OwnerFormVO> list = new ArrayList<OwnerFormVO>();
		try {
			psmt = conn.prepareStatement(SELECT);
			psmt.setString(1, vo.getCode());
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				vo = new OwnerFormVO();
				vo.setCode(rs.getString("code"));//
				vo.setPic(rs.getString("pic"));//
				vo.setTitle(rs.getString("title"));//
				vo.setName(rs.getString("name"));//
				vo.setAge(rs.getInt("age"));//
				vo.setBuyer(rs.getString("buyer"));//
				vo.setGender(rs.getNString("gender"));//
				vo.setType(rs.getString("type"));//
				vo.setCut(rs.getNString("cut"));//
				vo.setLocation1(rs.getString("location1"));//
				vo.setLocation2(rs.getString("location2"));//
				vo.setSdate(rs.getString("sdate"));//
				vo.setEdate(rs.getString("edate"));//
				vo.setStime(rs.getString("stime"));//
				vo.setEtime(rs.getString("etime"));//
				vo.setPrice(rs.getInt("price"));//
				vo.setBuyer(rs.getString("buyer"));
				vo.setComm(rs.getString("comm"));

				list.add(vo);
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
