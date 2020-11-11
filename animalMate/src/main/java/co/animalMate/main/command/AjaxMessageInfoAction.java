package co.animalMate.main.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import co.animalMate.common.Action;
import co.animalMate.main.dao.MessageDAO;
import co.animalMate.vo.MessageVO;

public class AjaxMessageInfoAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MessageDAO messageDAO = new MessageDAO();
		MessageVO messageVO = new MessageVO();
		messageVO.setCode(Integer.parseInt(request.getParameter("code")));
		messageDAO.updateStatus(messageVO);
		messageDAO = new MessageDAO();
		messageVO = messageDAO.selectByCode(messageVO);
		
		try {
			response.getWriter().print(new JSONObject(messageVO));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
