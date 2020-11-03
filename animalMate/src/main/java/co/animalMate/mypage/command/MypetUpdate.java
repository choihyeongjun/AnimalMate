package co.animalMate.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.common.Action;

public class MypetUpdate implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//펫 수정, 삭제 화면 호출 
		return "jsp/mypage/mypetUpdate.jsp";
	}

}
