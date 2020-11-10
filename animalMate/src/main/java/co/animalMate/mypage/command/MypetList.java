package co.animalMate.mypage.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.board.dao.PetDao;
import co.animalMate.common.Action;
import co.animalMate.vo.PetVO;

public class MypetList implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 펫리스트 보기
		PetDao dao = new PetDao();
		PetVO vo = new PetVO();

		List<PetVO> list = new ArrayList<PetVO>();
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		
		
		// 해당 페이지의 리스트만 조회
		list = dao.selectPets(vo);
		System.out.println();

		request.setAttribute("pets", list);
		return "jsp/mypage/mypetList.jsp";
	}

}
