package co.animalMate.board.command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.MemberDao;
import co.animalMate.board.vo.MemberVO;
import co.animalMate.common.Action;

public class JoinInsertAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO 회원정보를 DB에 입력한다.
		MemberDao dao = new MemberDao();
		MemberVO vo = new MemberVO();
		
		vo.setId(request.getParameter("id")); //form객체의 name이 id인 것을 받음
		vo.setName(request.getParameter("name"));
		vo.setPassword(request.getParameter("password"));
		vo.setAddress(request.getParameter("address"));
		vo.setTel(request.getParameter("tel"));
		vo.setEnterdate(Date.valueOf(request.getParameter("enterdate"))); //String값을 날짜값으로 바꿔준다
		
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
