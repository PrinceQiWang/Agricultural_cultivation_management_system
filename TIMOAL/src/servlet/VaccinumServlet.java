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
import clas.Forage;
import clas.Medicine;
import clas.Vaccinum;
import Dao.VaccinumDao;
@WebServlet("/Vaccinum")
public class VaccinumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	VaccinumDao dao=new VaccinumDao();
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
           addVaccinum(request,response);
        }else if("delete".equals(action)){
        	delete(request,response);
        }else if("update".equals(action)){
        	update(request,response);
        }else if("detail".equals(action)){
        	//detail(request,response);
        }else
        response.sendRedirect("error.jsp");
	}
	 private void addVaccinum(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 Vaccinum a=new Vaccinum();
	       
		 	Date date=DateUtil.parseToDate(request.getParameter("last"),DateUtil.yyyyMMdd);
			a.setLast(new java.sql.Date(date.getYear(),date.getMonth(),date.getDate()));
			date=DateUtil.parseToDate(request.getParameter("now"),DateUtil.yyyyMMdd);
			a.setNow(new java.sql.Date(date.getYear(),date.getMonth(),date.getDate()));
			a.setTime(Integer.parseInt(request.getParameter("time")));
	        a.setBuilding(Integer.parseInt(request.getParameter("building")));
	        a.setFence(Integer.parseInt(request.getParameter("fence")));
	        a.setNumber(Integer.parseInt(request.getParameter("number")));
	        a.setId_f(Integer.parseInt(request.getParameter("user")));
	        a.setDisease(Integer.parseInt(request.getParameter("disease")));
	        a.setVaccinum(Integer.parseInt(request.getParameter("vaccinum")));
	        a.setDosage(Double.parseDouble(request.getParameter("dosage")));
	        a.setWay_v(Integer.parseInt(request.getParameter("way_v")));
	        a.setReaction(request.getParameter("reaction"));
	        a.setExecutant(request.getParameter("executant"));
	        a.setRemarks(request.getParameter("remarks"));
	        dao.addVaccinum(a); 
	        int i=Integer.parseInt(request.getParameter("user"));
	    	request.getSession().setAttribute("list",dao.listVaccinum(i))	;
	        response.sendRedirect("F3-3-vaccine.jsp");
	    }

	 
	 private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 Vaccinum a=new Vaccinum();
	       
		 Date date=DateUtil.parseToDate(request.getParameter("last"),DateUtil.yyyyMMdd);
			a.setLast(new java.sql.Date(date.getYear(),date.getMonth(),date.getDate()));
			date=DateUtil.parseToDate(request.getParameter("now"),DateUtil.yyyyMMdd);
			a.setNow(new java.sql.Date(date.getYear(),date.getMonth(),date.getDate()));
			a.setTime(Integer.parseInt(request.getParameter("time")));
	        a.setBuilding(Integer.parseInt(request.getParameter("building")));
	        a.setFence(Integer.parseInt(request.getParameter("fence")));
	        a.setNumber(Integer.parseInt(request.getParameter("number")));
	        a.setId_f(Integer.parseInt(request.getParameter("user")));
	        a.setDisease(Integer.parseInt(request.getParameter("disease")));
	        a.setVaccinum(Integer.parseInt(request.getParameter("vaccinum")));
	        a.setDosage(Double.parseDouble(request.getParameter("dosage")));
	        a.setWay_v(Integer.parseInt(request.getParameter("way_v")));
	        a.setReaction(request.getParameter("reaction"));
	        a.setExecutant(request.getParameter("executant"));
	        a.setRemarks(request.getParameter("remarks"));
	        dao.updateVaccinum(a);
	        
	        int i=Integer.parseInt(request.getParameter("user"));
	    	request.getSession().setAttribute("list",dao.listVaccinum(i))	;
	        response.sendRedirect("F3-3-vaccine.jsp");
	    }
	  
	  private void list(HttpServletRequest request, HttpServletResponse response) throws IOException {
			if(request.getParameter("id")!=null)
	    	{
	    		int id=Integer.parseInt(request.getParameter("id"));
	    		Vaccinum i=dao.loadVaccinum(id);
	            request.getSession().setAttribute("vaccinum",i);
	    	}
			int i=Integer.parseInt(request.getParameter("user"));
	    	 request.getSession().setAttribute("vaccinumlist",dao.listVaccinum(i));
	 	    response.sendRedirect("F3-3-vaccine.jsp");
	    }

	  private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		  int i=Integer.parseInt(request.getParameter("id"));
		  dao.deleteVaccinum(i);
		  request.getSession().setAttribute("vaccinumlist",dao.listVaccinum(i))	;
	        response.sendRedirect("F3-3-vaccine.jsp");
	  }
}
