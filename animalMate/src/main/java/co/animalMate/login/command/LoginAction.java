package co.animalMate.login.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.common.Action;
import co.animalMate.login.dao.MemberDao;
import co.animalMate.vo.MemberVO;

public class LoginAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO 로그인 인증과정을 처리한다.
		MemberDao dao = new MemberDao();
		MemberVO vo = new MemberVO();
		HttpSession session = request.getSession(false);
		
		
		vo.setId(request.getParameter("id"));
		String page;
		String msg1 = "";
		String msg2 = "";
		vo = dao.select(vo); //MemberDao의 select메소드를 실행한다.
		
		page =  "jsp/main/mainMenu.jsp";
		if(vo==null ) {
			msg1 = "아이디가 존재하지 않습니다.";
			page = "jsp/login/loginForm.jsp";
		}else {
			if(vo.getPw().equals(request.getParameter("pw")) == false) {
				msg2 = "비밀번호가 일치하지 않습니다.";
				page = "jsp/login/loginForm.jsp";
			}else {
				session.setAttribute("id", vo.getId());
				session.setAttribute("nName", vo.getnName());
				session.setAttribute("name", vo.getName());
				session.setAttribute("mvo", vo);
				
				//admin일 때 로그인
				if(vo.getId().equals("admin")) {
					try {
						response.sendRedirect(request.getContextPath() + "/adminLogin.do");
						return null;
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				
				//일반 유저 로그인
				try {
					response.sendRedirect(request.getContextPath() + "/main.do");
					return null;
				} catch (IOException e) {
					e.printStackTrace();
				}
			} 
		}
		
		request.setAttribute("msg1", msg1);
		request.setAttribute("msg2", msg2);
		request.setAttribute("vo", vo); //멤버를 실어서 보냄
		return page;
		}
	}

