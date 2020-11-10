package co.animalMate.board.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.dao.BoardDao;
import co.animalMate.common.Action;
import co.animalMate.vo.SitterListVO;

public class SitterListAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//sitter 게시판 리스트 보기 구현
		BoardDao dao = new BoardDao();
		SitterListVO vo = new SitterListVO();
		List<SitterListVO> list = new ArrayList<SitterListVO>();
		
		list =  dao.sitselectAll();
		request.setAttribute("sitborders", list); 
		

				
		return "jsp/board/sitterList.jsp";
		}
	}


