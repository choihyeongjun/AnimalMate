package co.animalMate.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.common.Action;

public class MypetForm implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//펫 등록 화면으로 이동
		return "jsp/mypage/mypetForm.jsp";
	}

}
