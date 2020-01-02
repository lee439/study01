package sec04.ex01;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/*")
public class MemberController extends HttpServlet {
    public MemberController() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request,response);	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request,response);	

	}
	
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	
		String nextpage=null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getPathInfo();
		System.out.println("action:"+action);
		MemberDAO memberDAO = new MemberDAO();
		
		if(action ==null || action.equals("/listMembers.do")) {
			ArrayList list = memberDAO.listMembers();
			request.setAttribute("memberList", list);

			nextpage = "/test01/listMember.jsp";
			
		}else if(action.equals("/addMember.do")) {
			String id = request.getParameter("id"); 
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
	
			memberDAO.addMember(id, pwd, name, email);
		
			System.out.println("성공");
			
			nextpage = "/member/listMembers.do";
		}else if(action.equals("/memberForm.do")) {
			nextpage="/test01/memberForm.jsp";
		}else if(action.equals("/modMemberForm.do")) {
			String id = request.getParameter("id");
			MemberVO memInfo = memberDAO.findMember(id);
			request.setAttribute("memInfo", memInfo);
			nextpage = "test01/modMemberForm.jsp";
		}else if(action.equals("/modMember.do")) {
			String id = request.getParameter("id"); 
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			memberDAO.modMember(id,pwd,name,email);
			request.setAttribute("msg", "modified");
			nextpage="member/listMembers.do";
		}
		else if(action.equals("/delMember.do")) {
			String id = request.getParameter("id");
			memberDAO.delMember(id);
			request.setAttribute("msg", "deleted");
			nextpage="member/listMembers.do";
			
		}else {
			nextpage = "/test01/index.jsp";
		}
		 RequestDispatcher dispatch = request.getRequestDispatcher(nextpage);
		 dispatch.forward(request, response);
		  
		 }


}
