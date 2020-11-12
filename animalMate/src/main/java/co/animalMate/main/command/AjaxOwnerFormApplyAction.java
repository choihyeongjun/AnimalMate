package co.animalMate.main.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import co.animalMate.common.Action;
import co.animalMate.main.dao.TradeBoardDAO;
import co.animalMate.vo.TradeBoardVO;

public class AjaxOwnerFormApplyAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String seller = (String)session.getAttribute("id");
		
		int code = Integer.parseInt(request.getParameter("code"));
		
		TradeBoardDAO tradeBoardDAO = new TradeBoardDAO();
		TradeBoardVO tradeBoardVO = new TradeBoardVO();
		tradeBoardVO.setSeller(seller);
		tradeBoardVO.setCode(code);
		tradeBoardDAO.insertSeller(tradeBoardVO);
		try {
			response.getWriter().print(new JSONObject(tradeBoardVO));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
