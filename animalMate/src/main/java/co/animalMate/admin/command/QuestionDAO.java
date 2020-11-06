package co.animalMate.admin.command;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.QuestionVO;

public class QuestionDAO extends DAO {
	private PreparedStatement psmt; //sql 명령문 실행
	private ResultSet rs; //select 후 결과셋 받기
	
	

	private final String SELECT = "SELECT * FROM QUESTION";
	private final String INSERT = "INSERT INTO QUESTION(CODE, SEND, TTYPE, TITLE, COMM, STATUS,TTIME) VALUES(QUESTION_SEQ.nextval,?,?,?,?,?,sysdate)";
	private final String UPDATE = "UPDATE MEMBER SET NAME = ?, PASSWORD = ?, ADDRESS = ?, TEL = ?, ID = ?";
	private final String DELETE = "DELETE FROM MEMBER WHERE ID = ?"; 
	
	public List<QuestionVO> selectAll(){
		List<QuestionVO>list=new ArrayList<>();
		try {
			psmt=conn.prepareStatement(SELECT);
			rs=psmt.executeQuery();
			while(rs.next()) {
				QuestionVO vo=new QuestionVO();
				vo.setCode(rs.getInt("code"));
				vo.setSend(rs.getString("send"));
				vo.setTtype(rs.getString("ttype"));
				vo.setTitle(rs.getString("title"));
				vo.setComm(rs.getString("comm"));
				vo.setStatus(rs.getString("status"));
				vo.setTtime(rs.getString("ttime"));
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	//인서트
	public void insert(QuestionVO vo) { 
		
		try {
			psmt = conn.prepareStatement(INSERT);
			psmt.setString(1, vo.getSend());
			psmt.setString(2, vo.getTtype());
			psmt.setString(3, vo.getTitle());
			psmt.setString(4, vo.getComm());
			psmt.setString(5, vo.getStatus());
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	
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
