package co.animalMate.admin.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import co.animalMate.common.Action;
import co.animalMate.vo.QuestionVO;

public class QuestionlistAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		   
		QuestionDAO dao=new QuestionDAO();
		List<QuestionVO>list=dao.selectAll();
		request.setAttribute("list",list);
		
		return "/jsp/admin/test/questionboard.jsp";
	}

}
