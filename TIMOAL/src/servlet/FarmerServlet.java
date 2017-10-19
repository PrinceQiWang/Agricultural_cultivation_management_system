package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import clas.Farmer;
import clas.Forage;
import clas.Manager;
import Dao.FarmerDao;
@WebServlet("/Farmer")
public class FarmerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	FarmerDao dao=new FarmerDao();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action =request.getParameter("action");
		if("list".equals(action)){
			listFarmer(request,response);
		}else if("add".equals(action)){
			addFarmer(request,response);
		}else if("login".equals(action)){
			//loginFarmer(request,response);
		}else if("update".equals(action)){
			update(request,response);
		}else if("delete".equals(action)){
			delete(request,response);	
		}else if("select".equals(action)){
			
		}else if("password".equals(action)){
			password(request,response);
		}else if("change".equals(action)){
		
		}else
		response.sendRedirect("error.jsp");
	}
	
	private void listFarmer(HttpServletRequest request, HttpServletResponse response) throws IOException {
		if(request.getParameter("id")!=null)
    	{
    		int id=Integer.parseInt(request.getParameter("id"));
    		Farmer i=dao.loadFarmer(id);
            request.getSession().setAttribute("farmer",i);
    	}
		int i=Integer.parseInt(request.getParameter("user"));
		request.getSession().setAttribute("farmerlist",dao.listFarmer());
 	    response.sendRedirect("M2-1-farmer.jsp");
    }
	
	 private void addFarmer(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 	Farmer a=new Farmer();
	       
	        a.setId(request.getParameter("id"));
	        a.setPassword(request.getParameter("password"));
	        a.setName(request.getParameter("name"));
	        a.setAddress(request.getParameter("address"));
	        a.setTelephone(request.getParameter("telephone"));
	        a.setEmail(request.getParameter("email"));
	        a.setGroup(Integer.parseInt(request.getParameter("groupe")));
	        a.setReport(Integer.parseInt(request.getParameter("report")));
	        dao.addFarmer(a);
	        
	        //int i=Integer.parseInt(request.getParameter("user"));
	    	request.getSession().setAttribute("list",dao.listFarmer())	;
	        response.sendRedirect("Farmer?action=list");
	    }
	
	private void update(HttpServletRequest request, HttpServletResponse response) throws IOException{
		Farmer f=new Farmer();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		f.setId_f(Integer.parseInt((String) request.getParameter("user")));
		f.setId(request.getParameter("id"));
		f.setName(new String (request.getParameter("name").getBytes("ISO-8859-1"),"utf-8"));
		f.setTelephone(request.getParameter("telephone"));
		f.setEmail(request.getParameter("email"));
		f.setAddress(new String (request.getParameter("address").getBytes("ISO-8859-1"),"utf-8"));
		f.setGroup(Integer.parseInt(request.getParameter("group")));
		
		dao.updateFarmer(f);
		request.getSession().setAttribute("farmer", dao.loadFarmer(f.getId_f()));
		 response.sendRedirect("F1-1-information.jsp");
	}
	
	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
	 	int id_f=Integer.parseInt((String) request.getParameter("user"));
	 	dao.deleteFarmer(id_f);
	 	response.sendRedirect("Farmer?action=list");
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
				Farmer u=dao.loadFarmer(id);
				MD5 md = new MD5();
				vieux = md.Encrypt(vieux);
				if(u.getPassword().equals(vieux))
				{
					dao.password(u, nouvel);
					out.print("<javascript>密码修改成功！</javascript>");
				}
				else
					out.print("<javascript>原始密码错误！</javascript>");
			}
			
		}
		else
		out.print("<javascript>两次密码不同！</javascript>");
		//
		out.println(" <a href='F1-2-password.jsp'>返回</a></td>");
		out.println("</body></html>");
	}
}
