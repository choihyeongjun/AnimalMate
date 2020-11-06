package co.animalMate.mypage.command;

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
		dao.delete(vo);
		
		return "mypetList.do";
	}

}
