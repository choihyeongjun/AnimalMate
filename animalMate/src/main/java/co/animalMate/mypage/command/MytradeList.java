package co.animalMate.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.common.Action;

public class MytradeList implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//내 거래현황,내역 화면 호출
		return "jsp/mypage/mytradeList.jsp";
	}

}
