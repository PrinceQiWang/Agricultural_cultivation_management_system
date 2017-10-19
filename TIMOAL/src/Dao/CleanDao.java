package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import clas.Animal;
import clas.Clean;

public class CleanDao extends BaseDao{
	Connection con=getConnection();
	public void addClean(Clean c){
		java.util.Date date=new java.util.Date();
		String sql="insert into clean values(null,?,?,?,?,?,?,?,?,?,?)";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,c.getId_f());
			Date d=c.getDate_i();
			p.setDate(2,new java.sql.Date(date.getYear(),date.getMonth(),date.getDate()));
			p.setInt(3,c.getNum());
			p.setDate(4,new java.sql.Date(d.getYear(),d.getMonth(),d.getDate()));
			p.setString(5,c.getSticking());
			p.setString(6,c.getWay_c());
			p.setInt(7,c.getDisinfectant());
			p.setDouble(8,c.getConcentration());
			p.setString(9,c.getExecutant());
			p.setString(10,c.getRemarks());
			p.executeUpdate();
			
		}catch(SQLException sq){
			System.out.print(sq);
		}
	}
	
	public Clean loadClean(int id){
		String sql="Select * from clean where id=?";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,id);
			ResultSet rs=p.executeQuery();
			 rs.next();
			 Clean c=new Clean();
				c.setId(Integer.parseInt(rs.getString("id")));
				c.setId_f(Integer.parseInt(rs.getString("id_f")));
				Date d_i=rs.getDate("date_i");
				c.setDate_i(d_i);
				c.setId_m(Integer.parseInt(rs.getString("id_m")));
				c.setNum(Integer.parseInt(rs.getString("num")));
				Date d=rs.getDate("date");
				c.setDate(d);
				c.setSticking(rs.getString("sticking"));
				c.setWay_c(rs.getString("way_c"));
				c.setDisinfectant(Integer.parseInt(rs.getString("disinfectant")));
				c.setConcentration(Double.parseDouble(rs.getString("concentration")));
				c.setExecutant(rs.getString("executant"));
				c.setRemarks(rs.getString("remarks"));				
			return c;
		}catch(SQLException sq){
			System.out.print(sq);
			return null;
		}
	}
	
	public ArrayList<Clean> listClean(){
		 ArrayList<Clean> list=new ArrayList<Clean>();
			String sql="Select * from clean";
			try{
				PreparedStatement p=con.prepareStatement(sql);
				ResultSet rs=p.executeQuery();
				while( rs.next()){
				Clean c=new Clean();
				c.setId(Integer.parseInt(rs.getString("id")));
				c.setId_f(Integer.parseInt(rs.getString("id_f")));
				Date d_i=rs.getDate("date_i");
				c.setDate_i(d_i);
				c.setId_m(Integer.parseInt(rs.getString("id_m")));
				c.setNum(Integer.parseInt(rs.getString("num")));
				Date d=rs.getDate("date");
				c.setDate(d);
				c.setSticking(rs.getString("sticking"));
				c.setWay_c(rs.getString("way_c"));
				c.setDisinfectant(Integer.parseInt(rs.getString("disinfectant")));
				c.setConcentration(Double.parseDouble(rs.getString("concentration")));
				c.setExecutant(rs.getString("executant"));
				c.setRemarks(rs.getString("remarks"));		
				list.add(c);
				}
				 return list;		//返回人员列表
			}catch(SQLException sq){
				System.out.print(sq);
				return null;
			}
		   
	}
	
	
	public int deleteClean(Clean c)
	{
		String sql="Delete from clean where id=?";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,c.getId());
			return p.executeUpdate();
		}catch(SQLException sq){
			System.out.print(sq);
		}
		return -1;
	}
	 public void updateClean(Clean c){
         
	        String sql="update clean set id_f=?,id_m=?,num=?,date=?,sticking=?,way_c=?,disinfectant=?,concentration=?executant=?,remarks=? where id=? ";
			try{
				PreparedStatement p=con.prepareStatement(sql);
				p.setInt(1,c.getId_f());		
				p.setInt(2,c.getId_m());
				p.setInt(3,c.getNum());
				Date d=c.getDate();
				p.setDate(4,new java.sql.Date(d.getYear(),d.getMonth(),d.getDate()));
				p.setString(5,c.getSticking());
				p.setString(6,c.getWay_c());
				p.setInt(7,c.getDisinfectant());
				p.setDouble(8,c.getConcentration());
				p.setString(9,c.getExecutant());
				p.setString(10,c.getRemarks());
				p.executeUpdate();
				
			}catch(SQLException sq){
				System.out.print(sq);
			}
	    }
}
