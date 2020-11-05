package co.animalMate.board.command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.BoardDao;
import co.animalMate.board.dao.TradeDao;
import co.animalMate.common.Action;
import co.animalMate.vo.OwnerInsertVO;
import co.animalMate.vo.OwnerListVO;
import co.animalMate.vo.TradeBoardVO;
import co.animalMate.vo.TradeVO;


public class OwnerInertAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		BoardDao dao = new BoardDao();
		OwnerInsertVO vo = new OwnerInsertVO();
		
		vo.setCode(Integer.parseInt(request.getParameter("code")));
		vo.setBuyer(request.getParameter(name));
		
		
		TradeDao tradedao = new TradeDao();
		TradeVO tradevo = new TradeVO();
		
//		if (buyer==null)_{
//			vo.setseller
//		}else {
//			vo.setbuyer
//		}
		
		

		
		
		return "jsp/board/ownerList.jsp";
	}

}
