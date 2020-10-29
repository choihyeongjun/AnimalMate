package co.animalMate.common;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.command.LoginAction;
import co.animalMate.board.command.LoginForm;
import co.animalMate.board.command.LogoutAction;
import co.animalMate.board.command.MainAction;
import co.animalMate.board.command.MemberForm;
import co.animalMate.board.command.MemberInsertAction;
import co.animalMate.board.command.MemberListAction;


public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private HashMap<String, Action> map = new HashMap<String, Action>();

    public FrontController() {
        super();
    }

	public void init(ServletConfig config) throws ServletException { //init은 처음 실행할 때 한 번만 실행됨
		// 요청들을 정의함
		//상민		
		map.put("/main.do", new MainAction()); //처음 들어오는 페이지 처리 index.jsp
		map.put("/login.do", new LoginAction()); //로그인 메뉴를 처리하는 것
		map.put("/loginForm.do", new LoginForm()); //로그인 폼 띄우기
		map.put("/memberList.do", new MemberListAction()); //회원전체리스트
		map.put("/memberForm.do", new MemberForm()); //회원가입하면 호출
		map.put("/memberInsert.do", new MemberInsertAction()); //회원입력
		map.put("/logout.do", new LogoutAction());

		
		
		
		
		
		
		
		
		
		
		
		
		
		//찬호
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//형준
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//선애
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//진구
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

	}
	
	//컨트롤러로 넘어오면 서비스 메소드 실행
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 수행할 명령을 정리
		request.setCharacterEncoding("utf-8"); //한글깨짐 방지!
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String path = uri.substring(contextPath.length()); //실제 들어오는 요청페이지를 찾음(uri에서 contextPath를 지움)
		
		Action command = map.get(path); //init메소드 값을 가져온다!
		String viewPage = command.exec(request, response); //명령어가 수행되고 나서 보여줄 페이지 선택
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage); //선택한 페이지로 가기
		dispatcher.forward(request, response);
	}
}
