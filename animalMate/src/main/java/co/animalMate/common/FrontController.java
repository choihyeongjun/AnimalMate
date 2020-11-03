package co.animalMate.common;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.board.command.FindIdAction;
import co.animalMate.board.command.LoginAction;
import co.animalMate.board.command.LoginForm;
import co.animalMate.board.command.LogoutAction;
import co.animalMate.board.command.MainAction;
import co.animalMate.board.command.JoinForm;
import co.animalMate.board.command.JoinInsertAction;
import co.animalMate.board.command.MemberListAction;
import co.animalMate.board.command.MypetInsertAction;
import co.animalMate.main.command.GoLoginPageAction;
import co.animalMate.main.command.GotradeListPageAction;


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
		map.put("/goLoginPage.do", new GoLoginPageAction()); //홈에서 로그인 버튼 눌렀을 때
		map.put("/gotradeListPage.do", new GotradeListPageAction()); //홈에서 요청알림 버튼 눌렀을 때

		
		
		
		
		
		
		
		
		
		
		
		
		//찬호
		
		map.put("/loginForm.do", new LoginForm()); //로그인 폼 띄우기
		map.put("/login.do", new LoginAction()); //로그인 메뉴를 처리하는 것
		map.put("/joinForm.do", new JoinForm()); //회원가입 폼 띄우기
		map.put("/joinInsert.do", new JoinInsertAction()); //회원입력
		map.put("/logout.do", new LogoutAction()); //로그아웃 액션
		map.put("/ld_find.do", new FindIdAction()); //아이디 찾기 액션
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//형준
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//선애
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//진구
		map.put("/mypetInsert.do", new MypetInsertAction());
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

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
