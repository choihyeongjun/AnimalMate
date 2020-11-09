package co.animalMate.main.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import co.animalMate.board.dao.PetDao;
import co.animalMate.common.Action;
import co.animalMate.vo.PetVO;

public class AjaxPetInfoAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 펫리스트 보기
		PetDao dao = new PetDao();
		PetVO vo = new PetVO();
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id"); 
		String name = request.getParameter("name");
		
		vo.setId(id);
		vo.setName(name);
		vo = dao.selectByIdName(vo);

		try {
			response.getWriter().print(new JSONObject(vo));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
