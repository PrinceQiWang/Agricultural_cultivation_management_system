package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import clas.Forage;

public class ForageDao extends BaseDao{
	Connection con=getConnection();
	public void addForage(Forage f){
		java.util.Date date=new java.util.Date();
		String sql="insert into forage values(null,?,?,?,?,?,?,?,?,?,?,?)";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,f.getId_f());	
			p.setDate(2,new java.sql.Date(date.getYear(),date.getMonth(),date.getDate()));
			p.setInt(3,f.getId_m());
			p.setInt(4, f.getBuilding());
			p.setInt(5,f.getFence());
			Date d=f.getDate_a();
			p.setDate(6,new java.sql.Date(d.getYear(),d.getMonth(),d.getDate()));
			p.setInt(7,f.getType_f());
			p.setDouble(8,f.getAmount());
			p.setInt(9, f.getNumber_a());
			p.setString(10,f.getFeeder());
			p.setString(11,f.getRemarks());
			p.executeUpdate();
			
		}catch(SQLException sq){
			System.out.print(sq);
		}
}
	public ArrayList<Forage> listForage(int id){
		 ArrayList<Forage> list=new ArrayList<Forage>();
			String sql="Select * from forage where id_f=?";
			try{
				PreparedStatement p=con.prepareStatement(sql);
				p.setInt(1,id);
				ResultSet rs=p.executeQuery();
				while( rs.next()){
				Forage f=new Forage();
				f.setId(Integer.parseInt(rs.getString("id")));
				f.setId_f(Integer.parseInt(rs.getString("id_f")));
				Date d_i=rs.getDate("date_i");
				f.setDate_i(d_i);
				f.setId_m(Integer.parseInt(rs.getString("id_m")));
				f.setBuilding(Integer.parseInt(rs.getString("building")));
				f.setFence(Integer.parseInt(rs.getString("fence")));
				Date d=rs.getDate("date_a");
				f.setDate_a(d);
				f.setType_f(Integer.parseInt(rs.getString("type_f")));
				f.setAmount(Double.parseDouble(rs.getString("amount")));
				f.setNumber_a(Integer.parseInt(rs.getString("number_a")));
				f.setFeeder(rs.getString("feeder"));
				f.setRemarks(rs.getString("remarks"));		
				list.add(f);
				}
				 return list;		//������Ա�б�
			}catch(SQLException sq){
				System.out.print(sq);
				return null;
			}
		   
	}
	
	public Forage loadForage(int id){
		String sql="Select * from forage where id=?";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,id);
			ResultSet rs=p.executeQuery();
			 rs.next();
			 Forage f=new Forage();
				f.setId(Integer.parseInt(rs.getString("id")));
				f.setId_f(Integer.parseInt(rs.getString("id_f")));
				Date d_i=rs.getDate("date_i");
				f.setDate_i(d_i);
				f.setId_m(Integer.parseInt(rs.getString("id_m")));
				f.setBuilding(Integer.parseInt(rs.getString("building")));
				f.setFence(Integer.parseInt(rs.getString("fence")));
				Date d=rs.getDate("date_a");
				f.setDate_a(d);
				f.setType_f(Integer.parseInt(rs.getString("type_f")));
				f.setAmount(Double.parseDouble(rs.getString("amount")));
				f.setNumber_a(Integer.parseInt(rs.getString("number_a")));
				f.setFeeder(rs.getString("feeder"));
				f.setRemarks(rs.getString("remarks"));			
			return f;
		}catch(SQLException sq){
			System.out.print(sq);
			return null;
		}
	}
	
	public int deleteForage(int c)
	{
		String sql="Delete from forage where id=?";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,c);
			return p.executeUpdate();
		}catch(SQLException sq){
			System.out.print(sq);
		}
		return -1;
	}
	
	 public void updateForage(Forage f){
         
	        String sql="update forage set id_f=?,id_m=?,building=?,fence=?,date_a=?,type_f=?,amount=?,number_a=?,feeder=?,remarks=? where id=? ";
			try{
				PreparedStatement p=con.prepareStatement(sql);
				p.setInt(1,f.getId_f());	
				p.setInt(2,0);
				p.setInt(3, f.getBuilding());
				p.setInt(4,f.getFence());
				Date d=f.getDate_a();
				p.setDate(5,new java.sql.Date(d.getYear(),d.getMonth(),d.getDate()));
				p.setInt(6,f.getType_f());
				p.setDouble(7,f.getAmount());
				p.setInt(8, f.getNumber_a());
				p.setString(9,f.getFeeder());
				p.setString(10,f.getRemarks());
				p.setInt(11, f.getId());
				p.executeUpdate();
				
			}catch(SQLException sq){
				System.out.print(sq);
			}
	    }
}
