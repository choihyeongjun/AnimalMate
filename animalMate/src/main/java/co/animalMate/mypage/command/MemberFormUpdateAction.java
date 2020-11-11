package co.animalMate.mypage.command;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import co.animalMate.common.Action;
import co.animalMate.common.FileRenamePolicy;
import co.animalMate.common.FileUtil;
import co.animalMate.login.dao.MemberDao;
import co.animalMate.vo.MemberVO;

public class MemberFormUpdateAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		MemberDao dao = new MemberDao();
		MemberVO vo = new MemberVO();
		
		vo.setNName(request.getParameter("nname"));
		vo.setTel(request.getParameter("tel"));
		vo.setLocation1(request.getParameter("location1"));
		vo.setLocation2(request.getParameter("location2"));
		vo.setEmail(request.getParameter("email"));
		vo.setPic(request.getParameter("pic"));
		vo.setId(request.getParameter("id"));
		
		// 현재 컨텍스트에 사진업로드하기
				String appPath = request.getServletContext().getRealPath("/images/members_pic");
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
		
		dao.updatelist(vo);
					
		return "memberForm.do";
	}

}
