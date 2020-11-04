package co.animalMate.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import co.animalMate.common.Action;


public class MypetList implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		//펫 목록 화면 호출
		return "jsp/mypage/mypetList.jsp";
	}

}
