package co.animalMate.board.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.ApplytradeVO;
import co.animalMate.vo.CommentsVO;
import co.animalMate.vo.MemberTradeListVO;
import co.animalMate.vo.MemberVO;
import co.animalMate.vo.PetVO;
import co.animalMate.vo.TradeBoardVO;
import co.animalMate.vo.TradeListVO;

public class MypageDao extends DAO {
	private PreparedStatement psmt; // sql 명령문 실행
	private ResultSet rs; // select 후 결과셋 받기
	private MemberVO memVo;
	private TradeBoardVO tbVo;
	private TradeListVO tlVo;
	private PetVO petVo;
	private CommentsVO comVo;
	private MemberTradeListVO memtlVo;
	private ApplytradeVO atVo;

	private final String SELECT = "SELECT * FROM MEMBERS WHERE ID = ?";
	private final String TRADE_COUNT = "SELECT COUNT(CODE) FROM TRADEBOARD WHERE (STATUS IN('예약가능', '예약완료')) AND (BUYER = ? OR SELLER= ?)";
	private final String SELECT_USER_TRADES = "SELECT TB.*, P.* FROM PETCODE T LEFT OUTER JOIN TRADEBOARD TB ON (T.CODE = TB.CODE) LEFT OUTER JOIN PET P ON (T.PETCODE = P.CODE) WHERE TB.BUYER = ? OR TB.SELLER = ? ORDER BY TB.CODE DESC";
	private final String SELECT_USER_TRADE = "SELECT TB.*, P.* FROM PETCODE T LEFT OUTER JOIN TRADEBOARD TB ON (T.CODE = TB.CODE) LEFT OUTER JOIN PET P ON (T.PETCODE = P.CODE) WHERE TB.code = ? ";
	private final String SELECT_COMMENTS = "SELECT C.* FROM COMMENTS C JOIN TRADEBOARD TB ON (C.CODE=TB.CODE) WHERE TB.SELLER = ? ";
	private final String SELECT_APPLYTRADES = "SELECT M.* FROM MEMBERS M JOIN APPLYTRADE AT ON (M.ID = AT.ID) WHERE AT.CODE = ?";
	private final String SELECT_TRADEPETS = "SELECT P.* FROM PETCODE TP JOIN PET P ON (TP.PETCODE = P.CODE) WHERE TP.CODE = ?";
	private final String UPDATE_APPLYTRADES1 = "UPDATE APPLYTRADE SET STATUS = '수락완료' WHERE CODE = ? AND ID = ?";
	private final String UPDATE_APPLYTRADES2 = "UPDATE APPLYTRADE SET STATUS = '수락거절' WHERE CODE = ? AND ID != ?";
	private final String UPDATE_TRADEBOARD = "UPDATE TRADEBOARD SET SELLER = ?, STATUS = '거래대상확정' WHERE CODE = ?";
			
	// 거래 체크 후 거래 상태 업데이트
	public int updateApplyTrade(ApplytradeVO atVo) {
		int n = 0;
		try {
			int atCode = atVo.getCode();
			String atId = atVo.getId();
			
			psmt = conn.prepareStatement(UPDATE_APPLYTRADES1);
			psmt.setInt(1, atCode);
			psmt.setString(2, atId);
			n = psmt.executeUpdate();
			
			psmt = conn.prepareStatement(UPDATE_APPLYTRADES2);
			psmt.setInt(1, atCode);
			psmt.setString(2, atVo.getId());
			n = psmt.executeUpdate();
			
			psmt = conn.prepareStatement(UPDATE_TRADEBOARD);
			psmt.setString(1, atId);
			psmt.setInt(2, atCode);
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	
	// 거래하는 펫 리스트 뿌리기
	public List<PetVO> selectTradepets(PetVO petVo) {
		List<PetVO> list = new ArrayList<PetVO>();
		try {
			psmt = conn.prepareStatement(SELECT_TRADEPETS);
			psmt.setString(1, petVo.getCode());
			rs = psmt.executeQuery();
			while (rs.next()) {
				petVo = new PetVO();
				petVo.setCode(rs.getString("code"));
				petVo.setName(rs.getString("name"));
				petVo.setAge(rs.getInt("age"));
				petVo.setGender(rs.getString("gender"));
				petVo.setType(rs.getString("type"));
				petVo.setDetailType(rs.getString("detailType"));
				petVo.setCut(rs.getString("cut"));
				petVo.setComm(rs.getString("comm"));
				petVo.setId(rs.getString("id"));
				petVo.setPic(rs.getString("pic"));
				list.add(petVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	// 거래 게시판 거래수락
	public List<MemberTradeListVO> selectApplyTradeList(MemberTradeListVO memtlVo) {
		List<MemberTradeListVO> list = new ArrayList<MemberTradeListVO>();
		try {
			psmt = conn.prepareStatement(SELECT_APPLYTRADES);
			psmt.setString(1, memtlVo.getId());
			rs = psmt.executeQuery();
			while (rs.next()) {
				memtlVo = new MemberTradeListVO();
				memtlVo.setId(rs.getString("id"));
				memtlVo.setPw(rs.getString("pw"));
				memtlVo.setName(rs.getString("name"));
				memtlVo.setnName(rs.getString("nName"));
				memtlVo.setTel(rs.getString("tel"));
				memtlVo.seteDate(rs.getString("eDate"));
				memtlVo.setAuthor(rs.getString("author"));
				memtlVo.setPoint(rs.getInt("point"));
				memtlVo.setStatus(rs.getString("status"));
				memtlVo.setLocation1(rs.getString("location1"));
				memtlVo.setLocation2(rs.getString("location2"));
				memtlVo.setEmail(rs.getString("email"));
				memtlVo.setPic(rs.getString("pic"));
				memtlVo.setZoomin1(rs.getInt("zoomin1"));
				memtlVo.setZoomin2(rs.getInt("zoomin2"));
				//나이 성별 넣어야함		
				list.add(memtlVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 프로필에 거래후기 리스트 뿌리기
	public List<CommentsVO> selectComments(CommentsVO comVo) {
		List<CommentsVO> list = new ArrayList<CommentsVO>();
		try {
			psmt = conn.prepareStatement(SELECT_COMMENTS);
			psmt.setString(1, comVo.getComm());
			rs = psmt.executeQuery();
			while (rs.next()) {
				comVo = new CommentsVO();
				comVo.setCode(rs.getInt("code"));
				comVo.setScore(rs.getInt("score"));
				comVo.setComm(rs.getString("comm"));
				comVo.setPic(rs.getString("pic"));
				comVo.setTitle(rs.getString("title"));
				list.add(comVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// User 거래 리스트 모두 출력
	public List<TradeListVO> selectUserTrades(TradeListVO tlVo) {
		List<TradeListVO> list = new ArrayList<TradeListVO>();
		try {
			psmt = conn.prepareStatement(SELECT_USER_TRADES);
			String sbid = tlVo.getBuyer();
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
				tlVo.setSdate((rs.getString("sdate")).substring(0, 10));
				tlVo.setEdate((rs.getString("edate")).substring(0, 10));
				tlVo.setTtype(rs.getString("ttype"));
				tlVo.setLocation1(rs.getString("location1"));
				tlVo.setLocation2(rs.getString("location2"));

				tlVo.setName(rs.getString("name"));
				tlVo.setAge(rs.getInt("age"));
				tlVo.setGender(rs.getString("gender"));
				tlVo.setType(rs.getString("type"));
				tlVo.setDetailType(rs.getString("detailtype"));
				tlVo.setCut(rs.getString("cut"));
				tlVo.setId(rs.getString("id"));
				tlVo.setPic(rs.getString("pic"));

				list.add(tlVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// User 거래 리스트,동물 단건 조회
	public TradeListVO selectUserTrade(TradeListVO tlVo) {
		try {
			psmt = conn.prepareStatement(SELECT_USER_TRADE);
			psmt.setInt(1, tlVo.getCode());
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
				tlVo.setComm(rs.getString("comm"));
				tlVo.setStime(rs.getString("stime"));
				tlVo.setEtime(rs.getString("etime"));
				tlVo.setSdate((rs.getString("sdate")).substring(0, 10));
				tlVo.setEdate((rs.getString("edate")).substring(0, 10));
				tlVo.setTtype(rs.getString("ttype"));
				tlVo.setLocation1(rs.getString("location1"));
				tlVo.setLocation2(rs.getString("location2"));

				tlVo.setName(rs.getString("name"));
				tlVo.setAge(rs.getInt("age"));
				tlVo.setGender(rs.getString("gender"));
				tlVo.setType(rs.getString("type"));
				tlVo.setDetailType(rs.getString("detailtype"));
				tlVo.setCut(rs.getString("cut"));
				tlVo.setId(rs.getString("id"));
				tlVo.setPic(rs.getString("pic"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return tlVo;
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
