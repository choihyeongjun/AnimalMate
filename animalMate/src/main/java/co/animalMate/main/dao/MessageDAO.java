package co.animalMate.main.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.MessageVO;
import co.animalMate.vo.MessageVO;

public class MessageDAO extends DAO {
	private PreparedStatement psmt; //sql 명령문 실행
	private ResultSet rs; //select 후 결과셋 받기
	private MessageVO vo;
	
	//receive로 전체조회
	public List<MessageVO> selectByReceive(MessageVO vo){ //멤버리스트 전체를 가져오는 메소드
		List<MessageVO> list = new ArrayList<MessageVO>();
		try {
			psmt = conn.prepareStatement("SELECT * FROM MESSAGE WHERE RECEIVE = ?");
			psmt.setString(1, vo.getReceive());
			rs = psmt.executeQuery();
			while(rs.next()) {
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
	
	//send로 전체조회
	public List<MessageVO> selectBySend(MessageVO vo){ //멤버리스트 전체를 가져오는 메소드
		List<MessageVO> list = new ArrayList<MessageVO>();
		try {
			psmt = conn.prepareStatement("SELECT * FROM MESSAGE WHERE SEND = ?");
			psmt.setString(1, vo.getSend());
			rs = psmt.executeQuery();
			while(rs.next()) {
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
	
	private void close() { //DB연결을 끊어준다
		try {
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
