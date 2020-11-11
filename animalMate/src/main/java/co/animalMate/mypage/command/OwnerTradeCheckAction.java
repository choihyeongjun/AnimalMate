package co.animalMate.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.MypageDao;
import co.animalMate.common.Action;
import co.animalMate.vo.ApplytradeVO;

public class OwnerTradeCheckAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 거래 체크 액션
		ApplytradeVO atVo = new ApplytradeVO();
		MypageDao myDao = new MypageDao();
		
		// 거래상태변경 액션
		atVo.setCode(Integer.parseInt(request.getParameter("code")));
		atVo.setId(request.getParameter("id"));
		myDao.updateApplyTrade(atVo);
		
		return "mytradeList.do";
	}

}
