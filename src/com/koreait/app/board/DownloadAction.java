package com.koreait.app.board;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;

public class DownloadAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String folder = request.getServletContext().getRealPath("app/files");
		String filename = request.getParameter("filename");
		
		File file = new File(folder,filename);
		
		filename = "attachment;fileName="+new String(URLEncoder.encode(filename,"UTF-8")).replace("\\+"," ");
		response.setHeader("Content-Disposition", filename);
		response.setHeader("Content-Length", file.length()+"");
		
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		
		byte[] b = new byte[(int)file.length()];
		bis.read(b, 0, b.length);
		bos.write(b);
		
		bis.close();
		bos.close();
		
		return null;
	}

}
