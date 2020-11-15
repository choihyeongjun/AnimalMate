package co.animalMate.main.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.CommentsVO;
import co.animalMate.vo.TradeBoardVO;
import co.animalMate.vo.TradeBoardVO;
import co.animalMate.vo.TradeBoardVO;

public class TradeBoardDAO extends DAO {
	private PreparedStatement psmt; // sql 명령문 실행
	private ResultSet rs; // select 후 결과셋 받기
	private TradeBoardVO vo;

	// 시터리스트 설렉하기
	public List<TradeBoardVO> selectSitterList() {
		List<TradeBoardVO> list = new ArrayList<TradeBoardVO>();
		try {
			psmt = conn.prepareStatement(
					"SELECT C.* FROM MEMBERS A, SITTER B, TRADEBOARD C WHERE C.SELLER = B.ID and A.ID = B.ID and C.SELLER = A.ID and C.ttype = '돌봐줄게요' order by C.CODE desc");
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new TradeBoardVO();
				vo.setCode(rs.getInt("code"));
				vo.setComm(rs.getString("code"));
				vo.setEtime(rs.getString("etime"));
				vo.setLocation1(rs.getString("location1"));
				vo.setLocation2(rs.getString("location2"));
				vo.setPrice(rs.getInt("price"));
				vo.setSeller(rs.getString("seller"));
				vo.setBuyer(rs.getString("buyer"));
				vo.setStatus(rs.getString("status"));
				vo.setStime(rs.getString("stime"));
				vo.setTitle(rs.getString("title"));
				vo.setTtime(rs.getString("ttime"));
				vo.setTtype(rs.getString("ttype"));
				vo.setSdate(rs.getString("sdate"));
				vo.setEdate(rs.getNString("edate"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 오너리스트 설렉하기
	public List<TradeBoardVO> selectOwnerList() {
		List<TradeBoardVO> list = new ArrayList<TradeBoardVO>();
		try {
			psmt = conn.prepareStatement(
					"select T.* from tradeboard T, pet P,(SELECT code,petcode FROM(SELECT code,petcode ,ROW_NUMBER() OVER(PARTITION BY code ORDER BY code,petcode) RM FROM petcode GROUP BY code, petcode) WHERE RM <= 1) C where T.ttype = '돌봐주세요' and T.code = C.code and P.code = C.petcode");
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new TradeBoardVO();
				vo.setCode(rs.getInt("code"));
				vo.setComm(rs.getString("code"));
				vo.setEtime(rs.getString("etime"));
				vo.setLocation1(rs.getString("location1"));
				vo.setLocation2(rs.getString("location2"));
				vo.setPrice(rs.getInt("price"));
				vo.setSeller(rs.getString("seller"));
				vo.setBuyer(rs.getString("buyer"));
				vo.setStatus(rs.getString("status"));
				vo.setStime(rs.getString("stime"));
				vo.setTitle(rs.getString("title"));
				vo.setTtime(rs.getString("ttime"));
				vo.setTtype(rs.getString("ttype"));
				vo.setSdate(rs.getString("sdate").substring(5, 10));
				vo.setEdate(rs.getNString("edate").substring(5, 10));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// sellerID로 거래 완료된 것들 select하기
	public List<TradeBoardVO> selectById(TradeBoardVO vo) {
		List<TradeBoardVO> list = new ArrayList<TradeBoardVO>();
		try {
			psmt = conn.prepareStatement("SELECT * FROM TRADEBOARD WHERE SELLER = ? and status = '거래완료'");
			psmt.setString(1, vo.getSeller());
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new TradeBoardVO();
				vo.setCode(rs.getInt("code"));
				vo.setComm(rs.getString("code"));
				vo.setEtime(rs.getString("etime"));
				vo.setLocation1(rs.getString("location1"));
				vo.setLocation2(rs.getString("location2"));
				vo.setPrice(rs.getInt("price"));
				vo.setSeller(rs.getString("seller"));
				vo.setBuyer(rs.getString("buyer"));
				vo.setStatus(rs.getString("status"));
				vo.setStime(rs.getString("stime"));
				vo.setTitle(rs.getString("title"));
				vo.setTtime(rs.getString("ttime"));
				vo.setTtype(rs.getString("ttype"));
				vo.setSdate(rs.getString("sdate"));
				vo.setEdate(rs.getNString("edate"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	//sellerID로  select하기
		public List<TradeBoardVO> selectBySeller(TradeBoardVO vo) {
			List<TradeBoardVO> list = new ArrayList<TradeBoardVO>();
			try {
				psmt = conn.prepareStatement("SELECT * FROM TRADEBOARD WHERE SELLER = ?");
				psmt.setString(1, vo.getSeller());
				rs = psmt.executeQuery();
				while (rs.next()) {
					vo = new TradeBoardVO();
					vo.setCode(rs.getInt("code"));
					vo.setComm(rs.getString("code"));
					vo.setEtime(rs.getString("etime"));
					vo.setLocation1(rs.getString("location1"));
					vo.setLocation2(rs.getString("location2"));
					vo.setPrice(rs.getInt("price"));
					vo.setSeller(rs.getString("seller"));
					vo.setBuyer(rs.getString("buyer"));
					vo.setStatus(rs.getString("status"));
					vo.setStime(rs.getString("stime"));
					vo.setTitle(rs.getString("title"));
					vo.setTtime(rs.getString("ttime"));
					vo.setTtype(rs.getString("ttype"));
					vo.setSdate(rs.getString("sdate"));
					vo.setEdate(rs.getNString("edate"));
					list.add(vo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return list;
		}
	
	// buyerID로 select하기
	public List<TradeBoardVO> selectByBuyer(TradeBoardVO vo) {
		List<TradeBoardVO> list = new ArrayList<TradeBoardVO>();
		try {
			psmt = conn.prepareStatement("SELECT * FROM TRADEBOARD WHERE BUYER = ?");
			psmt.setString(1, vo.getBuyer());
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new TradeBoardVO();
				vo.setCode(rs.getInt("code"));
				vo.setComm(rs.getString("code"));
				vo.setEtime(rs.getString("etime"));
				vo.setLocation1(rs.getString("location1"));
				vo.setLocation2(rs.getString("location2"));
				vo.setPrice(rs.getInt("price"));
				vo.setSeller(rs.getString("seller"));
				vo.setBuyer(rs.getString("buyer"));
				vo.setStatus(rs.getString("status"));
				vo.setStime(rs.getString("stime"));
				vo.setTitle(rs.getString("title"));
				vo.setTtime(rs.getString("ttime"));
				vo.setTtype(rs.getString("ttype"));
				vo.setSdate(rs.getString("sdate"));
				vo.setEdate(rs.getNString("edate"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	//---------------단문조회---------------//
	
	// code로 단문 select하기
	public TradeBoardVO selectByCode(TradeBoardVO vo) {
		try {
			psmt = conn.prepareStatement("SELECT * FROM TRADEBOARD WHERE CODE = ?");
			psmt.setInt(1, vo.getCode());
			rs = psmt.executeQuery();
			rs.next();
			vo = new TradeBoardVO();
			vo.setComm(rs.getNString("comm"));
			vo.setEdate((rs.getString("edate")).substring(0, 10));
			vo.setSdate((rs.getString("sdate")).substring(0, 10));
			vo.setStime(rs.getString("stime"));
			vo.setEtime(rs.getString("etime"));
			vo.setLocation1(rs.getString("location1"));
			vo.setLocation2(rs.getString("location2"));
			vo.setPrice(rs.getInt("price"));
			vo.setStatus(rs.getString("status"));
			vo.setTitle(rs.getString("title"));
			vo.setTtime(rs.getString("ttime"));
			vo.setSeller(rs.getString("seller"));
			vo.setBuyer(rs.getString("buyer"));
			vo.setCode(rs.getInt("code"));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
	}

	// 오너폼뷰
	public List<TradeBoardVO> selectAllByCode(TradeBoardVO vo) {
		List<TradeBoardVO> list = new ArrayList<TradeBoardVO>();
		try {
			psmt = conn.prepareStatement(
					"select T.* from tradeboard T, petcode C, pet P where T.code = ? and C.code = T.code and P.code = C.petcode");
			psmt.setInt(1, vo.getCode());
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new TradeBoardVO();
				vo.setComm(rs.getNString("comm"));
				vo.setEdate(rs.getString("edate"));
				vo.setSdate(rs.getString("sdate"));
				vo.setStime(rs.getString("stime"));
				vo.setEtime(rs.getString("etime"));
				vo.setLocation1(rs.getString("location1"));
				vo.setLocation2(rs.getString("location2"));
				vo.setPrice(rs.getInt("price"));
				vo.setStatus(rs.getString("status"));
				vo.setTitle(rs.getString("title"));
				vo.setTtime(rs.getString("ttime"));
				vo.setSeller(rs.getString("seller"));
				vo.setCode(rs.getInt("code"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	//----------------인서트----------------
	
	// 오너 인서트
	public int ownerInsert(TradeBoardVO vo) {
		int n = 0;
		try {
			// 시퀀스 조회
			psmt = conn.prepareStatement("select tradeboard_code.nextval from dual");
			ResultSet rs = psmt.executeQuery();
			rs.next();
			int code = rs.getInt(1); // 설렉트해온 첫 번째 컬럼
			vo.setCode(code);

			// 인서트 쿼리
			psmt = conn.prepareStatement("INSERT INTO TRADEBOARD "
					+ "(CODE, BUYER, TITLE, TTIME, PRICE, COMM, SDATE, EDATE, STIME, ETIME, TTYPE, LOCATION1, LOCATION2) VALUES "
					+ "(?, ?, ?, SYSDATE, ?, ?, ?, ?, ?, ?, '돌봐주세요', ?, ?)");
			psmt.setInt(1, vo.getCode());
			psmt.setString(2, vo.getBuyer());
			psmt.setString(3, vo.getTitle());
			psmt.setInt(4, vo.getPrice());
			psmt.setString(5, vo.getComm());
			psmt.setString(6, vo.getSdate());
			psmt.setString(7, vo.getEdate());
			psmt.setString(8, vo.getStime());
			psmt.setString(9, vo.getEtime());
			psmt.setString(10, vo.getLocation1());
			psmt.setString(11, vo.getLocation2());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}

	// 시터 인서트
	public int sitterInsert(TradeBoardVO vo) {
		int n = 0;
		try {
			// 시퀀스 조회
			psmt = conn.prepareStatement("select tradeboard_code.nextval from dual");
			ResultSet rs = psmt.executeQuery();
			rs.next();
			int code = rs.getInt(1); // 설렉트해온 첫 번째 컬럼
			vo.setCode(code);

			// 인서트 쿼리
			psmt = conn.prepareStatement("INSERT INTO TRADEBOARD "
					+ "(CODE, SELLER, TITLE, TTIME, PRICE, COMM, SDATE, EDATE, STIME, ETIME, TTYPE, LOCATION1, LOCATION2) VALUES "
					+ "(?, ?, ?, SYSDATE, ?, ?, ?, ?, ?, ?, '돌봐줄게요', ?, ?)");
			psmt.setInt(1, vo.getCode());
			psmt.setString(2, vo.getSeller());
			psmt.setString(3, vo.getTitle());
			psmt.setInt(4, vo.getPrice());
			psmt.setString(5, vo.getComm());
			psmt.setString(6, vo.getSdate());
			psmt.setString(7, vo.getEdate());
			psmt.setString(8, vo.getStime());
			psmt.setString(9, vo.getEtime());
			psmt.setString(10, vo.getLocation1());
			psmt.setString(11, vo.getLocation2());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}
	
	//트레이드 보드에 코드 값 기반으로 seller넣기
	public int insertSeller(TradeBoardVO vo) {
		int n = 0;
		try {
			psmt = conn.prepareStatement("insert into APPLYTRADE(id, code) values (?,?)");
			psmt.setString(1, vo.getSeller());
			psmt.setInt(2, vo.getCode());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
		
	}
	
	//----------------업데이트----------------
	// 시터 업데이트
	public int sitterUpdate(TradeBoardVO vo) {
		int n = 0;
		int cnt = 1;
		try {
			// 인서트 쿼리
			psmt = conn.prepareStatement("update TRADEBOARD set "
					+ "TITLE =?, "
					+ "TTIME =sysdate, "
					+ "PRICE =?, "
					+ "COMM =?, "
					+ "SDATE =?, "
					+ "EDATE =?, "
					+ "STIME =?, "
					+ "ETIME =?, "
					+ "LOCATION1 =?, "
					+ "LOCATION2 =? "
					+ "where code = ?");
			psmt.setString(cnt++, vo.getTitle());
			psmt.setInt(cnt++, vo.getPrice());
			psmt.setString(cnt++, vo.getComm());
			psmt.setString(cnt++, vo.getSdate());
			psmt.setString(cnt++, vo.getEdate());
			psmt.setString(cnt++, vo.getStime());
			psmt.setString(cnt++, vo.getEtime());
			psmt.setString(cnt++, vo.getLocation1());
			psmt.setString(cnt++, vo.getLocation2());
			psmt.setInt(cnt++, vo.getCode());			
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
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
