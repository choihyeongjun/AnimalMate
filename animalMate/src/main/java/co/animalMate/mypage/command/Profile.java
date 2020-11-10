package co.animalMate.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.common.Action;

public class Profile implements Action {

   @Override
   public String exec(HttpServletRequest request, HttpServletResponse response) {
      //프로필 화면 호출
      return "jsp/mypage/profile.jsp";
      
   }

}