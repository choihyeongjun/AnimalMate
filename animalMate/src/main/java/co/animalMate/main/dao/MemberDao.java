package co.animalMate.main.dao;

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
	private final String BLACK_SEARCH="SELECT * FROM MEMBERS WHERE AUTHOR = ? ";
	private final String SELECT_SEARCH="SELECT * FROM MEMBERS WHERE ID = ? ";
	private final String SELECT = "SELECT * FROM MEMBER WHERE ID = ? AND PASSWORD=?";
	private final String INSERT = "INSERT INTO MEMBER(ID, PASSWORD, NAME, ZOOMIN1,ZOOMIN2, TEL, LOCATION1,LOCATION2,EMAIL) VALUES (?,?,?,?,?,?,?,?,?)";
	private final String UPDATE = "UPDATE MEMBERS SET AUTHOR=? WHERE ID=?";
	private final String UPDATE_BLACK = "UPDATE MEMBERS SET AUTHOR=? WHERE ID=? AND AUTHOR='black'";
	private final String DELETE = "DELETE FROM MEMBERS WHERE ID = ?"; 
	private final String SELECT_BLACK="SELECT * FROM MEMBERS WHERE AUTHOR=? AND ID=?";
	//업데이트
		public void updateBlack(MemberVO vo) { 	
			try {
				psmt = conn.prepareStatement(UPDATE_BLACK);
				psmt.setString(1, vo.getAuthor());
				psmt.setString(2, vo.getId());
				psmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
	//블랙리스트 가져오기
	public List<MemberVO> selectBlack(MemberVO vo){
		List<MemberVO> list = new ArrayList<MemberVO>();
		try {
			psmt=conn.prepareStatement(SELECT_BLACK);
			psmt.setString(1, vo.getAuthor());
			psmt.setString(2, vo.getId());
			rs=psmt.executeQuery();
			while(rs.next()) {
				vo = new MemberVO();
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setName(rs.getString("name"));
				vo.setNName(rs.getString("nname"));
				vo.setTel(rs.getString("tel"));
				vo.seteDate(rs.getString("edate"));
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close();
		}
		return list;
	}
	public List<MemberVO> selectAllBlack(MemberVO vo){
		List<MemberVO> list = new ArrayList<MemberVO>();
		try {
			psmt=conn.prepareStatement(BLACK_SEARCH);
			psmt.setString(1, vo.getAuthor());
			rs=psmt.executeQuery();
			while(rs.next()) {
				vo = new MemberVO();
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setName(rs.getString("name"));
				vo.setNName(rs.getString("nname"));
				vo.setTel(rs.getString("tel"));
				vo.seteDate(rs.getString("edate"));
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close();
		}
		return list;
	}
	
	
	public List<MemberVO> selectSearch(MemberVO vo){
		List<MemberVO> list = new ArrayList<MemberVO>();
		try {
			
			psmt=conn.prepareStatement(SELECT_SEARCH);
			psmt.setString(1, vo.getId());
			rs=psmt.executeQuery();
			while(rs.next()) {
				vo = new MemberVO();
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setName(rs.getString("name"));
				vo.setNName(rs.getString("nname"));
				vo.setTel(rs.getString("tel"));
				vo.seteDate(rs.getString("edate"));
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close();
		}
		return list;
	}
	
	//멤버리스트 전체를 가져오는 메소드
	public List<MemberVO> selectAll(){ 
		List<MemberVO> list = new ArrayList<MemberVO>();
		try {
			psmt = conn.prepareStatement(SELECT_ALL);
			rs = psmt.executeQuery();
			while(rs.next()) {
				vo = new MemberVO();
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setName(rs.getString("name"));
				vo.setNName(rs.getString("nname"));
				vo.setTel(rs.getString("tel"));
				vo.seteDate(rs.getString("edate"));
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
	
	//시터리스트 설렉하기
	public List<MemberVO> selectSitterList(){ 
		List<MemberVO> list = new ArrayList<MemberVO>();
		try {
			psmt = conn.prepareStatement("SELECT A.* FROM MEMBERS A, SITTER B, TRADEBOARD C WHERE C.SELLER = B.ID and A.ID = B.ID and C.SELLER = A.ID and C.ttype = '돌봐줄게요'");
			rs = psmt.executeQuery();
			while(rs.next()) {
				vo = new MemberVO();
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setName(rs.getString("name"));
				vo.setNName(rs.getString("nname"));
				vo.setTel(rs.getString("tel"));
				vo.seteDate(rs.getString("edate"));
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
	
	//아이디로 단 건 조회
	public MemberVO selectById(MemberVO vo) { 
		try {
			psmt = conn.prepareStatement("SELECT * FROM MEMBERS WHERE ID = ?");
			psmt.setString(1, vo.getId());
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo.setName(rs.getString("name"));
				vo.setNName(rs.getString("nname"));
				vo.setTel(rs.getString("tel"));
				vo.seteDate(rs.getString("edate"));
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
	
	//인서트
	public int insert(MemberVO vo) { 
		int n = 0;
		try {
			psmt = conn.prepareStatement(INSERT);
			psmt.setString(1, vo.getId());
			psmt.setString(2, vo.getPw());
			psmt.setString(3, vo.getName());
			psmt.setString(4, vo.getTel() );
			psmt.setInt(5, vo.getZoomin1());
			psmt.setInt(6, vo.getZoomin2());
			psmt.setString(7, vo.getLocation1());
			psmt.setString(8, vo.getLocation2());
			psmt.setString(9, vo.getEmail());
			
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}
	
	//업데이트
	public void update(MemberVO vo) { 	
		try {
			psmt = conn.prepareStatement(UPDATE);
			psmt.setString(1, vo.getAuthor());
			psmt.setString(2, vo.getId());
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//딜리트
	public void delete(MemberVO vo) { 
		try {
			psmt = conn.prepareStatement(DELETE);
			psmt.setString(1, vo.getId());
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
