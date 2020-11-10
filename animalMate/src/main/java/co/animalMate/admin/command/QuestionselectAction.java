package co.animalMate.admin.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import co.animalMate.common.Action;
import co.animalMate.vo.QuestionVO;

public class QuestionselectAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		   
		QuestionDAO dao=new QuestionDAO();
		QuestionVO vo=new QuestionVO();
		String code=request.getParameter("code");
		vo.setSend(code);
		request.setAttribute("title",vo.getTitle());
		request.setAttribute("comm",vo.getComm());
		request.setAttribute("ttype",vo.getTtype());
		
		
	
		
		return "/jsp/admin/test/questionform.jsp";
	}

}
