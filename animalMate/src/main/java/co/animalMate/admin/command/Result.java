package co.animalMate.admin.command;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

import co.animalMate.board.dao.MemberDao;
import co.animalMate.common.Action;
import co.animalMate.vo.MemberVO;

public class Result implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO 회원리스트 보기 구현
		MemberVO vo=new MemberVO();
		MemberDao dao=new MemberDao();
		HttpSession session = request.getSession(false);
		
		vo.setId((String)session.getAttribute("id"));
		List<MemberVO> author=dao.selectSearch(vo);
		session.setAttribute("sessionauthor",author);
		
		return null;
	}

}
