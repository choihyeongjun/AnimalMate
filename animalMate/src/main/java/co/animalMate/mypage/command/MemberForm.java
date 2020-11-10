package co.animalMate.mypage.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.common.Action;
import co.animalMate.login.dao.MemberDao;
import co.animalMate.vo.MemberVO;

public class MemberForm implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//회원 정보 수정
		
		MemberDao dao = new MemberDao();
		MemberVO vo = new MemberVO();
		
//		HttpSession session = request.getSession(false);
//		String id = (String) session.getAttribute("id");
//		vo.setId(id);
		
		vo.setId("id3");
		
		vo = dao.select(vo);
			
		request.setAttribute("members", vo);
		return "jsp/mypage/memberForm.jsp";
	}

}
