package co.animalMate.mypage.command;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.admin.command.CommentDao;
import co.animalMate.board.dao.MypageDao;
import co.animalMate.common.Action;
import co.animalMate.main.dao.CommentsDAO;
import co.animalMate.main.dao.TradeBoardDAO;
import co.animalMate.vo.CommentsVO;
import co.animalMate.vo.MemberVO;
import co.animalMate.vo.TradeBoardVO;
import co.animalMate.vo.TradeCommentsVO;

public class Profile implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 프로필 화면 호출

		// 해당 사람 정보 출력
		MypageDao myDao = new MypageDao();
		MemberVO memVo = new MemberVO();
		String id = request.getParameter("id"); // 아이디값 받아와서 검색
		memVo.setId(id);
		memVo = myDao.userInfo(memVo);
		request.setAttribute("user", memVo);

		// 세션 아이디 정보
		HttpSession session = request.getSession(false);
		String sid = (String) session.getAttribute("id");
		request.setAttribute("sid", sid);

		// 나이 구하기!
		int birthYear = Integer.parseInt(String.valueOf(memVo.getZoomin1()).substring(0, 2));
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR) - 2000;
		int age;
		if (birthYear > year) {
			age = year + (100 - birthYear) + 1; // 1더하면 한국나이
		} else {
			age = year;
		}
		request.setAttribute("age", age);

		// 성별 구하기!
		String zoo2 = String.valueOf(memVo.getZoomin2()).substring(0, 1);
		String gender;
		if (zoo2.equals("1") || zoo2.equals("3")) {
			gender = "남성";
		} else {
			gender = "여성";
		}
		request.setAttribute("gender", gender);

		// 평점이랑 거래횟수 구하기!
		TradeBoardDAO tradeBoardDAO = new TradeBoardDAO();
		TradeBoardVO tradeBoardVO = new TradeBoardVO();
		List<TradeBoardVO> tradeBoardList = new ArrayList<TradeBoardVO>();
		tradeBoardVO.setSeller(id);
		tradeBoardList = tradeBoardDAO.selectById(tradeBoardVO);
		int career = tradeBoardList.size(); // 거래완료 횟수
		request.setAttribute("career", career);

		CommentsVO commentsVO = new CommentsVO();
		CommentsDAO commentsDAO = new CommentsDAO();
		int score = 0;
		for (TradeBoardVO tempt : tradeBoardList) {
			commentsVO.setCode(tempt.getCode());
			commentsVO = commentsDAO.selectByCode(commentsVO);
			score += commentsVO.getScore();
		}
		if (career != 0) {
			int avgScore = Math.round(score / career);
			String stars = "";
			for (int i = 0; i < avgScore; i++) {
				stars += "★";
			}
			for (int i = 0; i < (5 - avgScore); i++) {
				stars += "☆";
			}
			request.setAttribute("score", stars);
		} else {
			request.setAttribute("score", "거래내역 없음");
		}

		// 해당 사람의 거래 후기 리스트 출력
		myDao = new MypageDao();
		TradeCommentsVO tcVo = new TradeCommentsVO();
		List<TradeCommentsVO> listcomm = new ArrayList<TradeCommentsVO>();
		tcVo.setSeller(id);
		listcomm = myDao.selectComments(tcVo);
		request.setAttribute("comms", listcomm);

		return "jsp/mypage/profile.jsp";

	}

}