package co.animalMate.main.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import co.animalMate.common.Action;
import co.animalMate.main.dao.MessageDAO;
import co.animalMate.vo.MessageVO;

public class AjaxHowMuchMessageAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String receive = (String) session.getAttribute("id");
		
		MessageDAO messageDAO = new MessageDAO();
		MessageVO messageVO = new MessageVO();
		messageVO.setReceive(receive);
		int count = messageDAO.countByReceive(messageVO);
		System.out.println(count);
		try {
			response.getWriter().print(count);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
