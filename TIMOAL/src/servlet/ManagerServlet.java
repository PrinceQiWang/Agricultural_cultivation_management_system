package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ManagerDao;
import clas.Manager;

public class ManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ManagerDao dao=new ManagerDao();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action =request.getParameter("action");
		if("list".equals(action)){
			
		}else if("add".equals(action)){
			//addManager(request,response);
		}else if("update".equals(action)){
			//updateManager(request,response);
		}else if("delete".equals(action)){
			//deleteManager(request,response);
		}else if("select".equals(action)){
			//selectManager(request,response);
		}else if("password".equals(action)){
			password(request,response);
		}else if("change".equals(action)){
		
		}else
		response.sendRedirect("error.jsp");
	}
	
	private void password(HttpServletRequest request, HttpServletResponse response) throws IOException{
		int id=Integer.parseInt(request.getParameter("user"));
		String vieux=request.getParameter("old");
		String nouvel=request.getParameter("new");
		String nouvel1=request.getParameter("new1");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		out.println("<html><body>");
		if(nouvel1.equals(nouvel)){
			if(nouvel.equals(vieux)){
				out.print("<javascript>新密码与原密码相同!</javascript>");
			}
			else{
				Manager u=dao.loadManager(id);
				MD5 md = new MD5();
				vieux = md.Encrypt(vieux);
				if(u.getPassword().equals(vieux))
				{
					dao.password(u, nouvel);
					out.print("<javascript>密码修改成功！</javascript>");
				}
				else
					out.print("<javascript>原始密码错误</javascript>");
			}
			
		}
		else
		out.print("<javascript>两次密码不同！</javascript>");
		//
		out.println(" <a href='M1-2-password.jsp'>返回</a></td>");
		out.println("</body></html>");
	}

}
