package co.animalMate.board.command;

import java.util.ArrayList;
import java.util.List;

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
		List<PetVO> petList = new ArrayList<PetVO>();
		petList = petDao.selectOwnerList();
		
		TradeBoardDAO tradeBoardDAO = new TradeBoardDAO();
		List<TradeBoardVO> tradeBoardList = new ArrayList<TradeBoardVO>();
		tradeBoardList = tradeBoardDAO.selectOwnerList();
		
		//리스트에 담아서 보내기
		List<Object> VOlist = new ArrayList<Object>();
		List<Object> Superlist = new ArrayList<Object>();
		for(int i=0; i<petList.size(); i++) {
			VOlist = new ArrayList<Object>();
			VOlist.add(petList.get(i));
			VOlist.add(tradeBoardList.get(i));
			Superlist.add(VOlist);
		}
		request.setAttribute("Superlist", Superlist);
				
		return "jsp/board/ownerList.jsp";
	}

}
