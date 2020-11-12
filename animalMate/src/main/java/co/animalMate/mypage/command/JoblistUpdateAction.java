package co.animalMate.mypage.command;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import co.animalMate.board.dao.MypageDao;
import co.animalMate.common.Action;
import co.animalMate.common.FileRenamePolicy;
import co.animalMate.common.FileUtil;
import co.animalMate.login.dao.MemberDao;
import co.animalMate.vo.JoblistVO;
import co.animalMate.vo.MemberVO;
import sun.security.util.Length;

public class JoblistUpdateAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 시터가 돌봐주세요 게시판에서 체크리스트에서 업무사진을 올리고 저장하는 처리
		MypageDao myDao = new MypageDao();
		JoblistVO jobVo = new JoblistVO();
		//List<JoblistVO> joblist = new ArrayList<JoblistVO>();
		
		
		String[] comm = request.getParameterValues("comm");
		String[] code = request.getParameterValues("code");
		/*
		 * for (int i = 0; i < comm.length; i++) {
		 * jobVo.setCode(Integer.parseInt(code[i])); jobVo.setComm(comm[i]); }
		 */
		
		// 현재 컨텍스트에 사진업로드하기
		String appPath = request.getServletContext().getRealPath("/images/joblist_pic");
		try {
			for (Part part : request.getParts()) { // 첨부파일을 읽어온다
				part.getName();
				String fileName = FileUtil.extractFileName(part); // 파일이 존재하면
				if (!fileName.equals("")) {
					String uploadFile = appPath + File.separator + fileName;
					// 파일명 중복체크
					File renameFile = FileRenamePolicy.rename(new File(uploadFile));
					part.write(renameFile.getAbsolutePath());
					request.setAttribute("pic", renameFile.getName());
					jobVo.setPic(renameFile.getName());
					
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}
		
		myDao.updateJoblist(jobVo);
		
		
		
		return "mytradeList.do";
	}

}
