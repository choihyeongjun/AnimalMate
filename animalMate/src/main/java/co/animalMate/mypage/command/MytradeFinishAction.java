package co.animalMate.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.MypageDao;
import co.animalMate.common.Action;
import co.animalMate.vo.TradeBoardVO;

public class MytradeFinishAction implements Action {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 거래 종료 + 돈넘기는 액션
		// 거래 체크 액션
		TradeBoardVO tbVo = new TradeBoardVO();
		MypageDao myDao = new MypageDao();
		
		// 거래상태변경 액션 / 시터 돈 주기
		tbVo.setCode(Integer.parseInt(request.getParameter("tcode")));
		tbVo.setSeller(request.getParameter("tid"));
		myDao.updateTradeFinish(tbVo);

		return "mytradeList.do";
	}

}
