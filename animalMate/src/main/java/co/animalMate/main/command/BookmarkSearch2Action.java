package co.animalMate.main.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import co.animalMate.common.Action;
import co.animalMate.main.dao.BookmarkDAO;
import co.animalMate.main.dao.MemberDao;
import co.animalMate.vo.MemberVO;
import co.animalMate.vo.bookMarkVO;

public class BookmarkSearch2Action implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		bookMarkVO bookMarkVO = new bookMarkVO();
		BookmarkDAO bookmarkDAO = new BookmarkDAO();
		List<bookMarkVO> list = new ArrayList<bookMarkVO>();
		bookMarkVO.setId(id);
		list = bookmarkDAO.selectAllById(bookMarkVO);
		
		MemberVO memberVO = new MemberVO();
		MemberDao memberDao = new MemberDao();
		List<MemberVO> memberList = new ArrayList<MemberVO>();
		
		for(bookMarkVO a : list) {
			String b = a.getMarkId();
			memberVO = new MemberVO();
			memberDao = new MemberDao();
			memberVO.setId(b);
			memberList.add(memberDao.selectById(memberVO));
		}
		
		request.setAttribute("memberList", memberList);
		
		return null;
	}

}
