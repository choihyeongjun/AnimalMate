package co.animalMate.login.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.common.Action;

public class LogoutAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO 로그아웃 시키기
		HttpSession session = request.getSession(false);//세션 생성
		session.invalidate(); //세션 끊기
		
		try {
			response.sendRedirect(request.getContextPath() + "/main.do");
			return null;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}