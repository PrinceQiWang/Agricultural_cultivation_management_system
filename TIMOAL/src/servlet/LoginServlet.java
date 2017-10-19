package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.FarmerDao;
import Dao.LoginDao;
import Dao.ManagerDao;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private LoginDao dao=new LoginDao();
    public void doGet(HttpServletRequest request, HttpServletResponse response)
 			throws ServletException, IOException {
     	doPost(request,response);
     }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

    	String ID=request.getParameter("username");
    	String pwd=request.getParameter("password");
    	MD5 md = new MD5();
    	pwd = md.Encrypt(pwd);
    	boolean f=request.getParameter("usertype").equals("0")?true:false;
        int id=dao.login(ID,pwd,f);
         if(id!=-1){ 
         	if(f==true){
         		request.getSession().setAttribute("manager", new ManagerDao().loadManager(id));
         		response.sendRedirect("M0-0-manager.jsp");
         	}
         	else if(f==false)
         	{
         		request.getSession().setAttribute("farmer", new FarmerDao().loadFarmer(id));
         		response.sendRedirect("F0-0-farmer.jsp");
         	}
         	else
         	{
         		request.setAttribute("error","密码错误！");
         		response.sendRedirect("U1-1-welcome.jsp");
         	}
         }else{
         	request.setAttribute("error","两次输入不同！");
            response.sendRedirect("U1-1-welcome.jsp");
        }
    }
}
