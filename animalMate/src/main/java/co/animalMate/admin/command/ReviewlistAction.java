package co.animalMate.admin.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import co.animalMate.common.Action;
import co.animalMate.main.dao.TradeBoardDAO;
import co.animalMate.vo.QuestionVO;

public class ReviewlistAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		   
		CommentDao dao=new CommentDao();
		List<Object>list=new ArrayList<>();
		
		list.add(dao.select());
		request.setAttribute("comms",list);
		
		return "/jsp/mypage/profile.jsp";
	}

}
