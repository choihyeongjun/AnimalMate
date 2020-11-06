package co.animalMate.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.BoardDao;
import co.animalMate.common.Action;
import co.animalMate.vo.OwnerInsertVO;



public class OwnerInertAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		BoardDao dao = new BoardDao();
		OwnerInsertVO vo = new OwnerInsertVO();
		
		vo.setBuyer("id21");
		vo.setTitle(request.getParameter("title"));
		vo.setLocation2(request.getParameter("location2"));
		vo.setStime(request.getParameter("stime"));
		vo.setEtime(request.getParameter("etime"));
		vo.setPrice(Integer.parseInt(request.getParameter("price")));
		vo.setComm(request.getParameter("comm"));
		
		vo.setStatus("예약가능");
		vo.setWtime(2);
		vo.setTtype("owner");
	
		
		return "jsp/board/ownerFormView.jsp";
	}

}
