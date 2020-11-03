package co.animalMate.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.common.Action;

public class MemberForm implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//회원 정보 수정
		return "jsp/mypage/memberForm.jsp";
	}

}
