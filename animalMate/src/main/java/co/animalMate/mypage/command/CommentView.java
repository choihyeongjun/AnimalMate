package co.animalMate.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.MypageDao;
import co.animalMate.board.dao.PetDao;
import co.animalMate.common.Action;
import co.animalMate.vo.CommentsVO;
import co.animalMate.vo.PetVO;

public class CommentView implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 후기 단건 조회
		MypageDao Dao = new MypageDao();
		CommentsVO comVo = new CommentsVO();

		int code = Integer.parseInt(request.getParameter("code"));
		comVo.setCode(code);
		comVo = Dao.selectComment(comVo);
		request.setAttribute("comm", comVo);
		
		return "jsp/mypage/reviewform.jsp";
	}

}
