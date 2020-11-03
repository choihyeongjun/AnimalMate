package co.animalMate.board.command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.MemberDao;
import co.animalMate.common.Action;
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
		vo.setTel(request.getParameter("tel"));
		vo.seteDate(Date.valueOf(request.getParameter("eDate")));
		vo.setAuthor(request.getParameter("author"));
		vo.setPoint(Integer.valueOf(request.getParameter("point")));
		vo.setStatus(request.getParameter("status"));
		vo.setLocation1(request.getParameter("location1"));
		vo.setLocation2(request.getParameter("location2"));
		vo.setEmail(request.getParameter("email"));
		vo.setPic(request.getParameter("pic"));
		vo.setZoomin1(Integer.valueOf(request.getParameter("zoomin1")));
		vo.setZoomin2(Integer.valueOf(request.getParameter("zoomin2")));
		
		int n = dao.insert(vo); //insert하고 n값을 반환해준다.
		String page;
		if(n != 0) {
			page = "jsp/member/insertSucess.jsp";
		} else {
			page = "jsp/member/insertFail.jsp";
		}
		return page;
	}

}
