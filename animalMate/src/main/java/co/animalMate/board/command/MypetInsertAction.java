package co.animalMate.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.vo.PetVO;
import co.animalMate.common.Action;

public class MypetInsertAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		PetDao dao = new PetDao();
		PetVO vo = new PetVO();
		
		//map.put("/mypetInsert.do", new MypetInsertAction());
		
		
		
		
		String page;
		if(n != 0) {
			page = "#";
		} else {
			page = "#";
		}
		return page;
	}

}
