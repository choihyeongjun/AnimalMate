package co.animalMate.board.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.BoardFormDao;
import co.animalMate.board.dao.JobListDao;
import co.animalMate.common.Action;
import co.animalMate.vo.JoblistVO;
import co.animalMate.vo.OwnerFormVO;

public class OwnerFormViewAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		//Owner 테이블 정보 보내기
		List<OwnerFormVO> list = new ArrayList<OwnerFormVO>(); //여러건
		BoardFormDao dao = new BoardFormDao();
		OwnerFormVO vo = new OwnerFormVO();
		vo.setCode(request.getParameter("code"));
		list = dao.selectAll(vo);
		request.setAttribute("borders", list);
		
		
		//jobList테이블 정보 보내기
		JobListDao jobdao = new JobListDao();
		JoblistVO jobvo = new JoblistVO(); //단건
		jobvo.setCode(Integer.parseInt(request.getParameter("code")));
		jobvo = jobdao.selectAll(jobvo); 
		request.setAttribute("joblist", jobvo);

	
		return "jsp/board/ownerFormView.jsp";
	}

}