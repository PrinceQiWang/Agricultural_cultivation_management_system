package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import clas.Disinfect;

public class DisinfectDao extends BaseDao{
	Connection con=getConnection();
	public void addDisinfect(Disinfect d){
		java.util.Date date=new java.util.Date();
		String sql="insert into vaccinum values(null,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,d.getId_f());
			p.setDate(2,new java.sql.Date(date.getYear(),date.getMonth(),date.getDate()));
			p.setInt(3,d.getId_m());
			p.setInt(4,d.getBuilding());
			p.setInt(6,d.getFence());
			p.setInt(7,d.getDisinfectant());
			Date q=d.getDate();
			p.setDate(8,new java.sql.Date(q.getYear(),q.getMonth(),q.getDate()));
			p.setInt(9,d.getDisinfectant());
			p.setDouble(10,d.getDosage());
			p.setInt(11,d.getWay_d());
			p.setString(12,d.getExecutant());
			p.setString(13,d.getRemarks());
			
		}catch(SQLException sq){
			System.out.print(sq);
		}
	}
	
	public Disinfect loadDisinfect(int id){
		String sql="Select * from disinfect where id=?";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,id);

			ResultSet rs=p.executeQuery();
			 rs.next();
			 Disinfect v=new Disinfect();
			v.setId(Integer.parseInt(rs.getString("id")));
			v.setId_f(Integer.parseInt(rs.getString("id_f")));
			v.setDate_i(rs.getDate("date_i"));
			v.setId_m(Integer.parseInt(rs.getString("id_m")));
			v.setBuilding(Integer.parseInt(rs.getString("building")));
			v.setDate(rs.getDate("date"));
			v.setFence(Integer.parseInt(rs.getString("fence")));
			v.setDisinfectant(Integer.parseInt(rs.getString("disinfectant")));
			v.setDosage(Integer.parseInt(rs.getString("dosage")));
			v.setWay_d(Integer.parseInt(rs.getString("way_d")));
			v.setExecutant(rs.getString("executant"));
			v.setRemarks(rs.getString("remarks"));
			return v;
		}catch(SQLException sq){
			System.out.print(sq);
			return null;
		}
	}
	
	public ArrayList<Disinfect> listDisinfect(){
		 ArrayList<Disinfect> list=new ArrayList<Disinfect>();
			String sql="Select * from disinfect";
			try{
				PreparedStatement p=con.prepareStatement(sql);
				ResultSet rs=p.executeQuery();
				while( rs.next()){
					Disinfect d=new Disinfect();
					d.setId(Integer.parseInt(rs.getString("id")));
					d.setId_f(Integer.parseInt(rs.getString("id_f")));
					d.setDate_i(rs.getDate("date_i"));
					d.setId_m(Integer.parseInt(rs.getString("id_m")));
					d.setBuilding(Integer.parseInt(rs.getString("building")));
					d.setDate(rs.getDate("date"));
					d.setFence(Integer.parseInt(rs.getString("fence")));
					d.setDisinfectant(Integer.parseInt(rs.getString("disinfectant")));
					d.setDosage(Integer.parseInt(rs.getString("dosage")));
					d.setWay_d(Integer.parseInt(rs.getString("way_d")));
					d.setExecutant(rs.getString("executant"));
					d.setRemarks(rs.getString("remarks"));
				list.add(d);
				}
				 return list;		
			}catch(SQLException sq){
				System.out.print(sq);
				return null;
			}
		   
	}
	
	 public void updateDisinfect(Disinfect d){
         
	        String sql="update disinfect set id_f=?,date_i=?,id_m=?,building=?,date=?,fence=?,disinfectant=?,dosage=?,way_d=?,excutant=?,remarks=?";
	        java.util.Date date=new java.util.Date();
	        try{
				PreparedStatement p=con.prepareStatement(sql);
				p.setInt(1,d.getId_f());
				Date q=d.getDate();
				p.setDate(2,new java.sql.Date(date.getYear(),date.getMonth(),date.getDate()));
				p.setInt(3,d.getId_m());
				p.setInt(4,d.getBuilding());
				p.setInt(6,d.getFence());
				p.setInt(7,d.getDisinfectant());
				p.setDate(8,new java.sql.Date(q.getYear(),q.getMonth(),q.getDate()));
				p.setInt(9,d.getDisinfectant());
				p.setDouble(10,d.getDosage());
				p.setInt(11,d.getWay_d());
				p.setString(12,d.getExecutant());
				p.setString(13,d.getRemarks());
				p.executeUpdate();			
			}catch(SQLException sq){
				System.out.print(sq);
			}
	    }
	
	public int deleteDisinfect(Disinfect d)
	{
		String sql="delete from disinfect where id=?";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,d.getId());
			return p.executeUpdate();
		}catch(SQLException sq){
			System.out.print(sq);
		}
		return -1;
	}
}
