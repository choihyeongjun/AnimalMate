package co.animalMate.board.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.board.dao.PetDao;
import co.animalMate.common.Action;
import co.animalMate.main.dao.JoblistDAO;
import co.animalMate.main.dao.PetCodeDAO;
import co.animalMate.main.dao.TradeBoardDAO;
import co.animalMate.vo.JoblistVO;
import co.animalMate.vo.PetCodeVO;
import co.animalMate.vo.PetVO;
import co.animalMate.vo.TradeBoardVO;

public class OwnerFormAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		//펫정보 보내기
		PetDao dao = new PetDao();
		PetVO vo = new PetVO();
		vo.setId(id);
		List<PetVO> list = new ArrayList<PetVO>();
		list = dao.selectPets(vo);
		request.setAttribute("petList", list);
		
		//수정하기 일 때 code기반 tradeboard, petcode, joblist정보 뿌리기
        if(request.getParameter("code") != null) {
        int code = Integer.parseInt(request.getParameter("code"));
        TradeBoardDAO tradeBoardDAO = new TradeBoardDAO();
        TradeBoardVO tradeBoardVO = new TradeBoardVO();
        tradeBoardVO.setCode(code);
        tradeBoardVO = tradeBoardDAO.selectByCode(tradeBoardVO);
        request.setAttribute("tradeBoardVO", tradeBoardVO);
        
        PetCodeDAO petCodeDAO = new PetCodeDAO();
        PetCodeVO petCodeVO = new PetCodeVO();
        List<PetCodeVO> petCodeList = new ArrayList<PetCodeVO>();
        petCodeVO.setCode(code);
        petCodeList = petCodeDAO.selectAllByCode(petCodeVO);
        request.setAttribute("petCodeList", petCodeList);
        
        JoblistDAO joblistDAO = new JoblistDAO();
        JoblistVO joblistVO = new JoblistVO();
        List<JoblistVO> joblistList = new ArrayList<JoblistVO>();
        joblistVO.setCode(code);
        joblistList = joblistDAO.selectAllByCode(joblistVO);
        request.setAttribute("joblistList", joblistList);
	    }
		
		return "jsp/board/ownerForm.jsp";
	}

}
