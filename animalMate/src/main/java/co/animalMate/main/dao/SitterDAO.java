package co.animalMate.main.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.SitterVO;
import co.animalMate.vo.SitterVO;

public class SitterDAO extends DAO  {
	private PreparedStatement psmt; //sql 명령문 실행
	private ResultSet rs; //select 후 결과셋 받기
	private SitterVO vo;
	private final String INSERT="INSERT INTO SITTER(ID,MAXP,STATUS,COMM) VALUES(?,?,?,?)";
	
	//시터리스트 설렉하기
	public List<SitterVO> selectSitterList(){ 
		List<SitterVO> list = new ArrayList<SitterVO>();
		try {
			psmt = conn.prepareStatement("SELECT B.* FROM MEMBERS A, SITTER B, TRADEBOARD C WHERE C.SELLER = B.ID and A.ID = B.ID and C.SELLER = A.ID and C.ttype = '돌봐줄게요' order by C.CODE desc");
			rs = psmt.executeQuery();
			while(rs.next()) {
				vo = new SitterVO();
				vo.setComm(rs.getString("comm"));
				vo.setMaxP(rs.getInt("maxp"));
				vo.setId(rs.getString("id"));
				vo.setStatus(rs.getString("status"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	//인서트
	public void insert(SitterVO vo) {
		try {
			psmt=conn.prepareStatement(INSERT);
			psmt.setString(1,vo.getId());
			psmt.setInt(2,vo.getMaxP());
			psmt.setString(3,"sitterwait");
			psmt.setString(4,vo.getComm());
			psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//아이디로 단 건 조회
	public SitterVO selectById(SitterVO vo) { 
		try {
			psmt = conn.prepareStatement("SELECT * FROM SITTER WHERE ID = ?");
			psmt.setString(1, vo.getId());
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo.setMaxP(rs.getInt("maxp"));
				vo.setStatus(rs.getString("status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
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
