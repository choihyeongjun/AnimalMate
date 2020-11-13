package co.animalMate.main.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.common.Action;
import co.animalMate.main.dao.TradeBoardDAO;
import co.animalMate.vo.TradeBoardVO;

public class SitterInsertAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		//리퀘스트 값 변수 저장
		//TradeBoardVO
		TradeBoardVO tradeBoardVO = new TradeBoardVO();
		String seller = (String)session.getAttribute("id");
		String title = request.getParameter("title");
		String location1 = request.getParameter("location1");
		String location2 = request.getParameter("location2");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String stime = request.getParameter("stime");
		String etime = request.getParameter("etime");
		int price = Integer.parseInt(request.getParameter("price"));
		String comm = request.getParameter("comm");
		
		tradeBoardVO.setSeller(seller);
		tradeBoardVO.setTitle(title);
		tradeBoardVO.setLocation1(location1);
		tradeBoardVO.setLocation2(location2);
		tradeBoardVO.setSdate(sdate);
		tradeBoardVO.setEdate(edate);
		tradeBoardVO.setStime(stime);
		tradeBoardVO.setEtime(etime);
		tradeBoardVO.setPrice(price);
		tradeBoardVO.setComm(comm);
		
		TradeBoardDAO tradeBoardDAO = new TradeBoardDAO();
		tradeBoardDAO.sitterInsert(tradeBoardVO);
		
		return "/sitterFormSelect.do?code="+tradeBoardVO.getCode();
	}

}
