package co.animalMate.mypage.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import co.animalMate.common.Action;
import co.animalMate.login.dao.MemberDao;
import co.animalMate.vo.BookMarkVO;

public class BookmarkAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MemberDao dao = new MemberDao();
		BookMarkVO vo = new BookMarkVO();
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		String markId = request.getParameter("markId");
		vo.setMarkId(markId);
		
		int n = dao.mark(vo);
		
		try {
			response.getWriter().print(new JSONObject(vo));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
