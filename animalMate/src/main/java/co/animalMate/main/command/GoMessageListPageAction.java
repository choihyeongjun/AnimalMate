package co.animalMate.main.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.common.Action;
import co.animalMate.common.Paging;
import co.animalMate.main.dao.MessageDAO;
import co.animalMate.vo.MessageVO;

public class GoMessageListPageAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		MessageDAO messageDAO = new MessageDAO();
		MessageDAO cntdao = new MessageDAO();
		MessageVO messageVO = new MessageVO();
		List<MessageVO> messageList = new ArrayList<MessageVO>(); 
		messageVO.setReceive(id);
		
		// 페이지 번호 파라미터
		String strp = request.getParameter("p");
		
		// 분류 파라미터
		
		// 페이지 번호가 없으면 1로 최기화
		int p = 1;
		if (strp != null && !strp.equals("")) {
			p = Integer.parseInt(strp);
		}
		
		// 레코드건수 조회
		Paging paging = new Paging();
		paging.setPageUnit(2); // 한 페이지에 출력할 레코드 수 (기본값은 10)
		paging.setPageSize(2); // 한 페이지에 출력할 페이지 번호 수 (기본값은 10)
		paging.setPage(p); // 현재 페이지 번호
		
		messageVO.setFirst(paging.getFirst());
		messageVO.setLast(paging.getLast());
		paging.setTotalRecord(cntdao.countReceive(messageVO));
		
		// 페이징 객체를 저장
		request.setAttribute("paging", paging);
		
		// 해당 페이지의 리스트만 조회
		messageList = messageDAO.selectByReceive(messageVO);
		
		// 목록 결과와 페이징 객체를 저장해서 뷰페이지로 넘기기
		request.setAttribute("messageList", messageList);
		
		return "jsp/main/messageList.jsp";
	}

}
