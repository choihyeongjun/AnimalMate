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
		BoardFormDao dao = new BoardFormDao();
		OwnerFormVO vo = new OwnerFormVO();

		JobListDao jobdao = new JobListDao();

		List<OwnerFormVO> list = new ArrayList<OwnerFormVO>(); //여러건
		JoblistVO jobvo = new JoblistVO(); //단건

		vo.setCode(request.getParameter("code"));

		jobvo.setCode(Integer.parseInt(request.getParameter("code")));

		list = dao.selectAll(vo);
		request.setAttribute("borders", list);


		jobvo = jobdao.selectAll(jobvo); 
		request.setAttribute("joblist", jobvo);

	
		return "jsp/board/ownerFormView.jsp";
	}

}