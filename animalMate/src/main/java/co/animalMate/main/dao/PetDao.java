package co.animalMate.main.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.PetCodeVO;
import co.animalMate.vo.PetVO;
import co.animalMate.vo.TradeBoardVO;

public class PetDao extends DAO {
	private PreparedStatement psmt; // sql 명령문 실행
	private ResultSet rs; // select 후 결과셋 받기
	private PetVO vo;
	
	private final String SELECT_ALL_PETS = "SELECT * FROM PET";
	private final String SELECT_PETS = "SELECT * FROM PET WHERE ID = ?";
	private final String SELECT_PET = "SELECT * FROM PET WHERE CODE = ?";
	private final String INSERT = "INSERT INTO PET VALUES(PET_CODE.NEXTVAL,?,?,?,?,?,?,?,?,?)";
	private final String UPDATE = "UPDATE PET SET NAME = ?, AGE = ?, GENDER = ?, TYPE = ?, DETAILTYPE = ?, CUT = ?, COMM = ?, PIC = ? WHERE CODE=?";
	private final String DELETE = "DELETE FROM PET WHERE CODE = ?";
	private final String SELECT_PET_PIC = "SELECT PIC FROM PET WHERE CODE = ?";
	
	
	// 전체 펫 조회
	public List<PetVO> SELECT_ALL_PETS(PetVO vo) {
		List<PetVO> list = new ArrayList<PetVO>();
		try {
			psmt = conn.prepareStatement(SELECT_ALL_PETS);
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new PetVO();
				vo.setCode(rs.getString("code"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setType(rs.getString("type"));
				vo.setDetailType(rs.getString("detailType"));
				vo.setCut(rs.getString("cut"));
				vo.setComm(rs.getString("comm"));
				vo.setId(rs.getString("id"));
				vo.setPic(rs.getString("pic"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	//petcode의 code기반으로 pet찾기
	public List<PetVO> selectAllByTradeCode(PetCodeVO Cvo) { //매개변수 펫코드 vo임!
		List<PetVO> list = new ArrayList<PetVO>();
		try {
			psmt = conn.prepareStatement("select P.* from tradeboard T, petcode C, pet P where T.code = ? and C.code = T.code and P.code = C.petcode");
			psmt.setInt(1, Cvo.getCode());
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new PetVO();
				vo.setCode(rs.getString("code"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setType(rs.getString("type"));
				vo.setDetailType(rs.getString("detailType"));
				vo.setCut(rs.getString("cut"));
				vo.setComm(rs.getString("comm"));
				vo.setId(rs.getString("id"));
				vo.setPic(rs.getString("pic"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
//	//오너리스트 설렉하기
//	public List<PetVO> selectOwnerList() {
//		List<PetVO> list = new ArrayList<PetVO>();
//		try {
//			psmt = conn.prepareStatement("select P.* from tradeboard T, pet P,(SELECT code,petcode FROM(SELECT code,petcode ,ROW_NUMBER() OVER(PARTITION BY code ORDER BY code,petcode) RM FROM petcode GROUP BY code, petcode) WHERE RM <= 1) C where T.ttype = '돌봐주세요' and T.code = C.code and P.code = C.petcode");
//			rs = psmt.executeQuery();
//			while (rs.next()) {
//				vo = new PetVO();
//				vo.setCode(rs.getString("code"));
//				vo.setName(rs.getString("name"));
//				vo.setAge(rs.getInt("age"));
//				vo.setGender(rs.getString("gender"));
//				vo.setType(rs.getString("type"));
//				vo.setDetailType(rs.getString("detailType"));
//				vo.setCut(rs.getString("cut"));
//				vo.setComm(rs.getString("comm"));
//				vo.setId(rs.getString("id"));
//				vo.setPic(rs.getString("pic"));
//				list.add(vo);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//		return list;
//	}
	
	//오너리스트 설렉하기
			public List<TradeBoardVO> selectOwnerList() {
				
				List<TradeBoardVO> tradeBoardList = new ArrayList<TradeBoardVO>();
				
				try {
					psmt = conn.prepareStatement("select t.*, p.code as pcode, p.name, p.age, p.gender, p.type, p.detailType, p.cut , p.comm as pcomm , p.id , p.pic from tradeboard T, pet P,(SELECT code,petcode FROM(SELECT code,petcode ,ROW_NUMBER() OVER(PARTITION BY code ORDER BY code,petcode) RM FROM petcode GROUP BY code, petcode) WHERE RM <= 1) C where T.ttype = '돌봐주세요' and T.code = C.code and P.code = C.petcode");
					rs = psmt.executeQuery();
					while (rs.next()) {
						vo = new PetVO();
						vo.setCode(rs.getString("pcode"));
						vo.setName(rs.getString("name"));
						vo.setAge(rs.getInt("age"));
						vo.setGender(rs.getString("gender"));
						vo.setType(rs.getString("type"));
						vo.setDetailType(rs.getString("detailType"));
						vo.setCut(rs.getString("cut"));
						vo.setComm(rs.getString("pcomm"));
						vo.setId(rs.getString("id"));
						vo.setPic(rs.getString("pic"));
					
						
						TradeBoardVO tvo = new TradeBoardVO();
						tvo.setPetVO(vo);
						tvo.setCode(rs.getInt("code"));
						tvo.setComm(rs.getString("comm"));
						tvo.setEtime(rs.getString("etime"));
						tvo.setLocation1(rs.getString("location1"));
						tvo.setLocation2(rs.getString("location2"));
						tvo.setPrice(rs.getInt("price"));
						tvo.setSeller(rs.getString("seller"));
						tvo.setBuyer(rs.getString("buyer"));
						tvo.setStatus(rs.getString("status"));
						tvo.setStime(rs.getString("stime"));
						tvo.setTitle(rs.getString("title"));
						tvo.setTtime(rs.getString("ttime"));
						tvo.setTtype(rs.getString("ttype"));
						tvo.setSdate(rs.getString("sdate").substring(5, 10));
						tvo.setEdate(rs.getNString("edate").substring(5, 10));
						tradeBoardList.add(tvo);
					}
					
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close();
				}
				return tradeBoardList;
			}	
	
	// User 자기 펫 전체조회
	public List<PetVO> selectPets(PetVO vo) {
		List<PetVO> list = new ArrayList<PetVO>();
		try {
			psmt = conn.prepareStatement(SELECT_PETS);
			psmt.setString(1, vo.getId());
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new PetVO();
				vo.setCode(rs.getString("code"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setType(rs.getString("type"));
				vo.setDetailType(rs.getString("detailType"));
				vo.setCut(rs.getString("cut"));
				vo.setComm(rs.getString("comm"));
				vo.setId(rs.getString("id"));
				vo.setPic(rs.getString("pic"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// User펫 목록 단일 선택 조회
	public PetVO selectPet(PetVO vo) {
		try {
			psmt = conn.prepareStatement(SELECT_PET);
			psmt.setString(1, vo.getCode());
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo = new PetVO();
				vo.setCode(rs.getString("code"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setType(rs.getString("type"));
				vo.setDetailType(rs.getString("detailType"));
				vo.setCut(rs.getString("cut"));
				vo.setComm(rs.getString("comm"));
				vo.setId(rs.getString("id"));
				vo.setPic(rs.getString("pic"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
	}
	
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
	
	// id,name기반 단일 조회
		public PetVO selectByIdName(PetVO vo) {
			try {
				psmt = conn.prepareStatement("SELECT * FROM PET WHERE ID = ? and NAME = ?");
				psmt.setString(1, vo.getId());
				psmt.setString(2, vo.getName());
				rs = psmt.executeQuery();
				if(rs.next()) {
					vo = new PetVO();
					vo.setCode(rs.getString("code"));
					vo.setName(rs.getString("name"));
					vo.setAge(rs.getInt("age"));
					vo.setGender(rs.getString("gender"));
					vo.setType(rs.getString("type"));
					vo.setDetailType(rs.getString("detailType"));
					vo.setCut(rs.getString("cut"));
					vo.setComm(rs.getString("comm"));
					vo.setId(rs.getString("id"));
					vo.setPic(rs.getString("pic"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return vo;
		}

	// 펫 등록
	public int insert(PetVO vo) {
		int n = 0;
		try {
			psmt = conn.prepareStatement(INSERT);

			psmt.setString(1, vo.getName());
			psmt.setInt(2, vo.getAge());
			psmt.setString(3, vo.getGender());
			psmt.setString(4, vo.getType());
			psmt.setString(5, vo.getDetailType());
			psmt.setString(6, vo.getCut());
			psmt.setString(7, vo.getComm());
			psmt.setString(8, vo.getId());
			psmt.setString(9, vo.getPic());

			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}

	// 업데이트
	public int update(PetVO vo) {
		int n = 0;
		try { 			
			psmt = conn.prepareStatement(UPDATE);
			psmt.setString(1, vo.getName());
			psmt.setInt(2, vo.getAge());
			psmt.setString(3, vo.getGender());
			psmt.setString(4, vo.getType());
			psmt.setString(5, vo.getDetailType());
			psmt.setString(6, vo.getCut());
			psmt.setString(7, vo.getComm());
			psmt.setString(8, vo.getPic());
			psmt.setString(9, vo.getCode());

			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	// 값 삭제
	public int delete(PetVO vo) {
		int n = 0;
		try {
			psmt = conn.prepareStatement(DELETE);
			psmt.setString(1, vo.getCode());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
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
