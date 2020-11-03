package co.animalMate.main.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.board.dao.MemberDao;
import co.animalMate.common.Action;
import co.animalMate.vo.MemberVO;

public class GoLoginPageAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		return "/jsp/login/loginForm.jsp";
	}

}
