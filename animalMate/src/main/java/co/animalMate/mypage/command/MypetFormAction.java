package co.animalMate.mypage.command;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import co.animalMate.board.dao.PetDao;
import co.animalMate.common.Action;
import co.animalMate.common.FileRenamePolicy;
import co.animalMate.common.FileUtil;
import co.animalMate.vo.PetVO;

public class MypetFormAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 로그인 인증과정을 처리한다.
		PetDao dao = new PetDao();
		PetVO vo = new PetVO();

		vo.setName(request.getParameter("name"));
		vo.setAge(Integer.parseInt(request.getParameter("age")));
		vo.setGender(request.getParameter("gender"));
		vo.setType(request.getParameter("type"));
		vo.setDetailType(request.getParameter("detailType"));
		vo.setCut(request.getParameter("cut"));
		vo.setComm(request.getParameter("comm"));
		vo.setId("id3");
		// vo.setId((String)session.getAttribute("userId"));//세션 아이디받기
		
		// 현재 컨텍스트에  사진업로드하기
		String appPath = request.getServletContext().getRealPath("/images");
		try {
			for (Part part : request.getParts()) { // 첨부파일을 읽어온다
				String fileName = FileUtil.extractFileName(part); // 파일이 존재하면
				if (!fileName.equals("")) {
					String uploadFile = appPath + File.separator + fileName;
					// 파일명 중복체크
					File renameFile = FileRenamePolicy.rename(new File(uploadFile));
					part.write(renameFile.getAbsolutePath());
					request.setAttribute("pic", renameFile.getName());
					vo.setPic(renameFile.getName());
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}
		
		int n = dao.insert(vo);

		String page; // 돌려보내 줄 페이지 변수

		if (n != 0) {
			page = "jsp/mypage/mypetList.jsp";
		} else {
			page = "jsp/mypage/mypetForm.jsp";
		}

		return page;
	}

}
