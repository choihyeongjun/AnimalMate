package co.animalMate.main.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.common.Action;
import co.animalMate.main.dao.NoticeDAO;
import co.animalMate.vo.NoticeVO;

public class GoNoticeFormAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		NoticeDAO dao = new NoticeDAO();
		NoticeVO vo = new NoticeVO();
		
		if(request.getParameter("code")!=null && request.getParameter("code")!="") {
			int code = Integer.parseInt(request.getParameter("code"));
			vo.setCode(code);
			vo = dao.selectCode(vo);
			request.setAttribute("title", vo.getTitle());
			request.setAttribute("comm", vo.getComm());
			request.setAttribute("type", vo.getType());
			request.setAttribute("code", vo.getCode());
		}
		
		return "/jsp/main/noticeForm.jsp";
	}

}
