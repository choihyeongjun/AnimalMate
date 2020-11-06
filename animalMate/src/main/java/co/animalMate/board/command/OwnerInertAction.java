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
		
		
		vo.setTitle(request.getParameter("title"));
		vo.setPrice(Integer.parseInt(request.getParameter("price")));
		vo.setComm(request.getParameter("comm"));
		vo.setStime(request.getParameter("stime"));
		vo.setEtime(request.getParameter("etime"));
		vo.setLocation2(request.getParameter("location2"));
		vo.setBuyer("id1");
		vo.setSeller("id2");
		vo.setStatus("예약가능");
		vo.setWtime(2);
		vo.setTtype("owner");
	
		
		return "jsp/board/ownerFormView.jsp";
	}

}
