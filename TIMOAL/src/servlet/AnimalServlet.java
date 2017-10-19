package servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import clas.Animal;
import tool.DateUtil;
import Dao.AnimalDao;

@WebServlet("/Animal")
public class AnimalServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
		private AnimalDao dao=new AnimalDao();
	    public void doPost(HttpServletRequest request, HttpServletResponse response)
	 			throws ServletException, IOException {
	     	doGet(request,response);
	     }
	    public void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {

	        String action =request.getParameter("action");
	        if("list".equals(action)){
	            listAnimal(request,response);
	        }else if("add".equals(action)){
	           addAnimal(request,response);
	        }else if("delete".equals(action)){
	           deleteAnimal(request,response);
	        }else if("update".equals(action)){
	        	updateAnimal(request,response);
	        }else if("detail".equals(action)){
	        	detailAnimal(request,response);
	        }else
	        response.sendRedirect("error.jsp");
	    }
	    
	    private void detailAnimal(HttpServletRequest request, HttpServletResponse response) throws IOException {
	        int id=Integer.parseInt(request.getParameter("id"));
	        Animal i=dao.loadAnimal(id);
	        request.getSession().setAttribute("Animal",i);
	        response.sendRedirect("F2-1-pig.jsp?check=1");
	    }
	    
	    private void addAnimal(HttpServletRequest request, HttpServletResponse response) throws IOException {
	       Animal a=new Animal();
	       
	        a.setId_a(Integer.parseInt(request.getParameter("id_a")));
	        a.setType_v(Integer.parseInt(request.getParameter("type_v")));
	        a.setBuilding(Integer.parseInt(request.getParameter("building")));
	        a.setFence(Integer.parseInt(request.getParameter("fence")));
	        a.setId_f(Integer.parseInt(request.getParameter("user")));
	        a.setSource(new String (request.getParameter("source").getBytes("ISO-8859-1"),"utf-8"));
	       
	        Date d=new java.util.Date();
	        d.setYear(Integer.parseInt(request.getParameter("year"))-1900);
	        d.setMonth(Integer.parseInt(request.getParameter("month")));
	        d.setDate(Integer.parseInt(request.getParameter("day")));
	        a.setDate(d);
	        dao.addAnimal(a);
	        
	        int i=Integer.parseInt(request.getParameter("user"));
	    	request.getSession().setAttribute("list",dao.listAnimal(i,-1,-1))	;
	         response.sendRedirect("F2-0.jsp");;
	    }
	    
	    private void updateAnimal(HttpServletRequest request, HttpServletResponse response) throws IOException {
		       Animal a=new Animal();
		       a.setId(Integer.parseInt(request.getParameter("id")));
		        a.setId_a(Integer.parseInt(request.getParameter("id_a")));
		        a.setType_v(Integer.parseInt(request.getParameter("type_v")));
		        a.setBuilding(Integer.parseInt(request.getParameter("building")));
		        a.setFence(Integer.parseInt(request.getParameter("fence")));
		        //a.setId_f(Integer.parseInt(request.getParameter("user")));
		        a.setSource(request.getParameter("source"));
		        Date d=DateUtil.parseToDate(request.getParameter("date"),DateUtil.yyyyMMdd);
		        a.setDate(d);
		        dao.updateAnimal(a);
		        Animal i=dao.loadAnimal(a.getId());
		        request.getSession().setAttribute("Animal",i);
		        response.sendRedirect("F2-1-pig.jsp?check=1");
		    }
	    
	    private void listAnimal(HttpServletRequest request, HttpServletResponse response) throws IOException {
	    	int building,fence;
	    	if(request.getParameter("building")==null)
	    		building=-1;
	    	else
	    		building=Integer.parseInt(request.getParameter("building"));
	    	if(request.getParameter("fence")==null)
	    		fence=-1;
	    	else
	    		fence=Integer.parseInt(request.getParameter("fence"));
	    	int i=Integer.parseInt(request.getParameter("user"));
	    	request.getSession().setAttribute("list",dao.listAnimal(i,building,fence));
	         response.sendRedirect("F2-0.jsp");

	    }
	    
	    private void deleteAnimal(HttpServletRequest request, HttpServletResponse response) throws IOException {
	    
	    	int id=Integer.parseInt(request.getParameter("id"));
	    	dao.deleteAnimal(id);
	    	int i=Integer.parseInt(request.getParameter("user"));
	    	request.getSession().setAttribute("list",dao.listAnimal(i,-1,-1))	;
	         response.sendRedirect("F2-0.jsp");

	    }
}
