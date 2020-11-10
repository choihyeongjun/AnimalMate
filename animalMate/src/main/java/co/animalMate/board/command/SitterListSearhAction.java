package co.animalMate.board.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.BoardDao;
import co.animalMate.common.Action;
import co.animalMate.vo.BoardSearchVO;



public class SitterListSearhAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		//owner 게시판 리스트 보기 구현
		BoardDao dao = new BoardDao();
		BoardSearchVO vo = new BoardSearchVO();
		List<BoardSearchVO> list = new ArrayList<BoardSearchVO>();
		
		vo.setMaxp(request.getParameter("maxp"));
		vo.setStime(request.getParameter("sTime"));
		vo.setEtime(request.getParameter("eTime"));
		
		list =  dao.sitsearch(vo);
		request.setAttribute("sitborders", list); 

				
		return "jsp/board/sitterList.jsp";
	}

}
