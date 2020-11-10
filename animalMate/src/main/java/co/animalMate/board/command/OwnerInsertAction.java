package co.animalMate.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.board.dao.BoardDao;
import co.animalMate.common.Action;
import co.animalMate.main.dao.JoblistDAO;
import co.animalMate.main.dao.TradeBoardDAO;
import co.animalMate.main.dao.PetCodeDAO;
import co.animalMate.vo.JoblistVO;
import co.animalMate.vo.OwnerInsertVO;
import co.animalMate.vo.TradeBoardVO;
import co.animalMate.vo.PetCodeVO;

public class OwnerInsertAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		//리퀘스트 값 변수 저장
			//TradeBoardVO
			TradeBoardVO tradeBoardVO = new TradeBoardVO();
			String buyer = (String)session.getAttribute("id");
			String title = request.getParameter("title");
			String location1 = request.getParameter("location1");
			String location2 = request.getParameter("location2");
			String sdate = request.getParameter("sdate");
			String edate = request.getParameter("edate");
			String stime = request.getParameter("stime");
			String etime = request.getParameter("etime");
			int price = Integer.parseInt(request.getParameter("price"));
			String comm = request.getParameter("comm");
			
			tradeBoardVO.setBuyer(buyer);
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
			tradeBoardDAO.ownerInsert(tradeBoardVO);
			
			//PetCodeVO
			PetCodeVO petCodeVO = new PetCodeVO();
			int petCode = Integer.parseInt(request.getParameter("petCode"));
			
			petCodeVO.setPetCode(petCode);
			petCodeVO.setCode(tradeBoardVO.getCode());
			
			PetCodeDAO petCodeDAO = new PetCodeDAO();
			petCodeDAO.ownerInsert(petCodeVO);
			
			//JoblistVO
			JoblistVO joblistVO = new JoblistVO();
			String[] joblistComm = request.getParameterValues("joblistComm");
			for(String a : joblistComm) {
				JoblistDAO joblistDAO = new JoblistDAO(); //DAO객체 생성하면서 연결한다!
				joblistVO.setCode(tradeBoardVO.getCode());
				joblistVO.setComm(a);
				joblistDAO.ownerInsert(joblistVO);
			}
		
		return "jsp/board/ownerFormView.jsp";
	}

}
