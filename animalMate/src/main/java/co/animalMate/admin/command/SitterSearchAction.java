package co.animalMate.admin.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import co.animalMate.board.dao.MemberDao;
import co.animalMate.common.Action;
import co.animalMate.vo.MemberVO;

public class SitterSearchAction implements Action {

   @Override
   public String exec(HttpServletRequest request, HttpServletResponse response) {
      // TODO ?쉶?썝由ъ뒪?듃 蹂닿린 援ы쁽
      
      MemberDao dao = new MemberDao();
      MemberVO vo=new MemberVO();
      String id =request.getParameter("id");
      List<Object> list = new ArrayList<Object>();
      vo.setId(id);
      list=dao.sitterSearch(vo);
      try {
         response.getWriter().print(new JSONArray(list));
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      return null;
   }

}