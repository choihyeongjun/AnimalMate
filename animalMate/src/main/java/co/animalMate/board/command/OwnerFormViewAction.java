package co.animalMate.board.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.JobListDao;
import co.animalMate.common.Action;
import co.animalMate.main.dao.MemberDao;
import co.animalMate.main.dao.PetDao;
import co.animalMate.main.dao.TradeBoardDAO;
import co.animalMate.vo.JoblistVO;
import co.animalMate.vo.MemberVO;
import co.animalMate.vo.PetCodeVO;
import co.animalMate.vo.PetVO;
import co.animalMate.vo.TradeBoardVO;

public class OwnerFormViewAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		int code = Integer.parseInt(request.getParameter("code"));
		
		//tradeboard테이블
		TradeBoardDAO tradeBoardDAO = new TradeBoardDAO();
		TradeBoardVO tradeBoardVO = new TradeBoardVO();
		tradeBoardVO.setCode(code);
		tradeBoardVO = tradeBoardDAO.selectByCode(tradeBoardVO);
		request.setAttribute("tradeBoardVO", tradeBoardVO);
		
		//members테이블
		MemberDao memberDao = new MemberDao();
		MemberVO memberVO = new MemberVO();
		memberVO.setId(tradeBoardVO.getSeller());
		memberVO = memberDao.selectById(memberVO);
		request.setAttribute("memberVO", memberVO);
		
		//pet테이블
		PetDao petDAO = new PetDao();
		PetVO petVO = new PetVO();
		PetCodeVO petCodeVO = new PetCodeVO();
		petCodeVO.setCode(code);
		List<PetVO> petList = new ArrayList<PetVO>();
		petList = petDAO.selectAllByTradeCode(petCodeVO);
		request.setAttribute("petList", petList);
		
		//jobList테이블
		JobListDao jobdao = new JobListDao();
		JoblistVO jobvo = new JoblistVO();
		List<JoblistVO> joblistList = new ArrayList<JoblistVO>();
		jobvo.setCode(Integer.parseInt(request.getParameter("code")));
		joblistList = jobdao.selectAllByCode(jobvo); 
		request.setAttribute("joblist", joblistList);

	
		return "jsp/board/ownerFormView.jsp";
	}

}