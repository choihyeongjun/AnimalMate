package co.animalMate.login.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.common.Action;

public class LogoutAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO 로그아웃 시키기
		HttpSession session = request.getSession(false);
		session.invalidate();
		
		return "main/jsp/main/mainMenu.jsp";
	}

}