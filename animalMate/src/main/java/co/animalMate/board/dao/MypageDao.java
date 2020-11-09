package co.animalMate.board.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.MemberVO;
import co.animalMate.vo.PetVO;
import co.animalMate.vo.TradeBoardVO;

public class MypageDao extends DAO {
	private PreparedStatement psmt; // sql 명령문 실행
	private ResultSet rs; // select 후 결과셋 받기
	private MemberVO memVo;
	private TradeBoardVO tbVo;
	private PetVO petVo;

	private final String SELECT = "SELECT * FROM MEMBERS WHERE ID = ?";
	private final String TRADE_COUNT = "SELECT COUNT(CODE) FROM TRADEBOARD WHERE (STATUS IN('예약가능', '예약완료')) AND (BUYER = ? OR SELLER= ?)";
	private final String SELECT_USER_TRADES = "SELECT * FROM TRADEBOARD WHERE (BUYER = ? OR SELLER = ?) ORDER BY CODE DESC";
	private final String SELECT_USER_TRADE = "SELECT * FROM TRADEBOARD WHERE CODE = ?";
	private final String SELECT_PET_PIC = "SELECT PIC FROM PET WHERE CODE = ?";
	
	
	//Pet 사진 안들어왔을때 기존 값 뿌리기
	public PetVO selectPetPic(PetVO petVo) {
		try {
			psmt = conn.prepareStatement(SELECT_PET_PIC);
			psmt.setString(1, petVo.getCode());
			rs = psmt.executeQuery();
			if (rs.next()) {
				petVo = new PetVO();
				petVo.setPic(rs.getString("pic"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return petVo;
	}
	
	
	
	//User 거래 단건 조회
	public TradeBoardVO selectUserTrade(TradeBoardVO tbVo) {
		try {
			psmt = conn.prepareStatement(SELECT_USER_TRADE);
			psmt.setInt(1, tbVo.getCode());
			rs = psmt.executeQuery();
			if (rs.next()) {
				tbVo = new TradeBoardVO();
				tbVo.setCode(rs.getInt("code"));
				tbVo.setBuyer(rs.getString("buyer"));
				tbVo.setSeller(rs.getString("seller"));
				tbVo.setTitle(rs.getString("title"));
				tbVo.setTtime(rs.getString("ttime"));
				tbVo.setPrice(rs.getInt("price"));
				tbVo.setComm(rs.getString("comm"));
				tbVo.setStatus(rs.getString("status"));
				tbVo.setStime(rs.getString("stime"));
				tbVo.setEtime(rs.getString("etime"));
				tbVo.setWtime(rs.getInt("wtime"));
				tbVo.setTtype(rs.getString("ttype"));
				tbVo.setLocation1(rs.getString("location1"));
				tbVo.setLocation2(rs.getString("location2"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return tbVo;
	}

	
	
	
	// User 거래보드 출력
	public List<TradeBoardVO> selectUserTrades(TradeBoardVO tbVo) {
		List<TradeBoardVO> list = new ArrayList<TradeBoardVO>();
		try {
			psmt = conn.prepareStatement(SELECT_USER_TRADES);
			String sbid= tbVo.getBuyer();
			psmt.setString(1, sbid);
			psmt.setString(2, sbid);
			rs = psmt.executeQuery();
			while (rs.next()) {
				tbVo = new TradeBoardVO();
				tbVo.setCode(rs.getInt("code"));
				tbVo.setBuyer(rs.getString("buyer"));
				tbVo.setSeller(rs.getString("seller"));
				tbVo.setTitle(rs.getString("title"));
				tbVo.setTtime(rs.getString("ttime"));
				tbVo.setPrice(rs.getInt("price"));
				tbVo.setComm(rs.getString("comm"));
				tbVo.setStatus(rs.getString("status"));
				tbVo.setStime(rs.getString("stime"));
				tbVo.setEtime(rs.getString("etime"));
				tbVo.setWtime(rs.getInt("wtime"));
				tbVo.setTtype(rs.getString("ttype"));
				tbVo.setLocation1(rs.getString("location1"));
				tbVo.setLocation2(rs.getString("location2"));
				list.add(tbVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	
	// 거래 횟수 출력
	public TradeBoardVO tradeCount(TradeBoardVO tbVo) {
		try {
			psmt = conn.prepareStatement(TRADE_COUNT);
			psmt.setString(1, tbVo.getBuyer());
			psmt.setString(2, tbVo.getSeller());
			rs = psmt.executeQuery();
			if (rs.next()) {
				tbVo = new TradeBoardVO();
				tbVo.setCode(rs.getInt("COUNT(CODE)"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return tbVo;
	}

	// User 정보 호출
	public MemberVO userInfo(MemberVO memVo) {
		try {
			psmt = conn.prepareStatement(SELECT);
			psmt.setString(1, memVo.getId());
			rs = psmt.executeQuery();
			if (rs.next()) {
				memVo = new MemberVO();
				memVo.setId(rs.getString("id"));
				memVo.setPw(rs.getString("pw"));
				memVo.setName(rs.getString("name"));
				memVo.setnName(rs.getString("nName"));
				memVo.setTel(rs.getString("tel"));
				memVo.seteDate(rs.getString("eDate"));
				memVo.setAuthor(rs.getString("author"));
				memVo.setPoint(rs.getInt("point"));
				memVo.setStatus(rs.getString("status"));
				memVo.setLocation1(rs.getString("location1"));
				memVo.setLocation2(rs.getString("location2"));
				memVo.setEmail(rs.getString("email"));
				memVo.setPic(rs.getString("pic"));
				memVo.setZoomin1(rs.getInt("zoomin1"));
				memVo.setZoomin2(rs.getInt("zoomin2"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return memVo;
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
