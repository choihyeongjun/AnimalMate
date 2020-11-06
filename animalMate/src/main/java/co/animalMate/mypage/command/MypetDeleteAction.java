package co.animalMate.mypage.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.PetDao;
import co.animalMate.common.Action;
import co.animalMate.vo.PetVO;

public class MypetDeleteAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 펫 삭제 액션
		PetDao dao = new PetDao();
		PetVO vo = new PetVO();
		vo.setCode(request.getParameter("code"));
		dao.insert(vo);
		
		//리스트.do
		List<PetVO> list = new ArrayList<PetVO>();
//		HttpSession session = request.getSession(false);
//		String id = (String) session.getAttribute("id");
//		vo.setId(id);
		vo.setId("id3");
		list = dao.selectPets(vo);

		request.setAttribute("pets", list);
		return "jsp/mypage/mypetList.jsp";
	}

}
