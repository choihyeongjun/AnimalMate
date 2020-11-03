package co.animalMate.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.PetDao;
import co.animalMate.common.Action;
import co.animalMate.vo.PetVO;

public class MypetFormAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		//펫 리스트로 다시 이동
		return "jsp/mypage/mypetForm.jsp";
	}

}
