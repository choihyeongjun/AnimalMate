package co.animalMate.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.board.dao.MypageDao;
import co.animalMate.common.Action;
import co.animalMate.vo.ApplytradeVO;

public class OwnerTradeCheckAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 거래 체크 액션
		ApplytradeVO atVo = new ApplytradeVO();
		MypageDao myDao = new MypageDao();

		// 세션 아이디 정보
		HttpSession session = request.getSession(false);
		String sid = (String) session.getAttribute("id");
		request.setAttribute("sid", sid);

		// 거래상태변경 액션
		atVo.setCode(Integer.parseInt(request.getParameter("code")));
		atVo.setId(request.getParameter("id"));
		atVo.setStatus(sid);
		myDao.updateApplyTrade(atVo);

		return "mytradeList.do";
	}

}
