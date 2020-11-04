package co.animalMate.board.command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.BoardDao;
import co.animalMate.common.Action;
import co.animalMate.vo.TradeBoardVO;
import co.animalMate.vo.TradeVO;
import co.seonae.board.dao.MemberDao;
import co.seonae.board.vo.MemberVO;

public class OwnerInertAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		BoardDao dao = new BoardDao();
		
		TradeBoardVO tradeBoarddvo = new TradeBoardVO();
		TradeVO tradevo = new TradeVO();
		
		
		tradeBoarddvo.setTitle(request.getParameter("title"));
		tradeBoarddvo.setPrice(Integer.parseInt(request.getParameter("price")));
		tradeBoarddvo.setComm(request.getParameter("comm"));
		tradeBoarddvo.setStatus(request.getParameter("status"));
		tradeBoarddvo.setStime(request.getParameter("stime"));
		tradeBoarddvo.setEtime(request.getParameter("etime"));
		tradeBoarddvo.setTtype(request.getParameter("ctype"));
		tradeBoarddvo.setLocation1(request.getParameter("loc1"));
		tradeBoarddvo.setLocation2(request.getParameter("loc2"));
		
		
		
		
		
		
		vo.setId(request.getParameter("id"));
		vo.setName(request.getParameter("name"));
		vo.setPassword(request.getParameter("password"));
		vo.setAddress(request.getParameter("address"));
		vo.setTel(request.getParameter("tel"));
		vo.setEnterdate(Date.valueOf(request.getParameter("enterdate")));
		
		
		
		return "jsp/member/insertSuccess.jsp";
	}

}
