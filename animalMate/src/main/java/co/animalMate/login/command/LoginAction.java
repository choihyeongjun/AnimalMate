package co.animalMate.login.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.board.dao.MemberDao;
import co.animalMate.common.Action;
import co.animalMate.vo.MemberVO;

public class LoginAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO 로그인 인증과정을 처리한다.
		MemberDao dao = new MemberDao();
		MemberVO vo = new MemberVO();
		HttpSession session = request.getSession(false);

		
		vo.setId(request.getParameter("id"));
		vo.setPw(request.getParameter("pw"));
		
		vo = dao.select(vo); //MemberDao의 select메소드를 실행한다.
		if(vo.getPw().equals(request.getParameter("pw")) ) {
			//session에 값 담기
			session.setAttribute("id", vo.getId());
			session.setAttribute("pw", vo.getPw()); 
			session.setAttribute("author", vo.getAuthor());
			session.setAttribute("name", vo.getName());
		} 
	
		request.setAttribute("vo", vo); //멤버를 실어서 보냄
		return "jsp/main/loginResult.jsp";
	}

}
