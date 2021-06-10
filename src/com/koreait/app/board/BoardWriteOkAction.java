package com.koreait.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.boardDAO.BoardDAO;
import com.koreait.app.boardDAO.FileBean;
import com.koreait.app.boardDAO.FileDAO;
import com.koreait.app.boardDAO.ListBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardWriteOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("");
		System.out.println("===============BoardWriteOkAction==============");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String folder = request.getServletContext().getRealPath("app/files");
		int size = 1024 * 1024 * 300;
		BoardDAO bdao = new BoardDAO();
		FileDAO fdao = new FileDAO();
		ListBean board = new ListBean();
		boolean bchk = false;
		boolean fchk = false;
		
		
		
		ActionForward forward = new ActionForward();
		MultipartRequest multi = new MultipartRequest(request, folder,size,"UTF-8",new DefaultFileRenamePolicy());
		String filename = multi.getFilesystemName("file");
		String orgname = multi.getOriginalFileName("file");
		board.setListtitle(multi.getParameter("title"));
		board.setListcontents(multi.getParameter("content"));
		board.setBoardnum(num);
		board.setUserid(multi.getParameter("userid"));
		
		bchk = bdao.ListInsert(board);
		int listseq = bdao.returnseq();
		System.out.println("list seq : " + listseq);
		if(filename != null && filename != "") {
			FileBean file = new FileBean();
			file.setBoardnum(num);
			file.setListnum(listseq);
			file.setFilename(filename);
			file.setRealname(orgname);
			System.out.println("파일빈 보드넘 : "+file.getBoardnum());
			System.out.println("파일빈 파일네임 : "+file.getFilename());
			System.out.println("파일빈 리얼네임 : "+file.getRealname());
			fchk = fdao.insertFile(file);
		}
		if(! bchk || ! fchk){
			forward.setRedirect(true);
			forward.setPath(request.getContextPath()+"/board/boardList.bo?num="+num+"&res=false");
			return forward;
		}
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/board/boardList.bo?num="+num);
		return forward;
	}
}
