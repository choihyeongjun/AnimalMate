package co.animalMate.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.board.dao.BoardDao;
import co.animalMate.common.Action;
import co.animalMate.vo.OwnerInsertVO;
import co.animalMate.vo.TradeBoardVO;

public class OwnerInsertAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		TradeBoardVO TradeBoardVO = new TradeBoardVO();
		HttpSession session = request.getSession();
		
		//리퀘스트 값 변수 저장
		String title = request.getParameter("title");
		String buyer = (String)session.getAttribute("id");
		
		
		//VO객체에 저장
		TradeBoardVO.setTitle(title);
		TradeBoardVO.setBuyer(buyer);
		
		System.out.println(request.getParameter("testttt"));
		System.out.println(title);
		
//		vo.setBuyer("id21");
//		vo.setTitle(request.getParameter("title"));
//		vo.setLocation2(request.getParameter("location2"));
//		vo.setStime(request.getParameter("stime"));
//		vo.setEtime(request.getParameter("etime"));
//		vo.setPrice(Integer.parseInt(request.getParameter("price")));
//		vo.setComm(request.getParameter("comm"));
//		
//		vo.setStatus("예약가능");
//		vo.setWtime(2);
//		vo.setTtype("owner");
	
		
		return "jsp/board/ownerFormView.jsp";
	}

}
