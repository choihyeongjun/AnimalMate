package co.animalMate.mypage.command;

import java.io.File;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import co.animalMate.board.dao.MypageDao;
import co.animalMate.common.Action;
import co.animalMate.common.FileRenamePolicy;
import co.animalMate.common.FileUtil;
import co.animalMate.vo.JoblistVO;

public class JoblistUpdateAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 시터가 돌봐주세요 게시판에서 체크리스트에서 업무사진을 올리고 저장하는 처리		
		JoblistVO jobVo = new JoblistVO();

		String[] comm = request.getParameterValues("comm");
		String[] code = request.getParameterValues("code");
		
		// 현재 컨텍스트에 사진업로드하기
		String appPath = request.getServletContext().getRealPath("/images/joblist_pic");
		try {
			for (Part part : request.getParts()) { // 첨부파일을 읽어온다
				String fileName = FileUtil.extractFileName(part); // 파일이 존재하면
				if (!fileName.equals("")) {
					
					System.out.println(part.getName());
					
					String pici = part.getName().substring(3);
					System.out.println(pici);
					int i = Integer.parseInt(pici);
					
					String uploadFile = appPath + File.separator + fileName;
					// 파일명 중복체크
					File renameFile = FileRenamePolicy.rename(new File(uploadFile));
					part.write(renameFile.getAbsolutePath());
					request.setAttribute("pic", renameFile.getName());
					jobVo.setPic(renameFile.getName());
					
					jobVo.setCode(Integer.parseInt(code[i]));
					jobVo.setComm(comm[i]);
					MypageDao myDao = new MypageDao();
					myDao.updateJoblist(jobVo);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}

		return "mytradeList.do";
	}

}
