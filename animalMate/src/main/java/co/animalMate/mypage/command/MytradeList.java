package co.animalMate.mypage.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.board.dao.MypageDao;
import co.animalMate.common.Action;
import co.animalMate.vo.MemberVO;
import co.animalMate.vo.TradeBoardVO;
import co.animalMate.vo.TradeListVO;

public class MytradeList implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//내 거래현황,내역 화면 호출
		MypageDao myDao = new MypageDao();
		MemberVO memVo = new MemberVO();
		TradeListVO tlVo = new TradeListVO();

		// 세션 아이디 정보
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("id");
		request.setAttribute("sid", id);
		memVo.setId(id);
		
		// User 정보 출력
		memVo = myDao.userInfo(memVo);
		
		// User 거래정보 출력
		myDao = new MypageDao();
		List<TradeListVO> list = new ArrayList<TradeListVO>();
		tlVo.setBuyer(id);//로그인 세션 아이디
		list = myDao.selectUserTrades(tlVo);
		request.setAttribute("tbs", list);
		request.setAttribute("user", memVo);
		
		//돌봄 예약
		myDao = new MypageDao();
		TradeBoardVO tbVo = new TradeBoardVO();
		tbVo.setSeller(id);
		tbVo = myDao.selectMytradeSellerCount(tbVo);
		request.setAttribute("countSell", tbVo.getCode());
		
		//맡김 예약
		myDao = new MypageDao();
		tbVo = new TradeBoardVO();
		tbVo.setBuyer(id);
		tbVo = myDao.selectMytradeBuyerCount(tbVo);
		request.setAttribute("countBuy", tbVo.getCode());
		
		return "jsp/mypage/mytradeList.jsp";
	}

}
