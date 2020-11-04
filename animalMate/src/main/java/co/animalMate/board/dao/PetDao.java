package co.animalMate.board.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.PetVO;

public class PetDao extends DAO {
	private PreparedStatement psmt; // sql 명령문 실행
	private ResultSet rs; // select 후 결과셋 받기
	private PetVO vo;

	private final String SELECT_ALL = "SELECT * FROM PET";
	private final String SELECT = "SELECT * FROM PET WHERE ID = ? AND PASSWORD=?";
	private final String INSERT = "INSERT INTO PET VALUES(PET_CODE.NEXTVAL,?,?,?,?,?,?,?,?,?)";
	private final String UPDATE = "UPDATE PET SET ";
	private final String DELETE = "DELETE FROM PET WHERE ID=? AND NAME=?";

	// 전체값
	public List<PetVO> Search(PetVO vo) {
		List<PetVO> list = new ArrayList<PetVO>();
		try {
			psmt = conn.prepareStatement(SELECT_ALL);
			rs = psmt.executeQuery();
			if (rs.next()) {
				vo.setCode(rs.getInt("code"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gende"));
				vo.setType(rs.getString("type"));
				vo.setDetailType(rs.getString("detailType"));
				vo.setCut(rs.getString("cut"));
				vo.setComm(rs.getString("comm"));
				vo.setId(rs.getString("id"));
				vo.setPic(rs.getString("pic"));
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 값 입력
	public int insert(PetVO vo) {
		int n = 0;
		try {
			psmt = conn.prepareStatement(INSERT);
			
			psmt.setString(1, vo.getName());
			psmt.setInt(2, vo.getAge());
			psmt.setString(3, vo.getGender());
			psmt.setString(4, vo.getType());
			psmt.setString(5, vo.getDetailType());
			psmt.setString(6, vo.getCut());
			psmt.setString(7, vo.getComm());
			psmt.setString(8, vo.getId());
			psmt.setString(9, vo.getPic());

			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}

	// 업데이트
	public int update(PetVO vo) {
		int n = 0;
		try {
			psmt = conn.prepareStatement(UPDATE);
			psmt.setString(1, vo.getName());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	// 값 삭제
	public int delete(PetVO vo) {
		int n = 0;
		try {
			psmt = conn.prepareStatement(DELETE);
			psmt.setString(1, vo.getId());
			psmt.setString(2, vo.getName());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	private void close() { // DB연결을 끊어준다
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
