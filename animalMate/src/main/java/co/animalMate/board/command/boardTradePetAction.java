package co.animalMate.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.common.Action;

public class boardTradePetAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
	
		return "jsp/board/boardTradePet.jsp";
	}

}
