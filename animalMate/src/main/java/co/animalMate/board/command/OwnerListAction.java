package co.animalMate.board.command;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.common.Action;
import co.animalMate.main.dao.PetDao;
import co.animalMate.main.dao.TradeBoardDAO;
import co.animalMate.vo.PetVO;
import co.animalMate.vo.TradeBoardVO;


public class OwnerListAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		//데이터 설렉해오기
		PetDao petDao = new PetDao();
				
		List<TradeBoardVO> petList = petDao.selectOwnerList();
		
		request.setAttribute("Superlist", petList);
				
		return "jsp/board/ownerList.jsp";
	}

}
