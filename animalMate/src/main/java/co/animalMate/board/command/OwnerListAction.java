package co.animalMate.board.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.BoardDao;
import co.animalMate.common.Action;
import co.animalMate.vo.OwnerListVO;
import co.animalMate.vo.TradeBoardVO;


public class OwnerListAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		//owner 게시판 리스트 보기 구현
		BoardDao dao = new BoardDao();
		OwnerListVO vo = new OwnerListVO();
		List<OwnerListVO> list = new ArrayList<OwnerListVO>();
		List<OwnerListVO> list1 = new ArrayList<OwnerListVO>();
		
		list =  dao.selectAll();

		request.setAttribute("borders", list);

		

				
		return "jsp/board/ownerList.jsp";
	}

}
