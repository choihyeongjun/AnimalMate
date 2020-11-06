package co.animalMate.mypage.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.MypageDao;
import co.animalMate.board.dao.PetDao;
import co.animalMate.common.Action;
import co.animalMate.vo.MemberVO;
import co.animalMate.vo.PetVO;
import co.animalMate.vo.TradeBoardVO;

public class MytradeList implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//내 거래현황,내역 화면 호출
		MypageDao myDao = new MypageDao();
		MemberVO memVo = new MemberVO();
		TradeBoardVO tbVo = new TradeBoardVO();

		// 세션 아이디 정보
//		HttpSession session = request.getSession(false);
//		String id = (String) session.getAttribute("id");
//		memVo.setId(id);

		// User 정보 출력
		memVo.setId("id3");
		memVo = myDao.userInfo(memVo);
		
		// User 거래정보 출력
		myDao = new MypageDao();
		List<TradeBoardVO> list = new ArrayList<TradeBoardVO>();
		tbVo.setBuyer("id3");
		list = myDao.selectUserTrades(tbVo);

		request.setAttribute("tbs", list);
		request.setAttribute("user", memVo);
		return "jsp/mypage/mytradeList.jsp";
	}

}
