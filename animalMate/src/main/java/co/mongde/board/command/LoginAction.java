package co.mongde.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.mongde.board.common.Action;
import co.mongde.board.dao.MemberDao;
import co.mongde.board.vo.MemberVO;

public class LoginAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO 로그인 인증과정을 처리한다.
		MemberDao dao = new MemberDao();
		MemberVO vo = new MemberVO();
		HttpSession session = request.getSession(false);
		String msg;
		
		vo.setId(request.getParameter("id"));
		vo.setPassword(request.getParameter("password"));
		
		vo = dao.select(vo); //MemberDao의 select메소드를 실행한다.
		if(vo.getPassword().equals(request.getParameter("password")) ) {
			//session에 값 담기
			session.setAttribute("id", vo.getId()); 
			session.setAttribute("author", vo.getAuthor());
			session.setAttribute("name", vo.getName());
			
			msg = "성공";
		} else {
			msg = "성공";
		}
		
		request.setAttribute("msg", msg); //멤버를 실어서 보냄
		request.setAttribute("vo", vo); //멤버를 실어서 보냄
		return "jsp/main/loginResult.jsp";
	}

}
