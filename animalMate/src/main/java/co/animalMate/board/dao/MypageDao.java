package co.animalMate.board.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import co.animalMate.common.DAO;
import co.animalMate.vo.MemberVO;

public class MypageDao extends DAO {
	private PreparedStatement psmt; // sql 명령문 실행
	private ResultSet rs; // select 후 결과셋 받기
	private MemberVO memVo;

	private final String SELECT = "SELECT * FROM MEMBERS WHERE ID = ?";

	// User 정보 호출
	public MemberVO select(MemberVO memVo) {
		try {
			psmt = conn.prepareStatement(SELECT);
			psmt.setString(1, memVo.getId());
			rs = psmt.executeQuery();
			if (rs.next()) {
				memVo = new MemberVO();
				memVo.setId(rs.getString("id"));
				memVo.setPw(rs.getString("pw"));
				memVo.setName(rs.getString("name"));
				memVo.setnName(rs.getString("nName"));
				memVo.setTel(rs.getString("tel"));
				memVo.seteDate(rs.getString("eDate"));
				memVo.setAuthor(rs.getString("author"));
				memVo.setPoint(rs.getInt("point"));
				memVo.setStatus(rs.getString("status"));
				memVo.setLocation1(rs.getString("location1"));
				memVo.setLocation2(rs.getString("location2"));
				memVo.setEmail(rs.getString("email"));
				memVo.setPic(rs.getString("pic"));
				memVo.setZoomin1(rs.getInt("zoomin1"));
				memVo.setZoomin2(rs.getInt("zoomin2"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return memVo;
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
