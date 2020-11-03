package co.animalMate.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.common.Action;

public class OwnerFormCheck implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 맡기기 화면 호출
		return "jsp/mypage/ownerFormCheck.jsp";
	}

}
