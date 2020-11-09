package co.animalMate.main.command;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.common.Action;
import co.animalMate.main.dao.NoticeDAO;
import co.animalMate.vo.NoticeVO;

public class GoNoticeFormAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		NoticeDAO dao = new NoticeDAO();
		NoticeVO vo = new NoticeVO();
		String sCode = request.getParameter("code");
		
		if(sCode!=null && sCode!="") { //기존 글을 조회하는 경우
			
			int code = Integer.parseInt(sCode);
			
			vo.setCode(code);
			vo = dao.selectCode(vo);
			request.setAttribute("title", vo.getTitle());
			request.setAttribute("comm", vo.getComm());
			request.setAttribute("type", vo.getType());
			request.setAttribute("code", vo.getCode());
			
			//조회수 작업
			boolean existCookie = false;
			Cookie[] cookieList = request.getCookies();
			for(Cookie co : cookieList) {
				if(co.getValue().equals(sCode)) {
					existCookie = true;
				}
			}
			
				//쿠키생성
				if(!existCookie) {
					//쿠키가 없는 경우
					Cookie cookie = new Cookie("cookieCode", request.getParameter("code"));
					cookie .setMaxAge(60*60*24);
					response.addCookie(cookie);
					dao.updateCount(vo);
				}
				
			//조회수 작업 끝
			
			
		}
		
		return "/jsp/main/noticeForm.jsp";
	}

}
