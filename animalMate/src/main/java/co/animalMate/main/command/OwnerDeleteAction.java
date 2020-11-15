package co.animalMate.main.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.common.Action;
import co.animalMate.main.dao.TradeBoardDAO;

public class OwnerDeleteAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		int code = Integer.parseInt(request.getParameter("code"));
		TradeBoardDAO tradeBoardDAO = new TradeBoardDAO();
		tradeBoardDAO.deleteByCode(code);
		
		try {
			response.sendRedirect(request.getContextPath() + "/ownerList.do");
			return null;
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
