package co.animalMate.admin.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import co.animalMate.board.dao.MemberDao;
import co.animalMate.common.Action;
import co.animalMate.vo.MemberVO;

public class BlackUpdateAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO 회원리스트 보기 구현
		MemberDao dao = new MemberDao();
		
		//List<MemberVO> list = new ArrayList<MemberVO>();
		String id=request.getParameter("id");
		String author=request.getParameter("author");
		MemberVO vo=new MemberVO(id);
		vo.setAuthor(author);
		dao.updateBlack(vo);
		
		System.out.println(id);
		System.out.println(author);
	
		try {
			response.getWriter().print(new JSONObject(vo));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}

}
