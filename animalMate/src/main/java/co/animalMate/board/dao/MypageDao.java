package co.animalMate.board.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.MemberVO;
import co.animalMate.vo.PetVO;
import co.animalMate.vo.TradeBoardVO;
import co.animalMate.vo.TradeListVO;

public class MypageDao extends DAO {
	private PreparedStatement psmt; // sql 명령문 실행
	private ResultSet rs; // select 후 결과셋 받기
	private MemberVO memVo;
	private TradeBoardVO tbVo;
	private PetVO petVo;

	private final String SELECT = "SELECT * FROM MEMBERS WHERE ID = ?";
	private final String TRADE_COUNT = "SELECT COUNT(CODE) FROM TRADEBOARD WHERE (STATUS IN('예약가능', '예약완료')) AND (BUYER = ? OR SELLER= ?)";
	//private final String SELECT_USER_TRADES = "SELECT * FROM TRADEBOARD WHERE (BUYER = ? OR SELLER = ?) ORDER BY CODE DESC";
	private final String SELECT_USER_TRADES = "SELECT TB.*, P.* FROM PETCODE T LEFT OUTER JOIN TRADEBOARD TB ON (T.CODE = TB.CODE) LEFT OUTER JOIN PET P ON (T.PETCODE = P.CODE) WHERE TB.BUYER = ? OR TB.SELLER = ?";
	private final String SELECT_USER_TRADE = "SELECT * FROM TRADEBOARD WHERE CODE = ?";
	private final String SELECT_TRADE_PETS = "SELECT TYPE, DETAILTYPE FROM PET WHERE CODE = (SELECT T.PETCODE FROM TRADE T JOIN TRADEBOARD TB ON (T.CODE = TB.CODE) WHERE TB.CODE = ?)";
	
	
	
	
	//거래 리스트에 단일 펫 정보 뿌리기
		public List<PetVO> selectTradePets(PetVO petVo) {
			List<PetVO> list = new ArrayList<PetVO>();
			try {
				psmt = conn.prepareStatement(SELECT_TRADE_PETS);
				psmt.setInt(1, tbVo.getCode());
				rs = psmt.executeQuery();
				while (rs.next()) {
					petVo = new PetVO();
					petVo.setPic(rs.getString("type"));
					petVo.setPic(rs.getString("detailtype"));
					list.add(petVo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return list;
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
	public List<TradeListVO> selectUserTrades(TradeListVO tlVo) {
		List<TradeListVO> list = new ArrayList<TradeListVO>();
		try {
			psmt = conn.prepareStatement(SELECT_USER_TRADES);
			String sbid= tlVo.getBuyer();
			psmt.setString(1, sbid);
			psmt.setString(2, sbid);
			rs = psmt.executeQuery();
			while (rs.next()) {
				tlVo = new TradeListVO();
				tlVo.setCode(rs.getInt("code"));
				tlVo.setBuyer(rs.getString("buyer"));
				tlVo.setSeller(rs.getString("seller"));
				tlVo.setTitle(rs.getString("title"));
				tlVo.setTtime(rs.getString("ttime"));
				tlVo.setPrice(rs.getInt("price"));
				tlVo.setStatus(rs.getString("status"));
				tlVo.setStime(rs.getString("stime"));
				tlVo.setEtime(rs.getString("etime"));
				tlVo.setSdate((rs.getString("sdate")).substring(0,10));
				tlVo.setEdate((rs.getString("edate")).substring(0,10));
				tlVo.setTtype(rs.getString("ttype"));
				tlVo.setLocation1(rs.getString("location1"));
				tlVo.setLocation2(rs.getString("location2"));
				tlVo.setType(rs.getString("type"));
				tlVo.setDetailType(rs.getString("detailtype"));
				list.add(tlVo);
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
				memVo.setNName(rs.getString("nName"));
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
