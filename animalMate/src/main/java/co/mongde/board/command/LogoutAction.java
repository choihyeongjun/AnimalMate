package co.mongde.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.mongde.board.common.Action;

public class LogoutAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO 로그아웃 시키기
		HttpSession session = request.getSession(false);
		String name = (String) session.getAttribute("name");
		session.invalidate();
		request.setAttribute("name", name);
		
		return "jsp/main/logout.jsp";
	}

}
