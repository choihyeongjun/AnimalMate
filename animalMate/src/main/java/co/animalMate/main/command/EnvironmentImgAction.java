package co.animalMate.main.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.common.Action;
import co.animalMate.main.dao.PictureDAO;
import co.animalMate.vo.PictureVO;

public class EnvironmentImgAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
	    String id = (String) session.getAttribute("id");
	    
	    //돌봄환경 사진 구하기!
	    PictureDAO pictureDAO = new PictureDAO();  
	    PictureVO pictureVO = new PictureVO();  
	    pictureVO.setId(id);
	    List<PictureVO> pictureList = new ArrayList<PictureVO>();
	    pictureList = pictureDAO.selectById(pictureVO);
	    request.setAttribute("pictureList", pictureList);
	    
		return "jsp/main/environmentImg.jsp";
	}

}
