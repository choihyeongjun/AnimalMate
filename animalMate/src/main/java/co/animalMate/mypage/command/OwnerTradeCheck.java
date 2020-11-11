package co.animalMate.mypage.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.board.dao.MypageDao;
import co.animalMate.common.Action;
import co.animalMate.vo.MemberTradeListVO;
import co.animalMate.vo.PetVO;
import co.animalMate.vo.TradeListVO;

public class OwnerTradeCheck implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 돌봐주세요 화면 호출
		MypageDao myDao = new MypageDao();
		TradeListVO tlVo = new TradeListVO();
		PetVO petvo = new PetVO();
		MemberTradeListVO memtlVo = new MemberTradeListVO();
		
		// 세션 아이디 정보
		HttpSession session = request.getSession(false);
		String sid = (String) session.getAttribute("id");
		request.setAttribute("sid", sid);

		// 거래 게시판 정보 호출
		String codeString = request.getParameter("code");
		int code = Integer.parseInt(request.getParameter("code"));//클릭한 거래게시판 번호
		tlVo.setCode(code);// 거래번호 클릭시
		tlVo = myDao.selectUserTrade(tlVo);
		request.setAttribute("tbs", tlVo);
		
		// 거래 신청자 리스트 호출
		List<MemberTradeListVO> memlist = new ArrayList<MemberTradeListVO>();
		myDao = new MypageDao();
		memtlVo.setId(codeString);
		memlist = myDao.selectApplyTradeList(memtlVo);
		request.setAttribute("subUser", memlist);
		
		//거래 동물리스트 호출
		List<PetVO> petlist = new ArrayList<PetVO>();
		myDao = new MypageDao();
		petvo.setCode(codeString);
		petlist = myDao.selectTradepets(petvo);
		request.setAttribute("tpet", petlist);
		
		return "jsp/mypage/ownerTradeCheck.jsp";
	}
}
