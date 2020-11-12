package co.animalMate.login.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.BookMarkVO;


public class BookmarkDAO extends DAO {
	private PreparedStatement psmt; //sql 명령문 실행
	private ResultSet rs; //select 후 결과셋 받기
	private BookMarkVO vo;
	
	//프로필
	 public List<BookMarkVO> selectAllById(BookMarkVO vo){
	      List<BookMarkVO> list = new ArrayList<BookMarkVO>();
	      try {
	         
	         psmt=conn.prepareStatement("select * from bookmark where id =?");
	         psmt.setString(1, vo.getId());
	         rs=psmt.executeQuery();
	         while(rs.next()) {
	            vo = new BookMarkVO();
	            vo.setId(rs.getString("id"));
	            vo.setMarkId(rs.getString("markId"));
	        
	            list.add(vo);
	         }
	         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally{
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
