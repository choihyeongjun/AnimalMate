package co.animalMate.main.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.common.Action;
import co.animalMate.main.dao.NoticeDAO;
import co.animalMate.vo.NoticeVO;

public class SubmitNoticeAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String type = request.getParameter("type");
		String comm = request.getParameter("comm");
		
		NoticeVO vo = new NoticeVO();
		vo.setTitle(title);
		vo.setType(type);
		vo.setComm(comm);
		
		NoticeDAO dao = new NoticeDAO();
		if(request.getParameter("code") != null) {
			int code = Integer.parseInt(request.getParameter("code")); 
			vo.setCode(code);
			dao.update(vo);
		} else {
			dao.insert(vo);
		}
		
		try {
			response.sendRedirect(request.getContextPath() + "/goNoticeBoardPage.do");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
