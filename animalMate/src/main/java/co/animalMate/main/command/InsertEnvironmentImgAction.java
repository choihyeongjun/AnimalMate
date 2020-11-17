package co.animalMate.main.command;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import co.animalMate.common.Action;
import co.animalMate.common.FileRenamePolicy;
import co.animalMate.common.FileUtil;
import co.animalMate.main.dao.PictureDAO;
import co.animalMate.vo.PictureVO;

public class InsertEnvironmentImgAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		PictureVO pictureVO = new PictureVO();
		PictureDAO pictureDAO = new PictureDAO();
		pictureVO.setId(id);
				
		
		// 현재 컨텍스트에 사진업로드하기
		String appPath = request.getServletContext().getRealPath("/images/picture");
		try {
			for (Part part : request.getParts()) { // 첨부파일을 읽어온다
				String fileName = FileUtil.extractFileName(part); // 파일이 존재하면
				if (!fileName.equals("")) {
					String uploadFile = appPath + File.separator + fileName;
					// 파일명 중복체크
					File renameFile = FileRenamePolicy.rename(new File(uploadFile));
					part.write(renameFile.getAbsolutePath());
					request.setAttribute("pic", renameFile.getName());
					pictureVO.setPic(renameFile.getName());
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}
		pictureDAO.insert(pictureVO);
		
		try {
			response.sendRedirect(request.getContextPath() + "/environmentImg.do");
			return null;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	
	}
}
	
