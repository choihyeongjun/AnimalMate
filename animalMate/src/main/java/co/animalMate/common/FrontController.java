package co.animalMate.common;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.admin.command.BlackListAction;
import co.animalMate.admin.command.BlackSearchAction;
import co.animalMate.admin.command.MemberListAction;
import co.animalMate.admin.command.MemberSearchAction;
import co.animalMate.admin.command.tradeAction;
import co.animalMate.board.command.MainAction;
import co.animalMate.board.command.OwnerFormAction;
import co.animalMate.board.command.OwnerListAction;
import co.animalMate.board.command.SitterFormAction;
import co.animalMate.board.command.SitterListAction;
import co.animalMate.login.command.FindIdAction;
import co.animalMate.login.command.JoinForm;
import co.animalMate.login.command.JoinInsertAction;
import co.animalMate.login.command.LoginAction;
import co.animalMate.login.command.LoginForm;
import co.animalMate.login.command.LogoutAction;
import co.animalMate.main.command.GoLoginPageAction;
import co.animalMate.main.command.GoMessageListPageAction;
import co.animalMate.main.command.GotradeListPageAction;
import co.animalMate.mypage.command.MemberForm;
import co.animalMate.mypage.command.MypetForm;
import co.animalMate.mypage.command.MypetFormAction;
import co.animalMate.mypage.command.MypetList;
import co.animalMate.mypage.command.MypetUpdate;
import co.animalMate.mypage.command.MypetUpdateAction;
import co.animalMate.mypage.command.MytradeList;
import co.animalMate.mypage.command.OwnerFormCheck;
import co.animalMate.mypage.command.Profile;
import co.animalMate.mypage.command.SitterFormCheck;


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
      map.put("/goMessageListPage.do", new GoMessageListPageAction()); //홈에서 쪽지 버튼 눌렀을 때

      
      
      
      
      
      
      
      
      
      
      
      
      //찬호
      map.put("/loginForm.do", new LoginForm()); //로그인 폼 띄우기
      map.put("/login.do", new LoginAction()); //로그인 메뉴를 처리하는 것
      map.put("/joinForm.do", new JoinForm()); //회원가입 폼 띄우기
      map.put("/joinInsert.do", new JoinInsertAction()); //회원입력
      map.put("/logout.do", new LogoutAction()); //로그아웃 액션
      map.put("/ld_find.do", new FindIdAction()); //아이디 찾기 액션
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      //형준
      map.put("/memberSearch.do",new MemberSearchAction());//검색 하는 회원찾기
       map.put("/memberlist.do",new MemberListAction());
       map.put("/blackSearch.do",new BlackSearchAction());
       map.put("/blacklist.do",new BlackListAction());
       map.put("/tradelist.do",new tradeAction());
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      //선애
        map.put("/ownerList.do", new OwnerListAction()); //ownerList 화면 호출
        map.put("/sitterList.do", new SitterListAction()); //sitterList 화면 호출
        map.put("/sitterForm.do", new SitterFormAction()); //sitterForm 화면 호출
        map.put("/ownerForm.do", new OwnerFormAction()); //sitterForm 화면 호출
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      //진구
        map.put("/mypetForm.do", new MypetForm()); //펫 등록 화면 호출
        map.put("/mypetFormAction.do", new MypetFormAction()); //펫 등록 액션
        map.put("/mypetList.do", new MypetList()); //펫 목록 화면 호출
        map.put("/mypetUpdate.do", new MypetUpdate()); //펫 수정, 삭제 화면 호출       
        map.put("/mypetUpdateAction.do", new MypetUpdateAction()); //펫 수정, 삭제 액션
        //map.put("/mypetInsert.do", new MypetInsert()); //삭제 따로 만들어야 하나?
        map.put("/mytradeList.do", new MytradeList()); //내 거래현황,내역 화면 호출
        map.put("/ownerFormCheck.do", new OwnerFormCheck()); // 맡기기 화면 호출
        map.put("/sitterFormCheck.do", new SitterFormCheck()); // 돌보기 화면 호출
        map.put("/profile.do", new Profile()); //프로필 화면 호출
        map.put("/memberForm.do", new MemberForm()); //회원 정보 수정
      
      
      
      
      
      

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
