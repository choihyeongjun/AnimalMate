package co.animalMate.main.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.common.Action;
import co.animalMate.main.dao.ApplytradeDAO;
import co.animalMate.vo.ApplytradeVO;

public class OwnerFormViewApplyAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int code = Integer.parseInt(request.getParameter("code"));
		
		//어플라이트레이드 테이블에 넣기
		ApplytradeVO applytradeVO = new ApplytradeVO();
		ApplytradeDAO applytradeDAO = new ApplytradeDAO();
		applytradeVO.setCode(code);
		applytradeVO.setId(id);
		applytradeDAO.insert(applytradeVO);
		
		try {
			response.sendRedirect(request.getContextPath() + "/mytradeList.do");
			return null;
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
