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
		String scode=request.getParameter("code");
		int code=Integer.parseInt(scode);
		vo.setCode(code);
		vo=dao.selectcode(vo);
		request.setAttribute("requestid",vo.getSend());
		request.setAttribute("title",vo.getTitle());
		request.setAttribute("comm",vo.getComm());
		request.setAttribute("ttype",vo.getTtype());
		request.setAttribute("answer",vo.getAnswer());
		
		
		return "/jsp/admin/test/questionform.jsp";
	}

}
