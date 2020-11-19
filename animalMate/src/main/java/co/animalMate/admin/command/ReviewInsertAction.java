package co.animalMate.admin.command;

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
import co.animalMate.vo.CommentsVO;
import co.animalMate.vo.TradeBoardVO;

public class ReviewInsertAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//리뷰 작성 후 insert액션   
		CommentDao dao=new CommentDao();
		CommentsVO vo=new CommentsVO();
		
		int code=Integer.parseInt(request.getParameter("code"));
		
		vo.setCode(code);
		vo.setComm(request.getParameter("comm"));
		vo.setScore(Integer.parseInt(request.getParameter("score")));
		vo.setTitle(request.getParameter("title"));

		// 현재 컨텍스트에 사진업로드하기
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
		dao.insert(vo);
		
		
		//거래 상태 '거래 완료'로 변경
		MypageDao mydao=new MypageDao();
		TradeBoardVO tbVo=new TradeBoardVO();
		tbVo.setCode(code);
		mydao.updateTradeFinish2(tbVo);
		
		
		return "commentView.do?code="+code;
	}
}
