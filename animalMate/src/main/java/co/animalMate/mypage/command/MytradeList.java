package co.animalMate.mypage.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.board.dao.MypageDao;
import co.animalMate.common.Action;
import co.animalMate.main.dao.ApplytradeDAO;
import co.animalMate.main.dao.TradeBoardDAO;
import co.animalMate.vo.ApplytradeVO;
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
		
		//내가 seller이고 거래 대상이 확정됨
		TradeBoardVO tradeBoardVO = new TradeBoardVO();
		TradeBoardDAO tradeBoardDAO = new TradeBoardDAO();
		List<TradeBoardVO> tradeBoardSellerList = new ArrayList<TradeBoardVO>();
		tradeBoardVO.setSeller(id);//로그인 세션 아이디
		tradeBoardSellerList = tradeBoardDAO.selectBySeller(tradeBoardVO);
		request.setAttribute("tradeBoardSellerList", tradeBoardSellerList);
		
		//내가 buyer이고 거래 대상이 확정됨
		tradeBoardVO = new TradeBoardVO();
		tradeBoardDAO = new TradeBoardDAO();
		List<TradeBoardVO> tradeBoardBuyerList = new ArrayList<TradeBoardVO>();
		tradeBoardVO.setBuyer(id);//로그인 세션 아이디
		tradeBoardBuyerList = tradeBoardDAO.selectByBuyer(tradeBoardVO);
		request.setAttribute("tradeBoardBuyerList", tradeBoardBuyerList);
		
		//거래 대상이 미정임
		ApplytradeVO applytradeVO = new ApplytradeVO();
		ApplytradeDAO applytradeDAO = new ApplytradeDAO();
		List<ApplytradeVO> applytradeList = new ArrayList<ApplytradeVO>();
		applytradeVO.setId(id);//로그인 세션 아이디
		applytradeList = applytradeDAO.selectById(applytradeVO);
		List<TradeBoardVO> tradeBoardApplyList = new ArrayList<TradeBoardVO>();
		for(ApplytradeVO a : applytradeList) {
			tradeBoardVO = new TradeBoardVO();
			tradeBoardDAO = new TradeBoardDAO();
			tradeBoardVO.setCode(a.getCode());
			tradeBoardVO = tradeBoardDAO.selectByCode(tradeBoardVO);
			tradeBoardApplyList.add(tradeBoardVO);
		}
		request.setAttribute("tradeBoardApplyList", tradeBoardApplyList);
		
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
