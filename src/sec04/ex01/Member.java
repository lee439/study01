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

@WebServlet("/mem.do")
public class Member extends HttpServlet {
    public Member() {
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
	
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	MemberDAO memberDAO = new MemberDAO();
	ArrayList list = memberDAO.listMembers();
	request.setAttribute("memberList", list);
	RequestDispatcher dispatch = request.
	getRequestDispatcher("/test01/listMember.jsp");
	dispatch.forward(request, response);

	}


}
