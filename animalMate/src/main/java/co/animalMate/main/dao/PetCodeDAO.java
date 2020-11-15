package co.animalMate.main.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.animalMate.common.DAO;
import co.animalMate.vo.PetCodeVO;
import co.animalMate.vo.PetCodeVO;

public class PetCodeDAO extends DAO {
	private PreparedStatement psmt; // sql 명령문 실행
	private ResultSet rs; // select 후 결과셋 받기
	private PetCodeVO vo;
	
	//code로 전체 조회하기
	public List<PetCodeVO> selectAllByCode(PetCodeVO vo){
		List<PetCodeVO> list = new ArrayList<PetCodeVO>();
		try {
			psmt=conn.prepareStatement("SELECT * FROM PETCODE WHERE CODE = ?");
			psmt.setInt(1, vo.getCode());
			rs=psmt.executeQuery();
			while(rs.next()) {
				vo = new PetCodeVO();
				vo.setCode(rs.getInt("code"));
				vo.setPetCode(rs.getInt("petcode"));
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
	
	//인서트
	public int ownerInsert(PetCodeVO vo) { 
		int n = 0;
		try {
			psmt = conn.prepareStatement("INSERT INTO PETCODE " + 
					"(CODE, PETCODE) VALUES " + 
					"(?, ?)");
			psmt.setInt(1, vo.getCode());
			psmt.setInt(2, vo.getPetCode());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}
	
	//코드로 딜리트하기
	public int deleteByCode(int code) { 
		int n = 0;
		try {
			psmt = conn.prepareStatement("delete petcode where code = ?");
			psmt.setInt(1, code);
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
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
