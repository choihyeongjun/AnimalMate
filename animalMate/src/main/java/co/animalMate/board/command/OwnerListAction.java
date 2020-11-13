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
		//데이터 설렉해오기
		PetDao petDao = new PetDao();
		List<TradeBoardVO> petList = petDao.selectOwnerList();
		
		//필터기능
		String ttype = request.getParameter("ttype");
		String status = request.getParameter("status");
		String location1 = request.getParameter("location1");
		String sDate = request.getParameter("sDate");
		String eDate = request.getParameter("eDate");
		String sTime = request.getParameter("sTime");		
		String eTime = request.getParameter("eTime");
		String minPrice = request.getParameter("minPrice");
		String maxPrice = request.getParameter("maxPrice");
		
		request.setAttribute("ttype", ttype);
		request.setAttribute("status", status);
		request.setAttribute("location1", location1);
		if(minPrice != null && minPrice != "") {
			for(TradeBoardVO a : petList) {
				if(a.getPrice()<=Integer.parseInt(minPrice)) {
					a.setPrice(0);
				}
			}
		}
		if(maxPrice != null && maxPrice != "") {
			for(TradeBoardVO a : petList) {
				if(a.getPrice()>=Integer.parseInt(maxPrice)) {
					a.setPrice(0);
				}
			}
		}
		if(sDate != null && sDate != "") {
			int sDateInt = Integer.parseInt(sDate.substring(0, 4) + sDate.substring(5,7) + sDate.substring(8));
			for(TradeBoardVO a : petList) {
				int getSdateInt = Integer.parseInt(a.getSdate().substring(0, 4) + a.getSdate().substring(5, 7) + a.getSdate().substring(8,10));
				if(getSdateInt < sDateInt) {
					a.setSdate("제외");
				}
			}
		}
		if(eDate != null && eDate != "") {
			int eDateInt = Integer.parseInt(eDate.substring(0, 4) + eDate.substring(5,7) + eDate.substring(8));
			for(TradeBoardVO a : petList) {
				int getEdateInt = Integer.parseInt(a.getEdate().substring(0, 4) + a.getEdate().substring(5, 7) + a.getEdate().substring(8,10));
				if(getEdateInt > eDateInt) {
					a.setSdate("제외");
				}
			}
		}

	
		request.setAttribute("Superlist", petList);
				
		return "jsp/board/ownerList.jsp";
	}

}
