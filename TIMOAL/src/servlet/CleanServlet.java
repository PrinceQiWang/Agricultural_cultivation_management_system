package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import clas.Animal;
import clas.Clean;
import Dao.CleanDao;
@WebServlet("/Clean")
public class CleanServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private CleanDao dao=new CleanDao();
    public void doPost(HttpServletRequest request, HttpServletResponse response)
 			throws ServletException, IOException {
     	doGet(request,response);
     }
    public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

        String action =request.getParameter("action");
        if("list".equals(action)){
            listClean(request,response);
        }else if("add".equals(action)){
           
        }else if("delete".equals(action)){
           
        }else if("update".equals(action)){
         
        }else if("detail".equals(action)){
        	detailClean(request,response);
        }else
        response.sendRedirect("error.jsp");
    }
    private void detailClean(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        Clean i=dao.loadClean(id);
        request.getSession().setAttribute("clean",i);
    }
    
    private void listClean(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	if(request.getParameter("id")!=null)
    	{
    		int id=Integer.parseInt(request.getParameter("id"));
            Clean i=dao.loadClean(id);
            request.getSession().setAttribute("clean",i);
    	}
    	 request.getSession().setAttribute("cleanlist",dao.listClean());//将人员信息列表保存到request范围
 	    response.sendRedirect("F4-1-clean.jsp");
    }
}
