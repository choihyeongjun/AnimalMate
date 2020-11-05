package co.animalMate.admin.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import co.animalMate.board.dao.MemberDao;
import co.animalMate.common.Action;
import co.animalMate.vo.MemberVO;

public class BlackSearchAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO 회원리스트 보기 구현
		
		MemberDao dao = new MemberDao();
		MemberVO vo=new MemberVO();
		vo.setId(request.getParameter("id"));
		vo.setAuthor("black");
		List<MemberVO> list = new ArrayList<MemberVO>();
		
		list = dao.selectSearch(vo);
		
		try {
			response.getWriter().print(new JSONArray(list));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
