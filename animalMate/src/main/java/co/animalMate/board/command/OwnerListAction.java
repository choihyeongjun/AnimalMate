package co.animalMate.board.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.common.Action;
import co.animalMate.main.dao.PetDao;
import co.animalMate.vo.TradeBoardVO;


public class OwnerListAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String ttype = request.getParameter("ttype");
		String status = request.getParameter("status");
		String location1 = request.getParameter("location1");
		String sDate = request.getParameter("sDate");
		String eDate = request.getParameter("eDate");
		String sTime = request.getParameter("sTime");		
		String eTime = request.getParameter("eTime");
		String minPrice = request.getParameter("minPrice");
		String maxPrice = request.getParameter("maxPrice");
		
		TradeBoardVO tradeBoardVO = new TradeBoardVO();
		tradeBoardVO.setTtype(ttype);
		

		
		
		
		
		//데이터 설렉해오기
		PetDao petDao = new PetDao();
		List<TradeBoardVO> petList = petDao.selectOwnerList();
		
		request.setAttribute("Superlist", petList);
				
		return "jsp/board/ownerList.jsp";
	}

}
