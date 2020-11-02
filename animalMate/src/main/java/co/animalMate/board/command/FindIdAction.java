package co.animalMate.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.common.Action;

public class FindIdAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO 아이디찾기 결과 창으로 이동
		return "main/webapp/jsp/login/findIdResult.jsp";
	}

}

