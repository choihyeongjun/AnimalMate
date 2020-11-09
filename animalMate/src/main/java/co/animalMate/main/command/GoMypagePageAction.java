package co.animalMate.main.command;

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

public class GoMypagePageAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 마이페이지 DB 정보 출력
		PetVO petVo = new PetVO();
		TradeBoardVO tbVo = new TradeBoardVO();
		MemberVO memVo = new MemberVO();

		List<PetVO> list = new ArrayList<PetVO>();

		MypageDao myDao = new MypageDao();
		PetDao petDao = new PetDao();


		// 세션 아이디 정보
//		HttpSession session = request.getSession(false);
//		String id = (String) session.getAttribute("id");
//		petVo.setId(id);

		// User 펫 리스트 출력
		petVo.setId("id3");
		list = petDao.selectPets(petVo);
		
		// User 정보 출력
		memVo.setId("id3");
		memVo = myDao.userInfo(memVo);
		
		// 거래 횟수 호출
		myDao = new MypageDao();
		tbVo.setBuyer("id3");
		tbVo.setSeller("id3");
		tbVo = myDao.tradeCount(tbVo);

		
		request.setAttribute("tcount", tbVo);
		request.setAttribute("pets", list);
		request.setAttribute("user", memVo);
		return "jsp/mypage/mypage.jsp";
	}

}
