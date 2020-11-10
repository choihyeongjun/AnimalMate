package co.animalMate.board.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.board.dao.PetDao;
import co.animalMate.common.Action;
import co.animalMate.vo.PetVO;

public class OwnerFormAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		//펫정보 보내기
		PetDao dao = new PetDao();
		PetVO vo = new PetVO();
		vo.setId(id);
		List<PetVO> list = new ArrayList<PetVO>();
		list = dao.selectPets(vo);
		request.setAttribute("petList", list);
		
		return "jsp/board/ownerForm.jsp";
	}

}
