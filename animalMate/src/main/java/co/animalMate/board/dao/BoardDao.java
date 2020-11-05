package co.animalMate.board.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.OwnerInsertVO;
import co.animalMate.vo.OwnerListVO;
import co.animalMate.vo.TradeBoardVO;


public class BoardDao extends DAO {
	private PreparedStatement psmt; // sql 명령문 실행
	private ResultSet rs; // select 후 결과셋 받기
	private OwnerListVO vo;

	
	private final String SELECT =  "SELECT A.PRICE, A.WTIME, A.LOCATION2 , A.STATUS, B.TYPE, B.PIC"
									+ " FROM TRADEBOARD A"
									+ " INNER JOIN PET B  "
									+ "ON A.BUYER = B.ID ";
	
	private final String INSERT;
	
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

	//게시판 INSRET
	public int insert(OwnerInsertVO vo) {//memberVO에 insert 하는것
		int n =0;
		try {
			psmt = conn.prepareStatement(INSERT);
			psmt.setString(1, vo.getId());
			psmt.setString(2, vo.getName());
			psmt.setString(3, vo.getPassword());
			psmt.setString(4, vo.getAddress());
			psmt.setString(5, vo.getTel());
			psmt.setDate(6, vo.getEnterdate());
			n = psmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return  n; //정수를 반환해줌 ex)n 행이 반환되었습니다
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
