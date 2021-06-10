package com.koreait.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.userDAO.EnterpriseUserBean;
import com.koreait.app.userDAO.EnterpriseUserDAO;

public class EnterpriseUserJoinOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		
		EnterpriseUserDAO eudao = new EnterpriseUserDAO();
		EnterpriseUserBean euser = new EnterpriseUserBean();
		
		euser.setEpuserid(request.getParameter("epuserid"));
		euser.setEpuserpw(request.getParameter("epuserpw"));
		euser.setEpusername(request.getParameter("epusername"));
		euser.setEpuserphone(request.getParameter("epuserphone"));
		euser.setEpusernumber(request.getParameter("epusernumber"));
		
		if (eudao.join(euser)) {
			forward.setRedirect(true);
			forward.setPath(request.getContextPath()+"/");
			
		} else {
			System.out.println("DB�� ȸ������ ������ �Է� ����");
		}
		return forward;
	}

}
