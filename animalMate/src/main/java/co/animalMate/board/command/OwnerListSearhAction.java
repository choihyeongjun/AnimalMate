package co.animalMate.board.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.BoardDao;
import co.animalMate.common.Action;
import co.animalMate.vo.BoardSearchVO;



public class OwnerListSearhAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		//owner 게시판 리스트 보기 구현
		BoardDao dao = new BoardDao();
		BoardSearchVO vo = new BoardSearchVO();
		List<BoardSearchVO> list = new ArrayList<BoardSearchVO>();
		
		vo.setType(request.getParameter("petType"));
		vo.setSTime(request.getParameter("sTime"));
		vo.setETime(request.getParameter("eTime"));
		
		list =  dao.search(vo);
		request.setAttribute("borders", list); 

				
		return "jsp/board/ownerList.jsp";
	}

}
