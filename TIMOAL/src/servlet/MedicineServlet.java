package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import clas.Forage;
import clas.Medicine;
import Dao.MedicineDao;
@WebServlet("/Medicine")
public class MedicineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MedicineDao  dao=new MedicineDao();
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
           addMedicine(request,response);
        }else if("delete".equals(action)){
           delete(request,response);
        }else if("update".equals(action)){
        	update(request,response);
        }else if("detail".equals(action)){
        	//detail(request,response);
        }else
        response.sendRedirect("error.jsp");
	}
	
	 private void addMedicine(HttpServletRequest request, HttpServletResponse response) throws IOException {
	       Medicine a=new Medicine();
      
	        a.setBuilding(Integer.parseInt(request.getParameter("building")));
	        a.setFence(Integer.parseInt(request.getParameter("fence")));
	        a.setId_a(Integer.parseInt(request.getParameter("id_a")));
	        a.setId_f(Integer.parseInt(request.getParameter("user")));
	        a.setAge(Integer.parseInt(request.getParameter("age")));
	        a.setMedicine(Integer.parseInt(request.getParameter("medicine")));
	        a.setDosage(Double.parseDouble(request.getParameter("dosage")));
	        a.setWay_m(Integer.parseInt(request.getParameter("way_m")));
	        a.setEffect(request.getParameter("effect"));
	        a.setExecutant(request.getParameter("executant"));
	        a.setTime_r(Integer.parseInt(request.getParameter("time_r")));
	        a.setRemarks(request.getParameter("remarks"));
	        Date d=new java.util.Date();
	        d.setYear(Integer.parseInt(request.getParameter("year"))-1900);
	        d.setMonth(Integer.parseInt(request.getParameter("month")));
	        d.setDate(Integer.parseInt(request.getParameter("day")));
	        a.setTime(d);
	        dao.addMedicine(a);
	        
	        int i=Integer.parseInt(request.getParameter("user"));
	    	request.getSession().setAttribute("list",dao.listMedicine(i))	;
	        response.sendRedirect("F3-2-medicine.jsp");
	    }

	 private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
	       Medicine a=new Medicine();
    
	        a.setBuilding(Integer.parseInt(request.getParameter("building")));
	        a.setFence(Integer.parseInt(request.getParameter("fence")));
	        a.setId_a(Integer.parseInt(request.getParameter("id_a")));
	        a.setId_f(Integer.parseInt(request.getParameter("user")));
	        a.setAge(Integer.parseInt(request.getParameter("age")));
	        a.setMedicine(Integer.parseInt(request.getParameter("medicine")));
	        a.setDosage(Double.parseDouble(request.getParameter("dosage")));
	        a.setWay_m(Integer.parseInt(request.getParameter("way_m")));
	        a.setEffect(request.getParameter("effect"));
	        a.setExecutant(request.getParameter("executant"));
	        a.setTime_r(Integer.parseInt(request.getParameter("time_r")));
	        a.setRemarks(request.getParameter("remarks"));
	        Date d=new java.util.Date();
	        d.setYear(Integer.parseInt(request.getParameter("year"))-1900);
	        d.setMonth(Integer.parseInt(request.getParameter("month")));
	        d.setDate(Integer.parseInt(request.getParameter("day")));
	        a.setTime(d);
	        dao.addMedicine(a);
	        
	        int i=Integer.parseInt(request.getParameter("user"));
	    	request.getSession().setAttribute("list",dao.listMedicine(i))	;
	        response.sendRedirect("F3-2-medicine.jsp");
	    }
	 
	  private void list(HttpServletRequest request, HttpServletResponse response) throws IOException {
			if(request.getParameter("id")!=null)
	    	{
	    		int id=Integer.parseInt(request.getParameter("id"));
	            Medicine i=dao.loadMedicine(id);
	            request.getSession().setAttribute("medicine",i);
	    	}
			int i=Integer.parseInt(request.getParameter("user"));
	    	 request.getSession().setAttribute("medicinelist",dao.listMedicine(i));
	 	    response.sendRedirect("F3-2-medicine.jsp");
	    }

	  private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		  int i=Integer.parseInt(request.getParameter("id"));
		  dao.deleteMedicine(i);
		  request.getSession().setAttribute("medicinelist",dao.listMedicine(i))	;
	        response.sendRedirect("F3-2-medicine.jsp");
	  }

}
