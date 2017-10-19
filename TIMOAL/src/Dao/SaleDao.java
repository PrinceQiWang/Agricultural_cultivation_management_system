package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import clas.Sale;

public class SaleDao extends BaseDao{
	Connection con=getConnection();
	public void addSale(Sale s){
		java.util.Date date=new java.util.Date();
		String sql="insert into sale values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,s.getId_f());
			p.setDate(2,new java.sql.Date(date.getYear(),date.getMonth(),date.getDate()));
			p.setInt(3,s.getId_m());
			p.setInt(4,s.getId_a());
			p.setInt(5,s.getType_v());
			Date d=s.getDate_s();
			p.setDate(6,new java.sql.Date(d.getYear(),d.getMonth(),d.getDate()));
			p.setDouble(7,s.getPrice());
			p.setInt(8,s.getAmount());
			p.setString(9,s.getDirection());
			p.setString(10,s.getExecutant());
			p.setString(11,s.getConclusion());
			p.setInt(12,s.getBuilding());
			p.setInt(13,s.getFence());
			p.setString(14, s.getRemarks());
			p.executeUpdate();
			
		}catch(SQLException sq){
			System.out.print(sq);
		}
	}
	
	public Sale loadSale(int id){
		String sql="Select * from sale where id=?";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,id);

			ResultSet rs=p.executeQuery();
			 rs.next();
			 Sale v=new Sale();
			v.setId(Integer.parseInt(rs.getString("id")));
			v.setId_f(Integer.parseInt(rs.getString("id_f")));
			v.setDate_i(rs.getDate("date_i"));
			v.setId_m(Integer.parseInt(rs.getString("id_m")));
			v.setId_a(Integer.parseInt(rs.getString("Id_a")));
			v.setType_v(Integer.parseInt(rs.getString("type_v")));
			v.setDate_s(rs.getDate("date_s"));
			v.setPrice(Double.parseDouble(rs.getString("price")));
			v.setAmount(Integer.parseInt(rs.getString("amount")));
			v.setDirection(rs.getString("direction"));
			v.setExecutant(rs.getString("executant"));
			v.setConclusion(rs.getString("conclusion"));
			v.setBuilding(Integer.parseInt(rs.getString("building")));
			v.setFence(Integer.parseInt(rs.getString("fence")));
			v.setRemarks(rs.getString("remarks"));
			return v;
		}catch(SQLException sq){
			System.out.print(sq);
			return null;
		}
	}
	
	public ArrayList<Sale> listSale(int id){
		 ArrayList<Sale> list=new ArrayList<Sale>();
			String sql="Select * from sale where id=?";
			try{
				PreparedStatement p=con.prepareStatement(sql);
				p.setInt(1,id);
				ResultSet rs=p.executeQuery();
				while( rs.next()){
					Sale v=new Sale();
					v.setId(Integer.parseInt(rs.getString("id")));
					v.setId_f(Integer.parseInt(rs.getString("id_f")));
					v.setDate_i(rs.getDate("date_i"));
					v.setId_m(Integer.parseInt(rs.getString("id_m")));
					v.setId_a(Integer.parseInt(rs.getString("id_a")));
					v.setType_v(Integer.parseInt(rs.getString("type_v")));
					v.setDate_s(rs.getDate("date_s"));
					v.setPrice(Double.parseDouble(rs.getString("price")));
					v.setAmount(Integer.parseInt(rs.getString("amount")));
					v.setDirection(rs.getString("direction"));
					v.setExecutant(rs.getString("executant"));
					v.setConclusion(rs.getString("conclusion"));
					v.setBuilding(Integer.parseInt(rs.getString("building")));
					v.setFence(Integer.parseInt(rs.getString("fence")));
					v.setRemarks(rs.getString("remarks"));
				list.add(v);
				}
				 return list;		
			}catch(SQLException sq){
				System.out.print(sq);
				return null;
			}
		   
	}
	
	 public void updateSale(Sale s){
         
	        String sql="update sale set id_f=?,id_m=?,id_a=?,type_v=?,date_s=?,price=?,amount=?,direction=?,executant=?,conclusion=?,building=?,fence=?,remarks=? where id=? ";
			try{
				PreparedStatement p=con.prepareStatement(sql);
				p.setInt(1,s.getId_f());
				p.setInt(2,s.getId_m());
				p.setInt(3,s.getId_a());
				p.setInt(4,s.getType_v());
				Date d=s.getDate_s();
				p.setDate(5,new java.sql.Date(d.getYear(),d.getMonth(),d.getDate()));
				p.setDouble(6, s.getPrice());
				p.setInt(7,s.getAmount());
				p.setString(8,s.getDirection());
				p.setString(9,s.getExecutant());
				p.setString(10,s.getConclusion());
				p.setInt(11,s.getBuilding());
				p.setInt(12,s.getFence());
				p.setString(13,s.getRemarks());
				p.executeUpdate();			
			}catch(SQLException sq){
				System.out.print(sq);
			}
	    }
	
	public int deleteSale(int s)
	{
		String sql="delete from sale where id=?";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,s);
			return p.executeUpdate();
		}catch(SQLException sq){
			System.out.print(sq);
		}
		return -1;
	}
}
