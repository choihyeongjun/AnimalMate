package co.animalMate.main.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.common.Action;

public class AdminLoginAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		//admin일 때 로그인
		if(session.getAttribute("id").equals("admin")) {
			return "jsp/admin/test/admin.jsp";
		}
		return null;
	}

}
