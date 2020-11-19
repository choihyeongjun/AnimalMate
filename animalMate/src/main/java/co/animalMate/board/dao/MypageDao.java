package co.animalMate.board.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.ApplytradeVO;
import co.animalMate.vo.CommentsVO;
import co.animalMate.vo.JoblistVO;
import co.animalMate.vo.MemberTradeListVO;
import co.animalMate.vo.MemberVO;
import co.animalMate.vo.PetVO;
import co.animalMate.vo.SitterTradeCheckListVO;
import co.animalMate.vo.TradeBoardVO;
import co.animalMate.vo.TradeCommentsVO;
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
	private SitterTradeCheckListVO stclVo;
	private JoblistVO jobVo;
	private TradeCommentsVO tcVo;

	private final String SELECT = "SELECT * FROM MEMBERS WHERE ID = ?";
	private final String TRADE_COUNT = "SELECT COUNT(CODE) FROM TRADEBOARD WHERE (STATUS != '거래 완료') AND (BUYER = ? OR SELLER= ?)";
	private final String SELECT_USER_TRADES = "SELECT TB.*, P.* FROM PETCODE T LEFT OUTER JOIN TRADEBOARD TB ON (T.CODE = TB.CODE) LEFT OUTER JOIN PET P ON (T.PETCODE = P.CODE) WHERE TB.BUYER = ? OR TB.SELLER = ? ORDER BY TB.CODE DESC";
	private final String SELECT_USER_TRADES2 = "SELECT * FROM TRADEBOARD WHERE BUYER = ? OR SELLER = ? ORDER BY CODE DESC";
	private final String SELECT_USER_TRADE = "SELECT TB.*, P.* FROM PETCODE T LEFT OUTER JOIN TRADEBOARD TB ON (T.CODE = TB.CODE) LEFT OUTER JOIN PET P ON (T.PETCODE = P.CODE) WHERE TB.code = ? ";
	private final String SELECT_USER_TRADE2 = "SELECT * FROM TRADEBOARD WHERE CODE = ?";
	private final String SELECT_COMMENTS = "SELECT * FROM COMMENTS C JOIN TRADEBOARD TB ON (C.CODE=TB.CODE) WHERE C.CODE IN (SELECT CODE FROM TRADEBOARD WHERE SELLER = ?)";
	private final String SELECT_APPLYTRADES = "SELECT M.* FROM MEMBERS M JOIN APPLYTRADE AT ON (M.ID = AT.ID) WHERE AT.CODE = ?";
	private final String SELECT_TRADEPETS = "SELECT P.* FROM PETCODE TP JOIN PET P ON (TP.PETCODE = P.CODE) WHERE TP.CODE = ?";
	private final String UPDATE_APPLYTRADES1 = "UPDATE APPLYTRADE SET STATUS = '수락완료' WHERE CODE = ? AND ID = ?";
	private final String UPDATE_APPLYTRADES2 = "UPDATE APPLYTRADE SET STATUS = '수락거절' WHERE CODE = ? AND ID != ?";
	private final String UPDATE_BUYER_TRADEBOARD = "UPDATE TRADEBOARD SET SELLER = ?, STATUS = '거래 대상 확정' WHERE CODE = ?";
	private final String UPDATE_SITTER_TRADEBOARD = "UPDATE TRADEBOARD SET BUYER = ?, STATUS = '거래 대상 확정' WHERE CODE = ?";
	private final String SELCET_SITTER_TRADE_LIST = "SELECT PC.CODE , M.*, P.* FROM PET P LEFT OUTER JOIN MEMBERS M ON (M.ID = P.ID) LEFT OUTER JOIN PETCODE PC ON (P.CODE = PC.PETCODE) WHERE PC.CODE = ?";
	private final String UPDATE_TRADE_POINT_FINISH = "UPDATE MEMBERS SET POINT = (SELECT PRICE FROM TRADEBOARD WHERE CODE = ?)+POINT WHERE ID = ?";
	private final String UPDATE_TRADE_STATUS_FINISH = "UPDATE TRADEBOARD SET STATUS = '후기 미작성' WHERE CODE= ?";
	private final String SELECT_JOBLIST = "SELECT * FROM JOBLIST WHERE CODE = ?";
	private final String UPDATE_JOBLIST = "UPDATE JOBLIST SET PIC = ? WHERE CODE = ? AND COMM = ?";
	private final String UPDATE_TRADE_USER_POINT = "UPDATE MEMBERS SET POINT = POINT - (SELECT PRICE FROM TRADEBOARD WHERE CODE = ?) WHERE ID = ?";
	private final String SELECT_MYTRADE_SELLER = "SELECT COUNT(CODE) FROM TRADEBOARD WHERE SELLER = ? AND STATUS != '거래 완료'";
	private final String SELECT_MYTRADE_BUYER = "SELECT COUNT(CODE) FROM TRADEBOARD WHERE BUYER = ? AND STATUS != '거래 완료'";
	private final String SELECT_TRADE_USER_POINT = "SELECT POINT FROM MEMBERS WHERE ID = ?";
	private final String UPDATE_STATUS_JOBLIST = "UPDATE TRADEBOARD SET STATUS = '반려인 미확인' WHERE CODE = ?";
	private final String SELECT_APPLY_TRADES = "SELECT * FROM TRADEBOARD WHERE CODE IN (SELECT CODE FROM APPLYTRADE WHERE ID = ?) ORDER BY CODE DESC";
	private final String UPDATE_POINT = "UPDATE MEMBERS SET POINT = ? + POINT WHERE ID = ?";
	private final String DELETE_PETCODE = "DELETE FROM PETCODE WHERE CODE = ? AND PETCODE NOT IN (SELECT PETCODE FROM PETCODE WHERE PETCODE = (SELECT CODE FROM PET WHERE ID IN (SELECT ID FROM MEMBERS WHERE ID = ?)))";
	private final String SELECT_COMMENT = "select * from comments where code = ?";
	private final String UPDATE_TRADE_STATUS_FINISH2 = "UPDATE TRADEBOARD SET STATUS = '거래 완료' WHERE CODE= ?";

	//후기쓰고 나서 상태변화
	public int updateTradeFinish2(TradeBoardVO tbVo) {
		int n = 0;
		try {
			psmt = conn.prepareStatement(UPDATE_TRADE_STATUS_FINISH2);
			psmt.setInt(1, tbVo.getCode());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	// 후기 단건 조회
	public CommentsVO selectComment(CommentsVO comVo) {
		try {
			psmt = conn.prepareStatement(SELECT_COMMENT);
			psmt.setInt(1, comVo.getCode());
			rs = psmt.executeQuery();
			if (rs.next()) {
				comVo = new CommentsVO();
				comVo.setCode(rs.getInt("code"));
				comVo.setScore(rs.getInt("score"));
				comVo.setComm(rs.getString("comm"));
				comVo.setPic(rs.getString("pic"));
				comVo.setTitle(rs.getString("title"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return comVo;
	}
	
	// 체크리스트 시터가 올린 사진들 업데이트
	public int updateStatusJoblist(MemberVO memVo) {
		int n = 0;
		try {
			psmt = conn.prepareStatement(UPDATE_POINT);
			psmt.setInt(1, memVo.getPoint());
			psmt.setString(2, memVo.getId());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
			
	// User 거래 리스트 모두 출력
	public List<TradeBoardVO> selectapplyTrades(TradeBoardVO tbVo) {
		List<TradeBoardVO> list = new ArrayList<TradeBoardVO>();
		try {
			psmt = conn.prepareStatement(SELECT_APPLY_TRADES);
			psmt.setString(1, tbVo.getBuyer());
			rs = psmt.executeQuery();
			while (rs.next()) {
				tbVo = new TradeBoardVO();
				tbVo.setCode(rs.getInt("code"));
				tbVo.setBuyer(rs.getString("buyer"));
				tbVo.setSeller(rs.getString("seller"));
				tbVo.setTitle(rs.getString("title"));
				tbVo.setTtime(rs.getString("ttime"));
				tbVo.setPrice(rs.getInt("price"));
				tbVo.setStatus(rs.getString("status"));
				tbVo.setStime(rs.getString("stime"));
				tbVo.setEtime(rs.getString("etime"));
				tbVo.setSdate((rs.getString("sdate")).substring(0, 10));
				tbVo.setEdate((rs.getString("edate")).substring(0, 10));
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
	
	// 체크리스트 시터가 올린 사진들 업데이트
	public int updateStatusJoblist(TradeBoardVO tbVo) {
		int n = 0;
		try {
			psmt = conn.prepareStatement(UPDATE_STATUS_JOBLIST);
			psmt.setInt(1, tbVo.getCode());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	// User 동물 맡기는 거래 진행 수
	public TradeBoardVO selectMytradeBuyerCount(TradeBoardVO tbVo) {
		try {
			psmt = conn.prepareStatement(SELECT_MYTRADE_BUYER);
			psmt.setString(1, tbVo.getBuyer());
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

	// User 동물 돌보는 거래 진행 수
	public TradeBoardVO selectMytradeSellerCount(TradeBoardVO tbVo) {
		try {
			psmt = conn.prepareStatement(SELECT_MYTRADE_SELLER);
			psmt.setString(1, tbVo.getSeller());
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

	// User 돈체크
	public TradeListVO selectUserPoint(TradeListVO tlVo) {
		try {
			psmt = conn.prepareStatement(SELECT_TRADE_USER_POINT);
			psmt.setString(1, tlVo.getBuyer());
			rs = psmt.executeQuery();
			if (rs.next()) {
				tlVo = new TradeListVO();
				tlVo.setPrice(rs.getInt("point"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return tlVo;
	}

	// 체크리스트 시터가 올린 사진들 업데이트
	public int updateJoblist(JoblistVO jobVo) {
		int n = 0;
		try {
			psmt = conn.prepareStatement(UPDATE_JOBLIST);
			psmt.setString(1, jobVo.getPic());
			psmt.setInt(2, jobVo.getCode());
			psmt.setString(3, jobVo.getComm());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	// 체크리스트 출력
	public List<JoblistVO> selectJoblist(JoblistVO jobVo) {
		List<JoblistVO> list = new ArrayList<JoblistVO>();
		try {
			psmt = conn.prepareStatement(SELECT_JOBLIST);
			psmt.setInt(1, jobVo.getCode());
			rs = psmt.executeQuery();
			while (rs.next()) {
				jobVo = new JoblistVO();
				jobVo.setCode(rs.getInt("code"));
				jobVo.setComm(rs.getString("comm"));
				jobVo.setPic(rs.getString("pic"));
				jobVo.setConfirm(rs.getString("confirm"));
				list.add(jobVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 모든 게시판 유저가 시터와 거래 마친후 시터에게 돈 넘겨주는 것
	public int updateTradeFinish(TradeBoardVO tbVo) {
		int n = 0;
		try {
			int tbCode = tbVo.getCode();
			String tbId = tbVo.getSeller();

			psmt = conn.prepareStatement(UPDATE_TRADE_POINT_FINISH);
			psmt.setInt(1, tbCode);
			psmt.setString(2, tbId);
			n = psmt.executeUpdate();

			psmt = conn.prepareStatement(UPDATE_TRADE_STATUS_FINISH);
			psmt.setInt(1, tbCode);
			n = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	// 돌봐줄게요 게시판 거래 체크 후 거래 상태 업데이트
	public int updateSitterApplyTrade(ApplytradeVO atVo) {
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

			psmt = conn.prepareStatement(UPDATE_SITTER_TRADEBOARD);
			psmt.setString(1, atId);
			psmt.setInt(2, atCode);
			n = psmt.executeUpdate();
			
			//유저돈 빼기
			psmt = conn.prepareStatement(UPDATE_TRADE_USER_POINT);
			psmt.setInt(1, atCode);
			psmt.setString(2, atId);
			n = psmt.executeUpdate();
			
			//다른 펫 코드 삭제
			psmt = conn.prepareStatement(DELETE_PETCODE);
			psmt.setInt(1, atCode);
			psmt.setString(2, atId);
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	// 돌봐줄게요 게시판 거래체결
	public List<SitterTradeCheckListVO> selectSitterTradeList(SitterTradeCheckListVO stclVo) {
		List<SitterTradeCheckListVO> list = new ArrayList<SitterTradeCheckListVO>();
		try {
			psmt = conn.prepareStatement(SELCET_SITTER_TRADE_LIST);
			psmt.setString(1, stclVo.getCode());
			rs = psmt.executeQuery();
			while (rs.next()) {
				stclVo = new SitterTradeCheckListVO();
				stclVo.setCode(rs.getString("code"));

				stclVo.setId(rs.getString("id"));
				stclVo.setPw(rs.getString("pw"));
				stclVo.setName(rs.getString("name"));
				stclVo.setnName(rs.getString("nName"));
				stclVo.setTel(rs.getString("tel"));
				stclVo.seteDate(rs.getString("eDate"));
				stclVo.setAuthor(rs.getString("author"));
				stclVo.setPoint(rs.getInt("point"));
				stclVo.setStatus(rs.getString("status"));
				stclVo.setLocation1(rs.getString("location1"));
				stclVo.setLocation2(rs.getString("location2"));
				stclVo.setEmail(rs.getString("email"));
				stclVo.setPic(rs.getString("pic"));
				//stclVo.setZoomin1(rs.getInt("zoomin1"));
				//stclVo.setZoomin2(rs.getInt("zoomin2"));
				// 나이,성별 넣어줘야함
				
				int birthYear = Integer.parseInt(String.valueOf(rs.getInt("zoomin1")).substring(0, 2));
				Calendar cal = Calendar.getInstance();
				int year = cal.get(Calendar.YEAR) - 2000;
				int age;
				if (birthYear > year) {
					age = year + (100 - birthYear) + 1; // 1더하면 한국나이
				} else {
					age = year;
				}
				stclVo.setAge(age);

				// 성별 구하기!
				String zoo2 = String.valueOf(rs.getInt("zoomin2")).substring(0, 1);
				String gender;
				if (zoo2.equals("1") || zoo2.equals("3")) {
					gender = "남성";
				} else {
					gender = "여성";
				}
				stclVo.setGender(gender);
				
				
				
				
				
				stclVo.setpCode(rs.getString("code_1"));
				stclVo.setpName(rs.getString("name_1"));
				stclVo.setpAge(rs.getInt("age_1"));
				stclVo.setpGender(rs.getString("gender_1"));
				stclVo.setType(rs.getString("type"));
				stclVo.setDetailType(rs.getString("detailtype"));
				stclVo.setCut(rs.getString("cut"));
				stclVo.setpPic(rs.getString("pic_1"));

				list.add(stclVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 돌봐주세요 게시판 거래 체크 후 거래 상태 업데이트
	public int updateApplyTrade(ApplytradeVO atVo) {
		int n = 0;
		try {
			int atCode = atVo.getCode();
			String atId = atVo.getId();
			//선택한 시터 '거래 수락'으로 상태변화
			psmt = conn.prepareStatement(UPDATE_APPLYTRADES1);
			psmt.setInt(1, atCode);
			psmt.setString(2, atId);
			n = psmt.executeUpdate();
			
			//신청한 다른 시터들 '거래 거절'로 상태변환
			psmt = conn.prepareStatement(UPDATE_APPLYTRADES2);
			psmt.setInt(1, atCode);
			psmt.setString(2, atVo.getId());
			n = psmt.executeUpdate();
			
			//seller를 거래테이블에 삽입
			psmt = conn.prepareStatement(UPDATE_BUYER_TRADEBOARD);
			psmt.setString(1, atId);
			psmt.setInt(2, atCode);
			n = psmt.executeUpdate();
			
			//내돈 빼기
			psmt = conn.prepareStatement(UPDATE_TRADE_USER_POINT);
			psmt.setInt(1, atCode);
			psmt.setString(2, atVo.getStatus());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	// 돌봐주세요 게시판 거래하는 펫 리스트 뿌리기
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

	
	
	// 돌봐주세요 게시판 거래수락
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
				//memtlVo.setZoomin1(rs.getInt("zoomin1"));
				//memtlVo.setZoomin2(rs.getInt("zoomin2"));
				// 나이 성별 넣어야함
								
				int birthYear = Integer.parseInt(String.valueOf(rs.getInt("zoomin1")).substring(0, 2));
				Calendar cal = Calendar.getInstance();
				int year = cal.get(Calendar.YEAR) - 2000;
				int age;
				if (birthYear > year) {
					age = year + (100 - birthYear) + 1; // 1더하면 한국나이
				} else {
					age = year;
				}
				memtlVo.setAge(age);

				// 성별 구하기!
				String zoo2 = String.valueOf(rs.getInt("zoomin2")).substring(0, 1);
				String gender;
				if (zoo2.equals("1") || zoo2.equals("3")) {
					gender = "남성";
				} else {
					gender = "여성";
				}
				memtlVo.setGender(gender);

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
	public List<TradeCommentsVO> selectComments(TradeCommentsVO tcVo) {
		List<TradeCommentsVO> list = new ArrayList<TradeCommentsVO>();
		try {
			psmt = conn.prepareStatement(SELECT_COMMENTS);
			psmt.setString(1, tcVo.getSeller());
			rs = psmt.executeQuery();
			while (rs.next()) {
				tcVo = new TradeCommentsVO();
				tcVo.setCode(rs.getInt("code"));
				tcVo.setScore(rs.getInt("score"));
				tcVo.setComm(rs.getString("comm"));
				tcVo.setPic(rs.getString("pic"));
				tcVo.setTitle(rs.getString("title"));
				
				tcVo.setBuyer(rs.getString("buyer"));
				tcVo.setSeller(rs.getString("seller"));
				list.add(tcVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// User 거래 리스트 모두 출력
	public List<TradeBoardVO> selectUserTrades(TradeBoardVO tbVo) {
		List<TradeBoardVO> list = new ArrayList<TradeBoardVO>();
		try {
			psmt = conn.prepareStatement(SELECT_USER_TRADES2);
			String sbid = tbVo.getBuyer();
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
				tbVo.setStatus(rs.getString("status"));
				tbVo.setStime(rs.getString("stime"));
				tbVo.setEtime(rs.getString("etime"));
				tbVo.setSdate((rs.getString("sdate")).substring(0, 10));
				tbVo.setEdate((rs.getString("edate")).substring(0, 10));
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

	
	// User 거래 리스트 조회
		public TradeBoardVO selectUserTrade2(TradeBoardVO tbVo) {
			try {
				psmt = conn.prepareStatement(SELECT_USER_TRADE2);
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
					tbVo.setStatus(rs.getString("status"));
					tbVo.setComm(rs.getString("comm"));
					tbVo.setStime(rs.getString("stime"));
					tbVo.setEtime(rs.getString("etime"));
					tbVo.setSdate((rs.getString("sdate")).substring(0, 10));
					tbVo.setEdate((rs.getString("edate")).substring(0, 10));
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
	
	
	
	
	
	// User 거래 리스트,동물 단건 조회
	public TradeListVO selectUserTrade(TradeListVO tlVo) {
		try {
			psmt = conn.prepareStatement(SELECT_USER_TRADE);
			psmt.setInt(1, tlVo.getCode());
			rs = psmt.executeQuery();
			if (rs.next()) {
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
