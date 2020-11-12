package co.animalMate.admin.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import co.animalMate.common.Action;
import co.animalMate.vo.QuestionVO;

public class QuestionAnswerAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		   
		
		
		String id=request.getParameter("id");
		String title=request.getParameter("title");
		String ttype=request.getParameter("ttype");
		String comm=request.getParameter("comm");
		String answer=request.getParameter("answer");
		
		QuestionVO vo=new QuestionVO();
		QuestionDAO dao=new QuestionDAO();
		vo.setSend(id);
		vo.setTitle(title);
		vo.setTtype(ttype);
		vo.setComm(comm);
		vo.setAnswer(answer);
		dao.update(vo);
		try {
			response.sendRedirect(request.getContextPath()+"/questionlist.do");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}

}
