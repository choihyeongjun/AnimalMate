package co.animalMate.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.board.dao.MypageDao;
import co.animalMate.common.Action;
import co.animalMate.vo.MemberVO;

public class PointChargingAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 포인트 충전 액션
		MemberVO memVo = new MemberVO();
		MypageDao myDao = new MypageDao();
		int point = Integer.parseInt(request.getParameter("point"));
		
		// 세션 아이디 정보
		HttpSession session = request.getSession(false);
		String sid = (String) session.getAttribute("id");
		request.setAttribute("sid", sid);
		
		memVo.setPoint(point);
		memVo.setId(sid);
		myDao.updateStatusJoblist(memVo);
		
		return "mytradeList.do";
	}

}
