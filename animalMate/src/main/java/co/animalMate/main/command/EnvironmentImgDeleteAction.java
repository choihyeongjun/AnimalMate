package co.animalMate.main.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.common.Action;
import co.animalMate.main.dao.PictureDAO;
import co.animalMate.vo.PictureVO;

public class EnvironmentImgDeleteAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		String[] pic = request.getParameterValues("chkPic");
		for(String a : pic) {
			PictureVO pictureVO = new PictureVO();
			PictureDAO pictureDAO = new PictureDAO();
			pictureDAO.deleteByPic(a);
		}
		
		try {
			response.sendRedirect(request.getContextPath() + "/environmentImg.do");
			return null;
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
