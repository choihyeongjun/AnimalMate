package co.animalMate.login.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.common.Action;
import co.animalMate.login.dao.MemberDao;
import co.animalMate.vo.MemberVO;

public class ResetPwAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MemberDao dao = new MemberDao();
		MemberVO vo = new MemberVO();
		
		 vo.setPw(request.getParameter("pw"));
		 vo.setId(request.getParameter("id"));

		 dao.resetPw(vo);
		 response.setContentType("text/html; charset=UTF-8"); 
		 PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			
			e.printStackTrace();
		} 	out.println("<html>");
			out.println("<head>");
			out.println("<script>");
			out.println("alert(비밀번호가 변경 되었습니다.);");
			out.println("window.close();");
			out.println("</script>");
			out.println("</head>");
			out.println("<body>");
			out.println("</body>");
			out.println("</html>");
		 return null;
	}
}
