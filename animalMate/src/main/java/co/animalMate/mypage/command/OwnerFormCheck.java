package co.animalMate.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.MypageDao;
import co.animalMate.common.Action;
import co.animalMate.vo.MemberVO;
import co.animalMate.vo.TradeBoardVO;

public class OwnerFormCheck implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//맡기기 화면 호출
		MypageDao myDao = new MypageDao();
		MemberVO memVo = new MemberVO();
		TradeBoardVO tbVo = new TradeBoardVO();
		memVo.setId("id3");
		memVo = myDao.userInfo(memVo);
		
		// User 거래정보 출력
		myDao = new MypageDao();
		tbVo.setCode(3);
		tbVo = myDao.selectUserTrade(tbVo);

		request.setAttribute("tbs", tbVo);
		request.setAttribute("user", memVo);
		
		return "jsp/mypage/ownerFormCheck.jsp";
	}

}
