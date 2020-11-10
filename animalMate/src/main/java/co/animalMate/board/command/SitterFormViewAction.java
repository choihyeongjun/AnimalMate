package co.animalMate.board.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.SitterFormDao;
import co.animalMate.common.Action;
import co.animalMate.vo.SitterVO;

public class SitterFormViewAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		//시터테이블 정보 보내기		
		List<SitterVO> list = new ArrayList<SitterVO>();
		SitterFormDao sitterdao = new SitterFormDao();
		SitterVO svo = new SitterVO();
		svo.setCode(request.getParameter("code"));
	//	list = sitterdao.selectAll(svo);
		request.setAttribute("sitter", list );
		
	
		
		return  "jsp/board/sitterFormView.jsp";
	}

}
