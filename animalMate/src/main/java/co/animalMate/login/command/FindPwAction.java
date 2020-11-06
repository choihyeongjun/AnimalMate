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
		String msg1 = "";
		String msg2 = "";
		String msg3 = "";
		
		vo = dao.findPw(vo);
		page = "jsp/login/pwReset.jsp";
		
		if(vo.getId().equals(request.getParameter("id"))==false) {
			msg1 = "아이디가 일치하지 않습니다.";
			page= "jsp/login/findpw.jsp";
		}else if
		(vo.getName().equals(request.getParameter("name"))==false){
			msg2 = "아이디가 일치하지 않습니다.";
			page= "jsp/login/findpw.jsp";
		}else if
			(vo.getEmail().equals(request.getParameter("email"))==false){
			msg3 = "아이디가 일치하지 않습니다.";
			page= "jsp/login/findpw.jsp";
		}else {
			session.setAttribute("id", vo.getId());
			session.setAttribute("pw", vo.getPw());
			session.setAttribute("name", vo.getName());
			session.setAttribute("email", vo.getEmail());
			page= "jsp/login/pwReset.jsp";
		}
	
		request.setAttribute("msg1", msg1);
		request.setAttribute("msg2", msg2);
		request.setAttribute("msg3", msg3);
		request.setAttribute("vo", vo);
		return page;
	}
}
