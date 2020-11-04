package co.animalMate.login.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.MemberDao;
import co.animalMate.common.Action;
import co.animalMate.vo.MemberVO;

public class ResetPwAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MemberDao dao = new MemberDao();
		MemberVO vo = new MemberVO();
		
		vo.setPw(request.getParameter("pw"));
		
		int n = dao.resetPw(vo);
		
		return null;
	}

}
