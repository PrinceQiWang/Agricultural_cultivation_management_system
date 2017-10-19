package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.FarmerDao;
import clas.Farmer;
@WebServlet("/Sign")
public class SignServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	FarmerDao dao=new FarmerDao();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
			Farmer f=new Farmer();
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			//f.setId_f(Integer.parseInt((String) request.getParameter("user")));
			f.setId(request.getParameter("id"));
			//f.setName(new String (request.getParameter("name").getBytes("ISO-8859-1"),"utf-8"));
			f.setName(request.getParameter("name"));
			f.setTelephone(request.getParameter("telephone"));
			f.setEmail(request.getParameter("email"));
			//f.setAddress(new String (request.getParameter("address").getBytes("ISO-8859-1"),"utf-8"));
			f.setAddress(request.getParameter("address"));
			f.setGroup(Integer.parseInt(request.getParameter("group")));
			
			dao.addFarmer(f);
			 response.sendRedirect("U1-1-welcome.jsp");
		
	}

}
