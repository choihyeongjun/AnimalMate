package co.animalMate.main.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.common.Action;
import co.animalMate.main.dao.QuestionDAO;
import co.animalMate.vo.QuestionVO;

public class AjaxHowMuchQuestionAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String send = (String) session.getAttribute("id");
		
		QuestionVO questionVO = new QuestionVO();
		QuestionDAO questionDAO = new QuestionDAO();
		
		return null;
	}

}
