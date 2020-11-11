package co.animalMate.board.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.SitterFormDao;
import co.animalMate.common.Action;
import co.animalMate.vo.SitterFormViewVO;



public class SitterFormViewAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		

		//시터테이블 정보 보내기		
		List<SitterFormViewVO> list = new ArrayList<SitterFormViewVO>();
		SitterFormDao dao = new SitterFormDao();
		SitterFormViewVO vo = new SitterFormViewVO();
		
		vo.setCode(Integer.parseInt(request.getParameter("code")));
		list = dao.selectAll(vo);
		request.setAttribute("sitters", list );

		
		
		
		return  "jsp/board/sitterFormView.jsp";
	}

}
