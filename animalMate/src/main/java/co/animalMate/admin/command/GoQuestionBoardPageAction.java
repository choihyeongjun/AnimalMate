package co.animalMate.admin.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.common.Action;
import co.animalMate.common.Paging;
import co.animalMate.main.dao.NoticeDAO;
import co.animalMate.vo.NoticeVO;
import co.animalMate.vo.QuestionVO;

public class GoQuestionBoardPageAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// dao랑 vo수정해야 한다!
		
		QuestionDAO dao=new QuestionDAO();
		QuestionVO vo=new QuestionVO();
		
		List<QuestionVO> list = new ArrayList<QuestionVO>();

		
		// 분류 파라미터
		String status = request.getParameter("status");
		vo.setStatus(status);
		
		// 해당 페이지의 리스트만 조회
		list = dao.selectAll(vo);

		// 목록 결과와 페이징 객체를 저장해서 뷰페이지로 넘기기
		request.setAttribute("list", list);

		return "/jsp/admin/test/questionboard.jsp";
	}

}
