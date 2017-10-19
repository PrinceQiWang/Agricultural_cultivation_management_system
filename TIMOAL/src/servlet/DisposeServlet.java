package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.DateUtil;
import clas.Dispose;
import clas.Medicine;
import clas.Vaccinum;
import Dao.DisposeDao;
import Dao.MedicineDao;
@WebServlet("/Dispose")
public class DisposeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DisposeDao  dao=new DisposeDao();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action =request.getParameter("action");
        if("list".equals(action)){
          list(request,response);
        }else if("add".equals(action)){
           addDispose(request,response);
        }else if("delete".equals(action)){
           delete(request,response);
        }else if("update".equals(action)){
        	update(request,response);
        }else if("detail".equals(action)){
        	//detail(request,response);
        }else
        response.sendRedirect("error.jsp");
	}

	
	 private void addDispose(HttpServletRequest request, HttpServletResponse response) throws IOException {
	       Dispose a=new Dispose();
	       
	       Date date=DateUtil.parseToDate(request.getParameter("date"),DateUtil.yyyyMMdd);
			a.setDate(new java.sql.Date(date.getYear(),date.getMonth(),date.getDate()));
	        a.setBuilding(Integer.parseInt(request.getParameter("building")));
	        a.setFence(Integer.parseInt(request.getParameter("fence")));
	        a.setId_a(Integer.parseInt(request.getParameter("id_a")));
	        a.setId_f(Integer.parseInt(request.getParameter("user")));
	        a.setReason(request.getParameter("reason"));
	        a.setWay_f(request.getParameter("way_f"));
	        a.setRemarks(request.getParameter("remarks"));    
	        dao.addDispose(a);	        
	        int i=Integer.parseInt(request.getParameter("user"));
	    	request.getSession().setAttribute("list",dao.listDispose(i))	;
	        response.sendRedirect("F3-4-harmless.jsp");
	    }

	 	private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
	 		 Dispose a=new Dispose();
	 		 Date date=DateUtil.parseToDate(request.getParameter("date"),DateUtil.yyyyMMdd);
				a.setDate(new java.sql.Date(date.getYear(),date.getMonth(),date.getDate()));
		        a.setBuilding(Integer.parseInt(request.getParameter("building")));
		        a.setFence(Integer.parseInt(request.getParameter("fence")));
		        a.setId_a(Integer.parseInt(request.getParameter("id_a")));
		        a.setId_f(Integer.parseInt(request.getParameter("user")));
		        a.setReason(request.getParameter("reason"));
		        a.setWay_f(request.getParameter("way_f"));
		        a.setRemarks(request.getParameter("remarks"));    
		        dao.updateDispose(a);	        
		        int i=Integer.parseInt(request.getParameter("user"));
		    	request.getSession().setAttribute("list",dao.listDispose(i))	;
		        response.sendRedirect("F3-4-harmless.jsp");
	 	}
	 
	 private void list(HttpServletRequest request, HttpServletResponse response) throws IOException {
			if(request.getParameter("id")!=null)
	    	{
	    		int id=Integer.parseInt(request.getParameter("id"));
	    		Dispose i=dao.loadDispose(id);
	            request.getSession().setAttribute("dispose",i);
	    	}
			int i=Integer.parseInt(request.getParameter("user"));
	    	 request.getSession().setAttribute("disposelist",dao.listDispose(i));
	 	    response.sendRedirect("F3-4-harmless.jsp");
	    }

	  private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		  int i=Integer.parseInt(request.getParameter("id"));
		  dao.deleteDispose(i);
		  request.getSession().setAttribute("disposelist",dao.listDispose(i))	;
	        response.sendRedirect("F3-4-harmless.jsp");
	  }
}
