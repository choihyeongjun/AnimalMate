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
	
	
	private final String SELECTQ = "SELECT * FROM QUESTION where SEND=? and TITLE=?";
	private final String SELECTCODE = "SELECT * FROM QUESTION WHERE CODE=?";
	private final String SELECT = "SELECT * FROM QUESTION";
	private final String SELECTSEARCH="SELECT * FROM QUESTION WHERE STATUS=?";
	private final String INSERT = "INSERT INTO QUESTION(CODE, SEND, TTYPE, TITLE, COMM, STATUS,TTIME) VALUES(QUESTION_SEQ.nextval,?,?,?,?,?,sysdate)";
	private final String UPDATE = "UPDATE MEMBER SET NAME = ?, PASSWORD = ?, ADDRESS = ?, TEL = ?, ID = ?";
	private final String DELETE = "DELETE FROM MEMBER WHERE ID = ?"; 
	
	public QuestionVO selectcode(QuestionVO vo){
		try {
			psmt=conn.prepareStatement(SELECTCODE);
			psmt.setInt(1,vo.getCode());
			rs=psmt.executeQuery();
			if(rs.next()) {
				vo.setCode(rs.getInt("code"));
				vo.setSend(rs.getString("send"));
				vo.setTtype(rs.getString("ttype"));
				vo.setTitle(rs.getString("title"));
				vo.setComm(rs.getString("comm"));
				vo.setStatus(rs.getString("status"));
				vo.setTtime(rs.getString("ttime"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return vo;
	}
	
	public List<QuestionVO> selectAll(QuestionVO vo){
		List<QuestionVO>list=new ArrayList<>();
		try {
			psmt=conn.prepareStatement(SELECTSEARCH);
			psmt.setString(1, vo.getStatus());
			rs=psmt.executeQuery();
			while(rs.next()) {
				QuestionVO vo1=new QuestionVO();
				vo1.setCode(rs.getInt("code"));
				vo1.setSend(rs.getString("send"));
				vo1.setTtype(rs.getString("ttype"));
				vo1.setTitle(rs.getString("title"));
				vo1.setComm(rs.getString("comm"));
				vo1.setStatus(rs.getString("status"));
				vo1.setTtime(rs.getString("ttime"));
				list.add(vo1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
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
	
	public List<QuestionVO> select(QuestionVO vo){
		List<QuestionVO>list=new ArrayList<>();
		try {
			psmt=conn.prepareStatement(SELECTQ);
			psmt.setString(1, vo.getSend());
			psmt.setString(2, vo.getTitle());
			rs=psmt.executeQuery();
			while(rs.next()) {
				QuestionVO vo1=new QuestionVO();
				vo1.setCode(rs.getInt("code"));
				vo1.setSend(rs.getString("send"));
				vo1.setTtype(rs.getString("ttype"));
				vo1.setTitle(rs.getString("title"));
				vo1.setComm(rs.getString("comm"));
				vo1.setStatus(rs.getString("status"));
				vo1.setTtime(rs.getString("ttime"));
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
