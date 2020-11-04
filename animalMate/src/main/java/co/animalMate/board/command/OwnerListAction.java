package co.animalMate.board.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.BoardDao;
import co.animalMate.common.Action;
import co.animalMate.vo.TradeBoardVO;


public class OwnerListAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		//owner 게시판 리스트 보기 구현
		BoardDao dao = new BoardDao();
		TradeBoardVO vo = new TradeBoardVO();
		List<TradeBoardVO> list = new ArrayList<TradeBoardVO>();
		
		list =  dao.selectAll();
		request.setAttribute("borders", list); 
		
//		PetDao pdao = new PetDao();
//		TradeBoardVO vo = new TradeBoardVO();
//		List<TradeBoardVO> list = new ArrayList<TradeBoardVO>();
//		
//		plist = pdao.selectAll();
//		request.setAttribute("plist", list);
				
		return "jsp/board/ownerList.jsp";
	}

}
