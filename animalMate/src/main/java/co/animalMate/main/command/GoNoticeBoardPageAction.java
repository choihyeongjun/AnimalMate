package co.animalMate.main.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.common.Action;
import co.animalMate.main.dao.NoticeDAO;
import co.animalMate.vo.NoticeVO;

public class GoNoticeBoardPageAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		NoticeDAO dao = new NoticeDAO();
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		list = dao.selectAll();
		
		request.setAttribute("list", list);
		
		return "/jsp/main/noticeBoard.jsp";
	}

}
