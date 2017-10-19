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
import clas.Sale;
import clas.Vaccinum;
import Dao.SaleDao;
@WebServlet("/Sale")
public class SaleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SaleDao dao=new SaleDao();
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
           addSale(request,response);
        }else if("delete".equals(action)){
           delete(request,response);
        }else if("update".equals(action)){
        	update(request,response);
        }else if("detail".equals(action)){
        	//detail(request,response);
        }else
        response.sendRedirect("error.jsp");
	}

	 private void addSale(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 Sale a=new Sale();
	       
		 	Date date=DateUtil.parseToDate(request.getParameter("date_s"),DateUtil.yyyyMMdd);
			a.setDate_s(new java.sql.Date(date.getYear(),date.getMonth(),date.getDate()));
	        a.setBuilding(Integer.parseInt(request.getParameter("building")));
	        a.setFence(Integer.parseInt(request.getParameter("fence")));
	        a.setId_a(Integer.parseInt(request.getParameter("id_a")));
	        a.setId_f(Integer.parseInt(request.getParameter("user")));
	        a.setType_v(Integer.parseInt(request.getParameter("type_v")));
	        a.setPrice(Double.parseDouble(request.getParameter("price")));
	        a.setAmount(Integer.parseInt(request.getParameter("amount")));
	        a.setDirection(request.getParameter("direction"));
	        a.setConclusion(request.getParameter("conclusion"));
	        a.setExecutant(request.getParameter("executant"));
	        a.setRemarks(request.getParameter("remarks"));
	        dao.addSale(a); 
	        int i=Integer.parseInt(request.getParameter("user"));
	    	request.getSession().setAttribute("list",dao.listSale(i))	;
	        response.sendRedirect("F3-5-sale.jsp");
	    }


	 private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 Sale a=new Sale();
	    
		 	Date date=DateUtil.parseToDate(request.getParameter("date_s"),DateUtil.yyyyMMdd);
			a.setDate_s(new java.sql.Date(date.getYear(),date.getMonth(),date.getDate()));
	        a.setBuilding(Integer.parseInt(request.getParameter("building")));
	        a.setFence(Integer.parseInt(request.getParameter("fence")));
	        a.setId_a(Integer.parseInt(request.getParameter("id_a")));
	        a.setId_f(Integer.parseInt(request.getParameter("user")));
	        a.setType_v(Integer.parseInt(request.getParameter("type_v")));
	        a.setPrice(Double.parseDouble(request.getParameter("price")));
	        a.setAmount(Integer.parseInt(request.getParameter("amount")));
	        a.setDirection(request.getParameter("direction"));
	        a.setConclusion(request.getParameter("conclusion"));
	        a.setExecutant(request.getParameter("executant"));
	        a.setRemarks(request.getParameter("remarks"));
	        dao.updateSale(a); 
	        int i=Integer.parseInt(request.getParameter("user"));
	    	request.getSession().setAttribute("list",dao.listSale(i))	;
	        response.sendRedirect("F3-5-sale.jsp");
	    }
	 
	 private void list(HttpServletRequest request, HttpServletResponse response) throws IOException {
			if(request.getParameter("id")!=null)
	    	{
	    		int id=Integer.parseInt(request.getParameter("id"));
	    		Sale i=dao.loadSale(id);
	            request.getSession().setAttribute("sale",i);
	    	}
			int i=Integer.parseInt(request.getParameter("user"));
	    	 request.getSession().setAttribute("salelist",dao.listSale(i));
	 	    response.sendRedirect("F3-5-sale.jsp");
	    }

	  private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		  int i=Integer.parseInt(request.getParameter("id"));
		  dao.deleteSale(i);
		  request.getSession().setAttribute("salelist",dao.listSale(i))	;
	        response.sendRedirect("F3-5-sale.jsp");
	  }
}
