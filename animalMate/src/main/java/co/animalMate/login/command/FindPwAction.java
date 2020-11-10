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
		String msg = "";

		vo = dao.findPw(vo);
		page = "jsp/login/pwReset.jsp";
		
		if(vo.getId().equals(request.getParameter("id"))==false) {
			msg = "일치하는 회원 정보가 없습니다.";
			page= "jsp/login/findpw.jsp";
		}else if
		(vo.getName().equals(request.getParameter("name"))==false){
			msg = "일치하는 회원 정보가 없습니다.";
			page= "jsp/login/findpw.jsp";
		}else if
			(vo.getEmail().equals(request.getParameter("email"))==false){
			msg = "일치하는 회원 정보가 없습니다.";
			page= "jsp/login/findpw.jsp";
		}else {
			session.setAttribute("id", vo.getId());
			session.setAttribute("pw", vo.getPw());
			session.setAttribute("name", vo.getName());
			session.setAttribute("email", vo.getEmail());
			page= "jsp/login/pwReset.jsp";
		}
	
		request.setAttribute("msg", msg);
		request.setAttribute("vo", vo);
		return page;
	}
}
