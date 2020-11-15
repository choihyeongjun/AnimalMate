package co.animalMate.main.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.common.Action;
import co.animalMate.main.dao.JoblistDAO;
import co.animalMate.main.dao.PetCodeDAO;
import co.animalMate.main.dao.TradeBoardDAO;
import co.animalMate.vo.JoblistVO;
import co.animalMate.vo.PetCodeVO;
import co.animalMate.vo.TradeBoardVO;

public class OwnerUpdateAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
	//리퀘스트 값 변수 저장
		//TradeBoardVO
		TradeBoardVO tradeBoardVO = new TradeBoardVO();
		String title = request.getParameter("title");
		String location1 = request.getParameter("location1");
		String location2 = request.getParameter("location2");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String stime = request.getParameter("stime");
		String etime = request.getParameter("etime");
		int price = Integer.parseInt(request.getParameter("price"));
		String comm = request.getParameter("comm");
		int code = Integer.parseInt(request.getParameter("code"));
		
		tradeBoardVO.setTitle(title);
		tradeBoardVO.setLocation1(location1);
		tradeBoardVO.setLocation2(location2);
		tradeBoardVO.setSdate(sdate);
		tradeBoardVO.setEdate(edate);
		tradeBoardVO.setStime(stime);
		tradeBoardVO.setEtime(etime);
		tradeBoardVO.setPrice(price);
		tradeBoardVO.setComm(comm);
		tradeBoardVO.setCode(code);
		
		TradeBoardDAO tradeBoardDAO = new TradeBoardDAO();
		tradeBoardDAO.sitterUpdate(tradeBoardVO);//sitterUpdate인데 owner도 코드 똑같아서 같이 씀
		
		//PetCodeVO(삭제 후 재삽입)
		PetCodeDAO petCodeDAO = new PetCodeDAO();
		petCodeDAO.deleteByCode(code);
		PetCodeVO petCodeVO = new PetCodeVO();
		String[] petCodeString = request.getParameterValues("petCode");
		for(String a : petCodeString) {
			int petCode = Integer.parseInt(a);
			petCodeDAO = new PetCodeDAO();
			petCodeVO.setPetCode(petCode);
			petCodeVO.setCode(tradeBoardVO.getCode());
			petCodeDAO.ownerInsert(petCodeVO);
		}
		
		//JoblistVO(삭제 후 재삽입)
		JoblistDAO joblistDAO = new JoblistDAO();
		joblistDAO.deleteByCode(code);
		JoblistVO joblistVO = new JoblistVO();
		String[] joblistComm = request.getParameterValues("joblistComm");
		for(String a : joblistComm) {
			joblistDAO = new JoblistDAO();
			joblistVO.setCode(tradeBoardVO.getCode());
			joblistVO.setComm(a);
			joblistDAO.ownerInsert(joblistVO);
		}
		
		try {
			response.sendRedirect(request.getContextPath() + "/ownerFormSelect.do?code="+code);
			return null;
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
