package co.animalMate.main.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.MessageVO;
import co.animalMate.vo.MessageVO;
import co.animalMate.vo.NoticeVO;
import co.animalMate.vo.MessageVO;

public class MessageDAO extends DAO {
	private PreparedStatement psmt; // sql 명령문 실행
	private ResultSet rs; // select 후 결과셋 받기
	private MessageVO vo;

//	// receive로 전체조회(원본)
//	public List<MessageVO> selectByReceive(MessageVO vo) { // 멤버리스트 전체를 가져오는 메소드
//		List<MessageVO> list = new ArrayList<MessageVO>();
//		try {
//			psmt = conn.prepareStatement("SELECT * FROM MESSAGE WHERE RECEIVE = ?");
//			psmt.setString(1, vo.getReceive());
//			rs = psmt.executeQuery();
//			while (rs.next()) {
//				vo = new MessageVO();
//				vo.setCode(rs.getInt("code"));
//				vo.setComm(rs.getString("comm"));
//				vo.setReceive(rs.getString("receive"));
//				vo.setSend(rs.getString("send"));
//				vo.setStatus(rs.getString("status"));
//				vo.setTtime(rs.getString("ttime"));
//				vo.setTitle(rs.getString("title"));
//				list.add(vo);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//		return list;
//	}

	// receive로 전체조회(페이징)
	public List<MessageVO> selectByReceive(MessageVO vo) { // 멤버리스트 전체를 가져오는 메소드
		List<MessageVO> list = new ArrayList<MessageVO>();
		try {
			psmt = conn.prepareStatement("select * from(select a.*, rownum rn from ( "
					+ "SELECT * FROM MESSAGE WHERE RECEIVE = ? ORDER BY CODE DESC"
					+ ") a ) b where rn between ? and ?");
			int pos =1;
			psmt.setString(pos++, vo.getReceive());
			psmt.setInt(pos++, vo.getFirst());
			psmt.setInt(pos++, vo.getLast());
			
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new MessageVO();
				vo.setCode(rs.getInt("code"));
				vo.setComm(rs.getString("comm"));
				vo.setReceive(rs.getString("receive"));
				vo.setSend(rs.getString("send"));
				vo.setStatus(rs.getString("status"));
				vo.setTtime(rs.getString("ttime"));
				vo.setTitle(rs.getString("title"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	//receive페이지 번호 추출기
	public int countReceive(MessageVO vo) {
		int cnt = 0;
		try {
			String sql = "SELECT COUNT(*) FROM MESSAGE WHERE RECEIVE = ?";
			psmt = conn.prepareStatement(sql);
			int pos =1;
			psmt.setString(pos++, vo.getReceive());
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

//	// send로 전체조회
//	public List<MessageVO> selectBySend(MessageVO vo) { // 멤버리스트 전체를 가져오는 메소드
//		List<MessageVO> list = new ArrayList<MessageVO>();
//		try {
//			psmt = conn.prepareStatement("SELECT * FROM MESSAGE WHERE SEND = ?");
//			psmt.setString(1, vo.getSend());
//			rs = psmt.executeQuery();
//			while (rs.next()) {
//				vo = new MessageVO();
//				vo.setCode(rs.getInt("code"));
//				vo.setComm(rs.getString("comm"));
//				vo.setReceive(rs.getString("receive"));
//				vo.setSend(rs.getString("send"));
//				vo.setStatus(rs.getString("status"));
//				vo.setTtime(rs.getString("ttime"));
//				vo.setTitle(rs.getString("title"));
//				list.add(vo);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//		return list;
//	}
	
	// send로 전체조회(페이징)
	public List<MessageVO> selectBySend(MessageVO vo) { // 멤버리스트 전체를 가져오는 메소드
		List<MessageVO> list = new ArrayList<MessageVO>();
		try {
			psmt = conn.prepareStatement("select * from(select a.*, rownum rn from ( "
					+ "SELECT * FROM MESSAGE WHERE SEND = ? ORDER BY CODE DESC"
					+ ") a ) b where rn between ? and ?");
			int pos =1;
			psmt.setString(pos++, vo.getSend());
			psmt.setInt(pos++, vo.getFirst());
			psmt.setInt(pos++, vo.getLast());
			
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new MessageVO();
				vo.setCode(rs.getInt("code"));
				vo.setComm(rs.getString("comm"));
				vo.setReceive(rs.getString("receive"));
				vo.setSend(rs.getString("send"));
				vo.setStatus(rs.getString("status"));
				vo.setTtime(rs.getString("ttime"));
				vo.setTitle(rs.getString("title"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	//send페이지 번호 추출기
	public int countSend(MessageVO vo) {
		int cnt = 0;
		try {
			String sql = "SELECT COUNT(*) FROM MESSAGE WHERE SEND = ?";
			psmt = conn.prepareStatement(sql);
			int pos =1;
			psmt.setString(pos++, vo.getSend());
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
	
	//code로 단건 조회
	public MessageVO selectByCode(MessageVO vo) { 
		try {
			psmt = conn.prepareStatement("SELECT * FROM MESSAGE WHERE CODE = ?");
			psmt.setInt(1, vo.getCode());
			rs = psmt.executeQuery();
			rs.next();
				vo.setComm(rs.getString("comm"));
				vo.setReceive(rs.getString("receive"));
				vo.setSend(rs.getString("send"));
				vo.setTitle(rs.getString("title"));
				vo.setStatus(rs.getString("status"));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
	}
	
	//인서트
	public int insert(MessageVO vo) { 
		int n = 0;
		try {
			psmt = conn.prepareStatement("insert into message "
					+ "(code, send, receive, comm, title) values(message_code.nextval,?,?,?,?)");
			int cnt = 1;
			psmt.setString(cnt++, vo.getSend());
			psmt.setString(cnt++, vo.getReceive());
			psmt.setString(cnt++, vo.getComm());
			psmt.setString(cnt++, vo.getTitle());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}
	
	//인서트
		public int updateStatus(MessageVO vo) { 
			int n = 0;
			try {
				psmt = conn.prepareStatement("update message set "
						+ "status = '확인' where code=?");
				int cnt = 1;
				psmt.setInt(cnt, vo.getCode());
				n = psmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
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
