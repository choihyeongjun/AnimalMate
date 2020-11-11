package co.animalMate.board.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.SitterFormViewVO;
import co.animalMate.vo.SitterVO;



public class SitterFormDao extends DAO {
	private PreparedStatement psmt;
	private ResultSet rs;
	private SitterFormViewVO vo;
	private final String SELECT =  "SELECT A.TITLE, A.LOCATION1, A.PRICE, A.COMM, A.STATUS, TO_CHAR(A.SDATE,'MM-DD') AS SDATE, TO_CHAR(A.EDATE,'MM-DD') AS EDATE, A.STIME, A.ETIME, A.CODE,"
														+ "B.NAME,B.ZOOMIN1,B.ZOOMIN2,B.PIC AS MPIC, C.MAXP,D.SCORE,E.PIC AS EPIC "
														+ "FROM TRADEBOARD A, MEMBERS B, SITTER C,COMMENTS D, PICTURE E "
														+ "WHERE A.SELLER = B.ID AND B.ID = C.ID AND A.CODE = D.CODE AND B.ID = E.ID AND A.CODE=?";
	
	
	//sitterFormView select
	public List<SitterFormViewVO> selectAll(SitterFormViewVO vo) {
		String zoomin1;
		String zoomin2;
		int birthYear;
		int year;
		int age;
		List<SitterFormViewVO> list = new ArrayList<SitterFormViewVO>();
		try {
			psmt = conn.prepareStatement(SELECT);
			psmt.setInt(1,vo.getCode());
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new SitterFormViewVO();
				vo.setTitle(rs.getString("title"));
				vo.setLocation1(rs.getString("location1"));
				vo.setPrice(rs.getInt("price"));
				vo.setComm(rs.getString("comm"));
				vo.setStatus(rs.getString("status"));
				vo.setSdate(rs.getString("sdate"));
				vo.setEdate(rs.getString("edate"));
				vo.setStime(rs.getString("stime"));
				vo.setEtime(rs.getString("etime"));
				vo.setCode(rs.getInt("code"));
				vo.setname(rs.getString("name"));
				vo.setZoomin1(rs.getString("zoomin1"));
				
				
				zoomin2 = rs.getString("zoomin2");
				if(zoomin2.substring(0, 1).equals("1") || zoomin2.substring(0, 1).equals("3")) {
					zoomin2 = "남성";
				} else {
					zoomin2 = "여성";
				}
				vo.setZoomin2(zoomin2);
				
				
				vo.setMaxp(rs.getInt("maxp"));
				vo.setScore(rs.getInt("score"));
				vo.setMpic(rs.getString("mpic"));
				vo.setEpic(rs.getString("epic"));

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
