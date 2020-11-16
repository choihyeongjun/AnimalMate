package co.animalMate.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.MypageDao;
import co.animalMate.common.Action;
import co.animalMate.vo.ApplytradeVO;

public class SitterTradeCheckAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 돌봐줄게요 게시판 거래체크 화면
		ApplytradeVO atVo = new ApplytradeVO();
		MypageDao myDao = new MypageDao();

		// 거래상태변경 액션
		atVo.setCode(Integer.parseInt(request.getParameter("code")));
		atVo.setId(request.getParameter("id"));
		myDao.updateSitterApplyTrade(atVo);
		
		return "mytradeList.do";
	}

}
