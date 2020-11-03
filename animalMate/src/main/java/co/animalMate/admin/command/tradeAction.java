package co.animalMate.admin.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.MemberDao;
import co.animalMate.common.Action;
import co.animalMate.vo.MemberVO;

public class tradeAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO 회원리스트 보기 구현
		
		
		
		return "jsp/admin/test/memberlist.jsp";
	}

}
