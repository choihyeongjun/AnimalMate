package co.animalMate.board.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import co.animalMate.board.vo.PetVO;


public class PetDao {
	private PreparedStatement psmt; //sql 명령문 실행
	private ResultSet rs; //select 후 결과셋 받기
	private PetVO vo;
}
