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
		
		//필터
		String maxp = request.getParameter("maxp");
		String status = request.getParameter("status");
		String location1 = request.getParameter("location1");
		String sDate = request.getParameter("sDate");
		String eDate = request.getParameter("eDate");
		String sTime = request.getParameter("sTime");		
		String eTime = request.getParameter("eTime");
		String minPrice = request.getParameter("minPrice");
		String maxPrice = request.getParameter("maxPrice");
		
		if(maxp != null) {
			request.setAttribute("maxp", Integer.parseInt(maxp));
		}
		request.setAttribute("status", status);
		request.setAttribute("location1", location1);
		if(minPrice != null && minPrice != "") {
			for(TradeBoardVO a : tradeBoardList) {
				if(a.getPrice()<=Integer.parseInt(minPrice)) {
					a.setPrice(0);
				}
			}
		}
		if(maxPrice != null && maxPrice != "") {
			for(TradeBoardVO a : tradeBoardList) {
				if(a.getPrice()<=Integer.parseInt(maxPrice)) {
					a.setPrice(0);
				}
			}
		}
		if(sDate != null && sDate != "") {
			int sDateInt = Integer.parseInt(sDate.substring(0, 4) + sDate.substring(5,7) + sDate.substring(8));
			for(TradeBoardVO a : tradeBoardList) {
				int getSdateInt = Integer.parseInt(a.getSdate().substring(0, 4) + a.getSdate().substring(5, 7) + a.getSdate().substring(8,10));
				if(getSdateInt < sDateInt) {
					a.setSdate("제외");
				}
			}
		}
		if(eDate != null && eDate != "") {
			int eDateInt = Integer.parseInt(eDate.substring(0, 4) + eDate.substring(5,7) + eDate.substring(8));
			for(TradeBoardVO a : tradeBoardList) {
				int getEdateInt = Integer.parseInt(a.getEdate().substring(0, 4) + a.getEdate().substring(5, 7) + a.getEdate().substring(8,10));
				if(getEdateInt > eDateInt) {
					a.setSdate("제외");
				}
			}
		}
		
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


