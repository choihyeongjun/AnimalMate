package co.animalMate.main.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.common.Action;
import co.animalMate.main.dao.MessageDAO;
import co.animalMate.vo.MessageVO;

public class GoSendMessageListPageAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		MessageDAO messageDAO = new MessageDAO();
		MessageVO messageVO = new MessageVO();
		List<MessageVO> messageList = new ArrayList<MessageVO>(); 
		messageVO.setSend(id);
		messageList = messageDAO.selectBySend(messageVO);
		request.setAttribute("messageList", messageList);
		
		return "jsp/main/sendMessageList.jsp";
	}

}
