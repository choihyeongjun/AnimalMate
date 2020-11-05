package co.animalMate.main.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.BlackVO;
import co.animalMate.vo.MemberVO;
import co.animalMate.vo.NoticeVO;

public class NoticeDAO extends DAO {
	private PreparedStatement psmt; // sql 명령문 실행
	private ResultSet rs; // select 후 결과셋 받기
	private NoticeVO vo;

	private final String SELECT_ALL = "SELECT * FROM NOTICE";
	private final String SELECT_ALL2 = "select * from(select a.*, rownum rn from ("
			+ "SELECT * FROM NOTICE order by code"
			+ ") a ) b where rn between ? and ?";

	// 전체선택
	public List<NoticeVO> selectAll() { // 멤버리스트 전체를 가져오는 메소드
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		try {
			psmt = conn.prepareStatement(SELECT_ALL);
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new NoticeVO();
				vo.setCode(rs.getInt("code"));
				vo.setComm(rs.getString("comm"));
				vo.setCount(rs.getInt("count"));
				vo.setDay(rs.getString("day"));
				vo.setTitle(rs.getString("title"));
				vo.setType(rs.getString("type"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	// 전체선택(페이징)
		public List<NoticeVO> selectAll(NoticeVO nvo) { // 멤버리스트 전체를 가져오는 메소드
			List<NoticeVO> list = new ArrayList<NoticeVO>();
			try {
				psmt = conn.prepareStatement(SELECT_ALL2);
				psmt.setInt(1, nvo.getFirst());
				psmt.setInt(2, nvo.getLast());
				rs = psmt.executeQuery();
				while (rs.next()) {
					vo = new NoticeVO();
					vo.setCode(rs.getInt("code"));
					vo.setComm(rs.getString("comm"));
					vo.setCount(rs.getInt("count"));
					vo.setDay(rs.getString("day"));
					vo.setTitle(rs.getString("title"));
					vo.setType(rs.getString("type"));
					list.add(vo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return list;
		}

	// 게시판 태그 관련
	public int count(NoticeVO vo) {
		int cnt = 0;
		try {
			String sql = "select count(*) from notice";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
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
