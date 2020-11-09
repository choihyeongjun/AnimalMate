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
			TradeBoardVO TradeBoardVO = new TradeBoardVO();
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
			
			TradeBoardVO.setBuyer(buyer);
			TradeBoardVO.setTitle(title);
			TradeBoardVO.setLocation1(location1);
			TradeBoardVO.setLocation2(location2);
			TradeBoardVO.setSdate(sdate);
			TradeBoardVO.setEdate(edate);
			TradeBoardVO.setStime(stime);
			TradeBoardVO.setEtime(etime);
			TradeBoardVO.setPrice(price);
			TradeBoardVO.setComm(comm);
			
			TradeBoardDAO TradeBoardDAO = new TradeBoardDAO();
			TradeBoardDAO.ownerInsert(TradeBoardVO);
			
			//PetCodeVO
			PetCodeVO PetCodeVO = new PetCodeVO();
			int petCode = Integer.parseInt(request.getParameter("petCode"));
			System.out.println(petCode);
			PetCodeVO.setPetCode(petCode);
			
			PetCodeDAO PetCodeDAO = new PetCodeDAO();
			PetCodeDAO.ownerInsert(PetCodeVO);
			
			//JoblistVO
			JoblistVO JoblistVO = new JoblistVO();
			JoblistDAO JoblistDAO = new JoblistDAO();
			String[] joblistComm = request.getParameterValues("joblistComm");
			for(String a : joblistComm) {
				JoblistVO.setComm(a);
				JoblistDAO.ownerInsert(JoblistVO);
			}
			
//			System.out.println(buyer);
//			System.out.println(title);
//			System.out.println(petCode);
//			System.out.println(location1);
//			System.out.println(location2);
//			System.out.println(sdate);
//			System.out.println(edate);
//			System.out.println(stime);
//			System.out.println(etime);
//			System.out.println(price);
//			System.out.println(comm);
//			for(String a : joblistComm) {
//				System.out.println(a);
//			}
		
		return "jsp/board/ownerFormView.jsp";
	}

}
