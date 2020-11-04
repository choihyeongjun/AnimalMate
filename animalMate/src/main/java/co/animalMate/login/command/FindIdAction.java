package co.animalMate.login.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animalMate.board.dao.MemberDao;
import co.animalMate.common.Action;
import co.animalMate.vo.MemberVO;

public class FindIdAction implements Action {

   @Override
   public String exec(HttpServletRequest request, HttpServletResponse response) {
      // TODO 아이디찾기 결과 창으로 이동

      MemberDao dao = new MemberDao();
      MemberVO vo = new MemberVO();
      HttpSession session = request.getSession(false);

      vo.setName(request.getParameter("name"));
      vo.setEmail(request.getParameter("email"));


      vo = dao.findId(vo);
      if(vo.getName().equals(request.getParameter("name")) &&
      vo.getEmail().equals(request.getParameter("email")) ){

         session.setAttribute("id", vo.getId()); 
      
      }else{
      return "jsp/login/findID.jsp";
      }
      
      request.setAttribute("vo", vo); 
      return "jsp/login/findIdResult.jsp";
   }

}