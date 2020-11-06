package co.animalMate.login.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.common.Action;
import co.animalMate.login.dao.MemberDao;
import co.animalMate.vo.MemberVO;

public class JoinInsertAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO 회원정보를 DB에 입력한다.
		MemberDao dao = new MemberDao();
		MemberVO vo = new MemberVO();
		
		vo.setId(request.getParameter("id"));
		vo.setPw(request.getParameter("pw"));
		vo.setName(request.getParameter("name"));
		vo.setnName(request.getParameter("nName"));
		vo.setEmail(request.getParameter("email"));
		vo.setTel(request.getParameter("tel"));
		vo.setZoomin1(Integer.valueOf(request.getParameter("zoomin1")));
		vo.setZoomin2(Integer.valueOf(request.getParameter("zoomin2")));
		vo.setLocation1(request.getParameter("location1"));
		vo.setLocation2(request.getParameter("location2"));
		
		
		int n = dao.insert(vo); //insert하고 n값을 반환해준다.
	 
		return "jsp/login/loginForm.jsp";
	}

}
