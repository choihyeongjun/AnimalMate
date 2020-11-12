package co.animalMate.admin.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import co.animalMate.common.Action;
import co.animalMate.vo.QuestionVO;

public class QuestionRewriteAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		   
		
		
		String id=request.getParameter("id");
		String title=request.getParameter("title");
		String comm=request.getParameter("comm");
		
		QuestionVO vo=new QuestionVO();
		QuestionDAO dao=new QuestionDAO();
		vo.setSend(id);
		vo.setTitle(title);
		vo.setComm(comm);
		dao.updateR(vo);
		
		
		return "/questionlist.do";
	}

}
