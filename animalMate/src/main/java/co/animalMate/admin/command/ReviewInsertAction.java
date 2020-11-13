package co.animalMate.admin.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.common.Action;
import co.animalMate.vo.CommentsVO;
import co.animalMate.vo.TradeBoardVO;

public class ReviewInsertAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		   
		CommentDao dao=new CommentDao();
		CommentsVO vo=new CommentsVO();
		TradeBoardVO tvo=new TradeBoardVO();
		List<Object>list =new ArrayList<>();
		String scode=request.getParameter("code");
		int code=Integer.parseInt(scode);
		String title=request.getParameter("title");
		String pic=request.getParameter("pic");
		String buyer=request.getParameter("buyer");
		String seller=request.getParameter("seller");
		String sscore=request.getParameter("score");
		String comm=request.getParameter("comm");
		int score=Integer.parseInt(sscore);
		vo.setCode(code);
		vo.setComm(comm);
		vo.setPic(pic);
		vo.setScore(score);
		vo.setTitle(title);
		dao.insert(vo);
	
		
		try {
			response.sendRedirect(request.getContextPath()+"/goMypagePage.do");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}

}
