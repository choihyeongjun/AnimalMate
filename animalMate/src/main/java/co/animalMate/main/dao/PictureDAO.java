package co.animalMate.main.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.PictureVO;
import co.animalMate.vo.PictureVO;
import co.animalMate.vo.PictureVO;

public class PictureDAO extends DAO  {
	private PreparedStatement psmt; //sql 명령문 실행
	private ResultSet rs; //select 후 결과셋 받기
	private PictureVO vo;
	
	public List<PictureVO> selectById(PictureVO vo){
		List<PictureVO> list = new ArrayList<PictureVO>();
		try {
			psmt=conn.prepareStatement("SELECT * FROM PICTURE WHERE ID = ?");
			psmt.setString(1, vo.getId());
			rs=psmt.executeQuery();
			while(rs.next()) {
				vo = new PictureVO();
				vo.setCode(rs.getInt("code"));
				vo.setId(rs.getString("id"));
				vo.setPic(rs.getString("pic"));
				list.add(vo);
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return list;
	}
	
	//인서트
	public int insert(PictureVO vo) { 
		int n = 0;
		try {
			psmt = conn.prepareStatement("INSERT INTO PICTURE(CODE, ID, PIC) VALUES(PICTURE_CODE.NEXTVAL, ?,?)");
			psmt.setString(1, vo.getId());
			psmt.setString(2, vo.getPic());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}
	
	//인서트
	public int deleteByPic(String pic) { 
		int n = 0;
		try {
			psmt = conn.prepareStatement("DELETE PICTURE WHERE PIC = ?");
			psmt.setString(1, pic);
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
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
