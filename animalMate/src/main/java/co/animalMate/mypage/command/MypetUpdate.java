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

public class MypetUpdate implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 펫 수정, 삭제 화면 호출
		PetDao petDao = new PetDao();
		PetVO petVo = new PetVO();
		List<PetVO> list = new ArrayList<PetVO>();

		// 세션 아이디 정보
//		HttpSession session = request.getSession(false);
//		String id = (String) session.getAttribute("id");
//		petVo.setId(id);
		String code = request.getParameter("code");
		
		
		// 임시 아이디.
		petVo.setId("id3");
		petVo.setCode(code);
		
		// User 펫 리스트 출력
		petVo = petDao.selectPet(petVo);
		request.setAttribute("pet", petVo);
		return "jsp/mypage/mypetUpdate.jsp";
	}

}
