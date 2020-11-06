package co.animalMate.login.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.common.Action;
import co.animalMate.login.dao.MemberDao;
import co.animalMate.vo.MemberVO;

public class idOverlapCheck implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MemberDao dao = new MemberDao();
		MemberVO vo = new MemberVO();
		HttpSession session = request.getSession(false);
		
		
		vo.setId(request.getParameter("id"));
		
		String msg1 = "";
		String page;
		vo = dao.findPw(vo);
		String id = vo.getId();
		page = "jsp/login/overlapIdCheckResult.jsp";
		if(vo.getId().equals(request.getParameter("id"))==false) {
			msg1 = "아이디가 일치하지 않습니다.";
			page= "jsp/login/overlapIdCheck.jsp";
			return page;
		}else {
			page = "jsp/login/overlapIdCheckResult.jsp?id="+id;
		}
		return page;
	}

}
