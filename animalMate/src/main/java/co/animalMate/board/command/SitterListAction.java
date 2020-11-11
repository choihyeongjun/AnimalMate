package co.animalMate.board.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.common.Action;
import co.animalMate.main.dao.MemberDao;
import co.animalMate.main.dao.SitterDAO;
import co.animalMate.main.dao.TradeBoardDAO;
import co.animalMate.vo.MemberVO;
import co.animalMate.vo.SitterVO;
import co.animalMate.vo.TradeBoardVO;

public class SitterListAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//데이터 설렉해오기
		MemberDao memberDao = new MemberDao();
		List<MemberVO> memberList = new ArrayList<MemberVO>();
		memberList = memberDao.selectSitterList();
		
		SitterDAO sitterDAO = new SitterDAO();
		List<SitterVO> sitterList = new ArrayList<SitterVO>();
		sitterList = sitterDAO.selectSitterList();
		
		TradeBoardDAO tradeBoardDAO = new TradeBoardDAO();
		List<TradeBoardVO> tradeBoardList = new ArrayList<TradeBoardVO>();
		tradeBoardList = tradeBoardDAO.selectSitterList();
		
		//리스트에 담아서 보내기
		List<Object> VOlist = new ArrayList<Object>();
		List<Object> Superlist = new ArrayList<Object>();
		for(int i=0; i<memberList.size(); i++) {
			VOlist = new ArrayList<Object>();
			VOlist.add(memberList.get(i));
			VOlist.add(sitterList.get(i));
			VOlist.add(tradeBoardList.get(i));
			Superlist.add(VOlist);
		}
		request.setAttribute("Superlist", Superlist);
		 
		return "jsp/board/sitterList.jsp";
		}
	}


