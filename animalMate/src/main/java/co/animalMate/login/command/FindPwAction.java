package co.animalMate.login.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.common.Action;
import co.animalMate.login.dao.MemberDao;
import co.animalMate.vo.MemberVO;

public class FindPwAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MemberDao dao = new MemberDao();
		MemberVO vo = new MemberVO();
		HttpSession session = request.getSession(false);
		
		 vo.setId(request.getParameter("id"));
		 vo.setName(request.getParameter("name"));
	     vo.setEmail(request.getParameter("email"));
		
		String page;
		vo = dao.findPw(vo);
		page = "jsp/login/pwReset.jsp";
		
		if(vo.getId()!=(request.getParameter("id")) && 
		vo.getName()!=(request.getParameter("name")) &&
			vo.getEmail()!=(request.getParameter("email"))) {
			
			page= "jsp/login/findpw.jsp";
			return page;
		}else {
			
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			session.setAttribute("email", vo.getEmail());
		}
		return page;
	}
}
