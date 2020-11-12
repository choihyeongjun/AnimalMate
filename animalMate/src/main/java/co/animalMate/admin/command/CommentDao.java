package co.animalMate.admin.command;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.CommentsVO;
import co.animalMate.vo.PetVO;
import co.animalMate.vo.QuestionVO;
import co.animalMate.vo.TradeBoardVO;

public class CommentDao extends DAO {
	private PreparedStatement psmt; // sql 명령문 실행
	private ResultSet rs; // select 후 결과셋 받기
	private PetVO vo;
	
	private final String INSERT="INSERT INTO COMMENTS VALUES(?,?,?,?,?)";
	private final String SELECT="SELECT C.CODE,C.TITLE,C.SCORE,C.COMM,C.PIC,T.BUYER,T.SELLER FROM COMMENTS C,TRADEBOARD T WHERE T.CODE=C.CODE";
	public List<Object>select(){
		List<Object>list=new ArrayList<>();
		try {
			psmt=conn.prepareStatement(SELECT);
			rs=psmt.executeQuery();
			while(rs.next()) {
				CommentsVO vo=new CommentsVO();
				TradeBoardVO tvo=new TradeBoardVO();
				vo.setCode(rs.getInt("code"));
				vo.setTitle(rs.getString("title"));
				vo.setScore(rs.getInt("score"));
				vo.setComm(rs.getString("comm"));
				vo.setPic(rs.getString("pic"));
				tvo.setBuyer(rs.getString("buyer"));
				tvo.setSeller(rs.getString("seller"));
				list.add(vo);
				list.add(tvo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close();
		}
		return list;
	}
	public void insert(CommentsVO vo) { 
		
		try {
			psmt = conn.prepareStatement(INSERT);
			psmt.setInt(1, vo.getCode());
			psmt.setInt(2, vo.getScore());
			psmt.setString(3, vo.getComm());
			psmt.setString(4, vo.getPic());
			psmt.setString(5, vo.getTitle());
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	
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
