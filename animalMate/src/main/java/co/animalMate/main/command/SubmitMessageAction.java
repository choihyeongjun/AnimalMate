package co.animalMate.main.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.common.Action;
import co.animalMate.main.dao.MessageDAO;
import co.animalMate.vo.MessageVO;

public class SubmitMessageAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//메세지 테이블에 값 넣기
		HttpSession session = request.getSession();
		String send = (String) session.getAttribute("id");
		String title = request.getParameter("title");
		String receive = request.getParameter("receive");
		String comm = request.getParameter("comm");
		
		MessageDAO messageDAO = new MessageDAO();
		MessageVO messageVO = new MessageVO();
		messageVO.setSend(send);
		messageVO.setTitle(title);
		messageVO.setReceive(receive);
		messageVO.setComm(comm);
		messageDAO.insert(messageVO);

		return null;
	}

}
