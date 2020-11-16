package co.animalMate.admin.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import co.animalMate.board.dao.MemberDao;
import co.animalMate.common.Action;
import co.animalMate.main.dao.SitterDAO;
import co.animalMate.vo.MemberVO;
import co.animalMate.vo.SitterVO;

public class SitterInsertlistAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO 회원리스트 보기 구현
		
		MemberDao dao = new MemberDao();
		List<MemberVO> list = new ArrayList<MemberVO>();
		MemberVO vo=new MemberVO();
		SitterDAO sdao=new SitterDAO();
		SitterVO svo=new SitterVO();
		
		String id=request.getParameter("id");
		String pet=request.getParameter("pet");
		int maxP=Integer.parseInt(pet);
		String comm=request.getParameter("comm");
		svo.setId(id);
		svo.setMaxP(maxP);
		svo.setComm(comm);
		sdao.insert(svo);
		vo.setId(id);
		vo.setAuthor("sitterwait");
		dao.update(vo);
		try {
			response.sendRedirect(request.getContextPath()+"/main.do");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
