package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import clas.Dispose;

public class DisposeDao extends BaseDao{
	Connection con=getConnection();
	public void addDispose(Dispose d){
		java.util.Date date=new java.util.Date();
		String sql="insert into dispose values(null,?,?,?,?,?,?,?,?,?,?,?)";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,d.getId_f());
			p.setDate(2,new java.sql.Date(date.getYear(),date.getMonth(),date.getDate()));
			p.setInt(3,d.getId_m());
			p.setInt(4,d.getId_a());
			Date q=d.getDate();
			p.setDate(5,new java.sql.Date(q.getYear(),q.getMonth(),q.getDate()));
			p.setString(6,d.getReason());
			p.setString(7,d.getWay_f());
			p.setString(8,d.getExecutant());
			p.setString(9,d.getRemarks());
			p.setInt(10,d.getBuilding());
			p.setInt(11,d.getFence());
		}catch(SQLException sq){
			System.out.print(sq);
		}
	}
	
	public Dispose loadDispose(int id){
		String sql="Select * from dispose where id=?";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,id);

			ResultSet rs=p.executeQuery();
			 rs.next();
			 Dispose d=new Dispose();
			d.setId(Integer.parseInt(rs.getString("id")));
			d.setId_f(Integer.parseInt(rs.getString("id_f")));
			d.setDate_i(rs.getDate("date_i"));
			d.setId_m(Integer.parseInt(rs.getString("id_m")));
			d.setId_a(Integer.parseInt(rs.getString("id_a")));
			d.setDate(rs.getDate("date"));
			d.setReason(rs.getString("reason"));
			d.setWay_f(rs.getString("way_f"));
			d.setExecutant(rs.getString("executant"));
			d.setRemarks(rs.getString("remarks"));
			return d;
		}catch(SQLException sq){
			System.out.print(sq);
			return null;
		}
	}
	
	public ArrayList<Dispose> listDispose(int id){
		 ArrayList<Dispose> list=new ArrayList<Dispose>();
			String sql="Select * from dispose where id=?";
			try{
				PreparedStatement p=con.prepareStatement(sql);
				p.setInt(1,id);
				ResultSet rs=p.executeQuery();
				while( rs.next()){
					Dispose d=new Dispose();
					d.setId(Integer.parseInt(rs.getString("id")));
					d.setId_f(Integer.parseInt(rs.getString("id_f")));
					d.setDate_i(rs.getDate("date_i"));
					d.setId_m(Integer.parseInt(rs.getString("id_m")));
					d.setId_a(Integer.parseInt(rs.getString("id_a")));
					d.setDate(rs.getDate("date"));
					d.setReason(rs.getString("reason"));
					d.setWay_f(rs.getString("way_f"));
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
	
	 public void updateDispose(Dispose d){
         
	        String sql="update dispose set id_f=?,date_i=?,id_m=?,id_a=?,date=?,reason=?,way_f=?,excutant=?,remarks=?";
	        java.util.Date date=new java.util.Date();
	        try{
				PreparedStatement p=con.prepareStatement(sql);
				p.setInt(1,d.getId_f());
				Date q=d.getDate();
				p.setDate(2,new java.sql.Date(date.getYear(),date.getMonth(),date.getDate()));
				p.setInt(3,d.getId_m());
				p.setInt(4,d.getId_a());
				p.setDate(5,new java.sql.Date(q.getYear(),q.getMonth(),q.getDate()));
				p.setString(6, d.getReason());
				p.setString(7,d.getWay_f());
				p.setString(8,d.getExecutant());
				p.setString(9,d.getRemarks());
				p.executeUpdate();			
			}catch(SQLException sq){
				System.out.print(sq);
			}
	    }
	
	public int deleteDispose(int d)
	{
		String sql="delete from dispose where id=?";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,d);
			return p.executeUpdate();
		}catch(SQLException sq){
			System.out.print(sq);
		}
		return -1;
	}
}
