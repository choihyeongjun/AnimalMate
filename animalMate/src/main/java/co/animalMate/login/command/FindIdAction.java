package co.animalMate.login.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.common.Action;
import co.animalMate.login.dao.MemberDao;
import co.animalMate.vo.MemberVO;

public class FindIdAction implements Action {

   @Override
   public String exec(HttpServletRequest request, HttpServletResponse response) {
      // TODO 아이디찾기 결과 창으로 이동

      MemberDao dao = new MemberDao();
      MemberVO vo = new MemberVO();

      
      vo.setName(request.getParameter("name"));
      vo.setEmail(request.getParameter("email"));
      
      String page;
      vo = dao.findId(vo);
      String id = vo.getId();
      page = "jsp/login/findIdResult.jsp";
      
      if(vo.getName()!=(request.getParameter("name")) &&
      vo.getEmail()!=(request.getParameter("email")) ){

    	  page= "jsp/login/findId.jsp";
    	  return page;
      }else{
    	  page = "jsp/login/findIdResult.jsp?id="+id;
      }
      return page;
   }

}