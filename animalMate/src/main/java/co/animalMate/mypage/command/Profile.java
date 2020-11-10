package co.animalMate.mypage.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.MypageDao;
import co.animalMate.common.Action;
import co.animalMate.vo.CommentsVO;
import co.animalMate.vo.MemberVO;

public class Profile implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 프로필 화면 호출
		MypageDao myDao = new MypageDao();
		CommentsVO comVo = new CommentsVO();
		List<CommentsVO> list = new ArrayList<CommentsVO>();
		
		//해당 사람 정보 출력
		MemberVO memVo = new MemberVO();
		String code = request.getParameter("code");		
		//memVo = myDao.(memVo); 덜햇쪄여 뿌우
		request.setAttribute("user", memVo);
		
		//해당 사람의 거래 후기 리스트 출력
		list = myDao.selectComments(comVo);
		request.setAttribute("comm", list);
		
		return "jsp/mypage/profile.jsp";

	}

}