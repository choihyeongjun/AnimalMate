package co.animalMate.board.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import co.animalMate.common.DAO;
import co.animalMate.vo.MemberVO;
import co.animalMate.vo.SitterVO;

public class MemberDao extends DAO {
   private PreparedStatement psmt; //sql 紐낅졊臾   떎 뻾
   private ResultSet rs; //select  썑 寃곌낵 뀑 諛쏄린
   private MemberVO vo;
   
   private final String SELECTSI = "SELECT * FROM MEMBERS WHERE AUTHOR=?";
   private final String SELECT_ALL = "SELECT * FROM MEMBERS";
   private final String BLACK_SEARCH="SELECT * FROM MEMBERS WHERE AUTHOR = ? ";
   private final String SITTER_SEARCH="SELECT * FROM MEMBERS M,SITTER S WHERE M.ID = S.ID AND M.ID=?";
   private final String SELECT_SEARCH="SELECT * FROM MEMBERS WHERE ID=?";
   private final String SELECT = "SELECT * FROM MEMBER WHERE ID = ? AND PASSWORD=?";
   private final String INSERT = "INSERT INTO MEMBER(ID, PASSWORD, NAME, ZOOMIN1,ZOOMIN2, TEL, LOCATION1,LOCATION2,EMAIL) VALUES (?,?,?,?,?,?,?,?,?)";
   private final String UPDATE = "UPDATE MEMBERS SET AUTHOR=? WHERE ID=?";
   private final String UPDATE_BLACK = "UPDATE MEMBERS SET AUTHOR=? WHERE ID=? AND AUTHOR='black'";
   private final String DELETE = "DELETE FROM MEMBERS WHERE ID = ?"; 
   private final String SELECT_BLACK="SELECT * FROM MEMBERS WHERE AUTHOR=? AND ID=?";
   
   
   //시터 띄우기
   public List<Object> sitterSearch(MemberVO vo){
      List<Object> list = new ArrayList<Object>();
      try {
         
         psmt=conn.prepareStatement(SITTER_SEARCH);
         psmt.setString(1, vo.getId());
         rs=psmt.executeQuery();
         while(rs.next()) {
            SitterVO svo=new SitterVO();
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
            svo.setMaxP(rs.getInt("maxp"));
            svo.setComm(rs.getString("comm"));
            list.add(vo);
            list.add(svo);
         }
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally{
         close();
      }
      return list;
   }
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
   public List<MemberVO> selectSitter(MemberVO vo){
      List<MemberVO> list = new ArrayList<MemberVO>();
      try {
         
         psmt=conn.prepareStatement(SELECTSI);
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
   
   
   public List<MemberVO> selectAll(){ //硫ㅻ쾭由ъ뒪 듃  쟾泥대   媛  졇 삤 뒗 硫붿냼 뱶
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
   
   // 븳  뻾 쓣 寃  깋 븷  븣
   public MemberVO select(MemberVO vo) { 
      try {
         psmt = conn.prepareStatement(SELECT);
         psmt.setString(1, vo.getId());
         psmt.setString(2, vo.getPw());
         rs = psmt.executeQuery();
         if(rs.next()) {
            vo.setName(rs.getString("name"));
            //vo.(rs.getString("address"));
            vo.setTel(rs.getString("tel"));
         //   vo.setEnterdate(rs.getDate("enterdate"));
            vo.setAuthor(rs.getString("author"));
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close();
      }
      return vo;
   }
   
   // 씤 꽌 듃
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
   
   // 뾽 뜲 씠 듃
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
   
   // 뵜由ы듃
   public void delete(MemberVO vo) { 
      try {
         psmt = conn.prepareStatement(DELETE);
         psmt.setString(1, vo.getId());
         psmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      }
   
   }
   
   private void close() { //DB 뿰寃곗쓣  걡 뼱以  떎
      try {
         if(rs != null) rs.close();
         if(psmt != null) psmt.close();
         if(conn != null) conn.close();
      } catch (SQLException e) {
         e.printStackTrace();
      }
      
   }
}