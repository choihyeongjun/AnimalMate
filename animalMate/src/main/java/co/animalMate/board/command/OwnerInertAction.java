package co.animalMate.board.command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.BoardDao;
import co.animalMate.board.dao.TradeDao;
import co.animalMate.common.Action;
import co.animalMate.vo.TradeBoardVO;
import co.animalMate.vo.TradeVO;


public class OwnerInertAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		BoardDao boarddao = new BoardDao();
		TradeBoardVO tradeBoardvo = new TradeBoardVO();
		
		
		
		tradeBoardvo.setTitle(request.getParameter("title"));//제목
		tradeBoardvo.setPrice(Integer.parseInt(request.getParameter("price")));
		tradeBoardvo.setComm(request.getParameter("comm"));
		tradeBoardvo.setStatus(request.getParameter("status"));
		tradeBoardvo.setStime(request.getParameter("stime"));
		tradeBoardvo.setEtime(request.getParameter("etime"));
		tradeBoardvo.setTtype(request.getParameter("ctype"));
		tradeBoardvo.setLocation1(request.getParameter("loc1"));
		tradeBoardvo.setLocation2(request.getParameter("loc2"));
		
		
		TradeDao tradedao = new TradeDao();
		TradeVO tradevo = new TradeVO();
		
//		if (buyer==null)_{
//			vo.setseller
//		}else {
//			vo.setbuyer
//		}
		
		
		tradevo.setId(request.getParameter("id"));
		tradevo.setName(request.getParameter("name"));
		tradevo.setPassword(request.getParameter("password"));
		tradevo.setAddress(request.getParameter("address"));
		tradevo.setTel(request.getParameter("tel"));
		tradevo.setEnterdate(Date.valueOf(request.getParameter("enterdate")));
		
		
		
		return "jsp/member/insertSuccess.jsp";
	}

}
