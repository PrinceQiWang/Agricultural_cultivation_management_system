package servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.DateUtil;
import Dao.ForageDao;
import clas.Forage;
@WebServlet("/Forage")
public class ForageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ForageDao dao=new ForageDao();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 String action =request.getParameter("action");
	        if("list".equals(action)){
	          listForage(request,response);
	        }else if("add".equals(action)){
	           addForage(request,response);
	        }else if("delete".equals(action)){
	           delete(request,response);
	        }else if("update".equals(action)){
	        	update(request,response);
	        }else if("detail".equals(action)){
	        	//detail(request,response);
	        }else
	        response.sendRedirect("error.jsp");

	}
	  private void addForage(HttpServletRequest request, HttpServletResponse response) throws IOException {
	       Forage a=new Forage();
	       
	        a.setNumber_a(Integer.parseInt(request.getParameter("number_a")));
	        a.setType_f(Integer.parseInt(request.getParameter("type_f")));
	        if(request.getParameter("building")!=null)
	        	a.setBuilding(Integer.parseInt(request.getParameter("building")));
	        else
	        	 a.setBuilding(-1);
	        if(request.getParameter("fence")!=null)
	        	a.setFence(Integer.parseInt(request.getParameter("fence")));
	        else
	        	a.setFence(-1);
	        a.setId_f(Integer.parseInt(request.getParameter("user")));
	        a.setAmount(Double.parseDouble(request.getParameter("amount")));
	        a.setFeeder(request.getParameter("feeder"));
	       
	        Date d=new java.util.Date();
	        d.setYear(Integer.parseInt(request.getParameter("year"))-1900);
	        d.setMonth(Integer.parseInt(request.getParameter("month")));
	        d.setDate(Integer.parseInt(request.getParameter("day")));
	        a.setRemarks(request.getParameter("remarks"));
	        a.setDate_a(d);
	        dao.addForage(a);
	        if(request.getParameter("id")!=null)
	    	{
	    		int id=Integer.parseInt(request.getParameter("id"));
	            Forage i=dao.loadForage(id);
	            request.getSession().setAttribute("forage",i);
	    	}
	        int i=Integer.parseInt(request.getParameter("user"));
	    	request.getSession().setAttribute("list",dao.listForage(i))	;
	        response.sendRedirect("F3-1-food.jsp");
	    }
	  
	  private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
	       Forage a=new Forage();
	       a.setId(Integer.parseInt(request.getParameter("id")));
	        a.setNumber_a(Integer.parseInt(request.getParameter("number_a")));
	        a.setType_f(Integer.parseInt(request.getParameter("type_f")));
	        if(request.getParameter("building")!=null)
	        	a.setBuilding(Integer.parseInt(request.getParameter("building")));
	        else
	        	 a.setBuilding(-1);
	        if(request.getParameter("fence")!=null)
	        	a.setFence(Integer.parseInt(request.getParameter("fence")));
	        else
	        	a.setFence(-1);
	        a.setId_f(Integer.parseInt(request.getParameter("user")));
	        a.setAmount(Double.parseDouble(request.getParameter("amount")));
	        a.setFeeder(request.getParameter("feeder"));
	        Date date=DateUtil.parseToDate(request.getParameter("date_a"),DateUtil.yyyyMMdd);
			a.setDate_a(date);
			 a.setRemarks(request.getParameter("remarks"));
	        dao.updateForage(a);
	        
	        int i=Integer.parseInt(request.getParameter("user"));
	    	request.getSession().setAttribute("list",dao.listForage(i))	;
	        response.sendRedirect("F3-1-food.jsp");
	    }
	  
	  private void listForage(HttpServletRequest request, HttpServletResponse response) throws IOException {
			if(request.getParameter("id")!=null)
	    	{
	    		int id=Integer.parseInt(request.getParameter("id"));
	            Forage i=dao.loadForage(id);
	            request.getSession().setAttribute("forage",i);
	    	}
			int i=Integer.parseInt(request.getParameter("user"));
	    	 request.getSession().setAttribute("list",dao.listForage(i));
	 	    response.sendRedirect("F3-1-food.jsp");
	    }

	  private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		  int i=Integer.parseInt(request.getParameter("id"));
		  dao.deleteForage(i);
		  request.getSession().setAttribute("list",dao.listForage(i))	;
	        response.sendRedirect("F3-1-food.jsp");
	  }
}
