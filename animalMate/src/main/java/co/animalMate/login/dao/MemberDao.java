package co.animalMate.login.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import co.animalMate.common.DAO;
import co.animalMate.vo.MemberVO;


public class MemberDao extends DAO {
	private PreparedStatement psmt; //sql 명령문 실행
	private ResultSet rs; //select 후 결과셋 받기
	private MemberVO vo;
	
	private final String SELECT_ALL = "SELECT * FROM MEMBERS";
	private final String SELECT = "SELECT * FROM MEMBERS WHERE ID = ? ";
	private final String INSERT = "INSERT INTO MEMBERS(ID, PW, NAME,NNAME,ZOOMIN1,ZOOMIN2, EMAIL,TEL, LOCATION1,LOCATION2) VALUES (?,?,?,?,?,?,?,?,?,?)";
	private final String RESETPW = "UPDATE MEMBERS SET PW = ?";
	private final String FINDID ="SELECT ID FROM MEMBERS WHERE NAME=? AND EMAIL=?";
	private final String FINDPW ="SELECT PW FROM MEMBERS WHERE ID=? AND NAME=? AND EMAIL=?";
	private final String OVERLAPID = "SELECT ID FROM MEMBERS WHERE ID = ?";
	private final String UPDATELIST = "UPDATE MEMBERS SET NNAME=?, TEL=?, LOCATION1=?,LOCATION2=?,EMAIL=?,PIC=? WHERE ID=?";
	private final String MARKLIST = "SELECT * FROM MEMBERS WHERE NAME=?, ZOOMIN1=?, LOCATION=?";
	
	
	public List<MemberVO> selectAll(){ //멤버리스트 전체를 가져오는 메소드
		List<MemberVO> list = new ArrayList<MemberVO>();
		try {
			psmt = conn.prepareStatement(SELECT_ALL);
			rs = psmt.executeQuery();
			while(rs.next()) {
				vo = new MemberVO();
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setName(rs.getString("name"));
				vo.setNName(rs.getString("nName"));
				vo.setTel(rs.getString("tel"));
				vo.seteDate(rs.getString("eDate"));
				vo.setAuthor(rs.getString("author"));
				vo.setPoint(rs.getInt("point"));
				vo.setStatus(rs.getString("status"));
				vo.setLocation1(rs.getString("location1"));
				vo.setLocation2(rs.getString("location2"));
				vo.setEmail(rs.getString("email"));
				vo.setPic(rs.getString("pic"));
				vo.setZoomin1(rs.getInt("zoomin1"));
				vo.setZoomin2(rs.getInt("zoomin2"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	//한 행을 검색할 때
	public MemberVO select(MemberVO mvo) { 
		MemberVO vo = null;
		try {
			psmt = conn.prepareStatement(SELECT);
			psmt.setString(1, mvo.getId());
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo = new MemberVO();
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setName(rs.getString("name"));
				vo.setNName(rs.getString("nName"));
				vo.setTel(rs.getString("tel"));
				vo.seteDate(rs.getString("eDate"));
				vo.setAuthor(rs.getString("author"));
				vo.setPoint(rs.getInt("point"));
				vo.setStatus(rs.getString("status"));
				vo.setLocation1(rs.getString("location1"));
				vo.setLocation2(rs.getString("location2"));
				vo.setEmail(rs.getString("email"));
				vo.setPic(rs.getString("pic"));
				vo.setZoomin1(rs.getInt("zoomin1"));
				vo.setZoomin2(rs.getInt("zoomin2"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
	}
	//회원가입
	public int insert(MemberVO vo) { 
		int n = 0;
		try {
			psmt = conn.prepareStatement(INSERT);
			psmt.setString(1, vo.getId());
			psmt.setString(2, vo.getPw());
			psmt.setString(3, vo.getName());
			psmt.setString(4, vo.getNname());
			psmt.setString(5, vo.getEmail());
			psmt.setString(6, vo.getTel() );
			psmt.setInt(7, vo.getZoomin1());
			psmt.setInt(8, vo.getZoomin2());
			psmt.setString(9, vo.getLocation1());
			psmt.setString(10, vo.getLocation2());

			
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}
	
	//비번 리셋
		public MemberVO resetPw(MemberVO vo) { 
			int n = 0;
			try {
				psmt = conn.prepareStatement(RESETPW);
				psmt.setString(1, vo.getPw());
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return vo;
		}
		
	
	//아이디찾기
	   public MemberVO findId(MemberVO vo){
	      try {
	         psmt = conn.prepareStatement(FINDID );
	         psmt.setString(1, vo.getName());
	         psmt.setString(2, vo.getEmail());
	         rs = psmt.executeQuery();
	         if(rs.next()) {
	        	vo.setId(rs.getString("id"));
	            vo.setName(rs.getString("name"));
	            vo.setEmail(rs.getString("email"));
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      return vo;
	   }
	   
	 //비번찾기
	   public MemberVO findPw(MemberVO vo) { 
	      try {
	         psmt = conn.prepareStatement(FINDPW);
	         psmt.setString(1, vo.getId());
	         psmt.setString(2, vo.getName());
	         psmt.setString(3, vo.getEmail());
	         rs = psmt.executeQuery();
	         if(rs.next()) {
	            vo.setPw(rs.getString("pw"));
	            vo.setId(rs.getString("id"));
	            vo.setName(rs.getString("name"));
	            vo.setEmail(rs.getString("email"));
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      return vo;
	   }
	 //중복체크
	   public MemberVO overlapId(MemberVO vo){
		   try {
	         psmt = conn.prepareStatement(OVERLAPID);
	         psmt.setString(1, vo.getId());
	         rs = psmt.executeQuery();
	         if(rs.next()) {
	            vo.setId(rs.getString("id"));
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      return vo;
	   }
	   
		// 업데이트
				public int updatelist(MemberVO vo) {
					int n = 0;
					try { 			
						psmt = conn.prepareStatement(UPDATELIST);
						psmt.setString(1, vo.getNname());
						psmt.setString(2,vo.getTel());
						psmt.setString(3,vo.getLocation1());
						psmt.setString(4,vo.getLocation2());
						psmt.setString(5,vo.getEmail());
						psmt.setString(6,vo.getPic());
						psmt.setString(7,vo.getId());
						n = psmt.executeUpdate();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					return n;
				}   
		//마이페이지에서 보는 즐겨찾기
				   public MemberVO mark(MemberVO vo){
					   try {
				         psmt = conn.prepareStatement(MARKLIST);
				         psmt.setString(1, vo.getId());
				         rs = psmt.executeQuery();
				         if(rs.next()) {
				            vo.setId(rs.getString("id"));
				            vo.setName(rs.getString("name"));
				            vo.setZoomin1(rs.getInt("zoomin1"));
				            vo.setLocation1(rs.getString("location1"));          
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
