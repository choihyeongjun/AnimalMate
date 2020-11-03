package co.animalMate.board.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import co.animalMate.vo.PetVO;
<<<<<<< HEAD
=======

>>>>>>> branch 'main' of https://github.com/yhoo0094/animalMate.git


public class PetDao {
	private PreparedStatement psmt; //sql 명령문 실행
	private ResultSet rs; //select 후 결과셋 받기
	private PetVO petVo;
	
	private final String SELECT_ALL = "SELECT * FROM PET";
	private final String SELECT = "SELECT * FROM PET WHERE ID = ? AND PASSWORD=?";
	private final String INSERT = "INSERT INTO PET() VALUES ()";
	private final String UPDATE = "UPDATE PET SET ";
	private final String DELETE = "DELETE FROM PET WHERE ID = ?"; 
}
