package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import clas.Vaccinum;

public class VaccinumDao extends BaseDao{
	Connection con=getConnection();
	public void addVaccinum(Vaccinum v){
		java.util.Date date=new java.util.Date();
		String sql="insert into vaccinum values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,v.getId_f());
			p.setDate(2,new java.sql.Date(date.getYear(),date.getMonth(),date.getDate()));
			p.setInt(3,v.getId_m());
			p.setInt(4,v.getBuilding());
			p.setInt(5,v.getFence());
			p.setInt(6,v.getType_a());
			p.setInt(7,v.getAge());
			p.setInt(8,v.getDisease());
			Date d=v.getLast();
			p.setDate(9,new java.sql.Date(d.getYear(),d.getMonth(),d.getDate()));
			d=v.getNow();
			p.setDate(10,new java.sql.Date(d.getYear(),d.getMonth(),d.getDate()));
			p.setInt(11,v.getTime());
			p.setInt(12,v.getVaccinum());
			p.setDouble(13,v.getDosage());
			p.setInt(14,v.getWay_v());
			p.setInt(15,v.getNumber());
			p.setString(16,v.getReaction());
			p.setString(17,v.getExecutant());
			p.setString(18,v.getRemarks());
			p.executeUpdate();
			
		}catch(SQLException sq){
			System.out.print(sq);
		}
	}
	
	public Vaccinum loadVaccinum(int id){
		String sql="Select * from vaccinum where id=?";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,id);

			ResultSet rs=p.executeQuery();
			 rs.next();
			 Vaccinum v=new Vaccinum();
			v.setId(Integer.parseInt(rs.getString("id")));
			v.setId_f(Integer.parseInt(rs.getString("id_f")));
			v.setDate_i(rs.getDate("date_i"));
			v.setId_m(Integer.parseInt(rs.getString("id_m")));
			v.setBuilding(Integer.parseInt(rs.getString("building")));
			v.setFence(Integer.parseInt(rs.getString("fence")));
			v.setType_a(Integer.parseInt(rs.getString("type_a")));
			v.setAge(Integer.parseInt(rs.getString("age")));
			v.setDisease(Integer.parseInt(rs.getString("disease")));
			v.setLast(rs.getDate("last"));
			v.setNow(rs.getDate("now"));
			v.setTime(Integer.parseInt(rs.getString("time")));
			v.setVaccinum(Integer.parseInt(rs.getString("vaccinum")));
			v.setDosage(Double.parseDouble(rs.getString("dosage")));
			v.setWay_v(Integer.parseInt(rs.getString("Way_v")));
			v.setNumber(Integer.parseInt(rs.getString("number")));
			v.setReaction(rs.getString("vaccinum"));
			v.setExecutant(rs.getString("executant"));
			v.setRemarks(rs.getString("remarks"));
			return v;
		}catch(SQLException sq){
			System.out.print(sq);
			return null;
		}
	}
	
	public ArrayList<Vaccinum> listVaccinum(int id){
		 ArrayList<Vaccinum> list=new ArrayList<Vaccinum>();
			String sql="Select * from vaccinum where id=?";
			try{
				PreparedStatement p=con.prepareStatement(sql);
				p.setInt(1,id);
				ResultSet rs=p.executeQuery();
				while( rs.next()){
					 Vaccinum v=new Vaccinum();
						v.setId(Integer.parseInt(rs.getString("id")));
						v.setId_f(Integer.parseInt(rs.getString("id_f")));
						v.setDate_i(rs.getDate("date_i"));
						v.setId_m(Integer.parseInt(rs.getString("id_m")));
						v.setBuilding(Integer.parseInt(rs.getString("building")));
						v.setFence(Integer.parseInt(rs.getString("fence")));
						v.setType_a(Integer.parseInt(rs.getString("type_a")));
						v.setAge(Integer.parseInt(rs.getString("age")));
						v.setDisease(Integer.parseInt(rs.getString("disease")));
						v.setLast(rs.getDate("last"));
						v.setNow(rs.getDate("now"));
						v.setTime(Integer.parseInt(rs.getString("time")));
						v.setVaccinum(Integer.parseInt(rs.getString("vaccinum")));
						v.setDosage(Integer.parseInt(rs.getString("dosage")));
						v.setWay_v(Integer.parseInt(rs.getString("Way_v")));
						v.setNumber(Integer.parseInt(rs.getString("number")));
						v.setReaction(rs.getString("vaccinum"));
						v.setExecutant(rs.getString("executant"));
						v.setRemarks(rs.getString("remarks"));
				list.add(v);
				}
				 return list;		//返回人员列表
			}catch(SQLException sq){
				System.out.print(sq);
				return null;
			}
		   
	}
	
	 public void updateVaccinum(Vaccinum v){
         
	        String sql="update vaccinum set id_f=?,id_m=?,building=?,fence=?,type_a=?,age=?,disease=?,last=?,now=?,time=?,vaccinum=?,dosage=?,way_v=?,number=?,reaction=?,executant=?,remarks=? where id=? ";
			try{
				PreparedStatement p=con.prepareStatement(sql);
				p.setInt(1,v.getId_f());
				p.setInt(2,v.getId_m());
				p.setInt(3,v.getBuilding());
				p.setInt(4,v.getFence());
				p.setInt(5,v.getType_a());
				p.setInt(6,v.getAge());
				p.setInt(7,v.getDisease());
				Date d=v.getLast();
				p.setDate(8,new java.sql.Date(d.getYear(),d.getMonth(),d.getDate()));
				d=v.getNow();
				p.setDate(9,new java.sql.Date(d.getYear(),d.getMonth(),d.getDate()));
				p.setInt(10,v.getTime());
				p.setInt(11,v.getVaccinum());
				p.setDouble(12,v.getDosage());
				p.setInt(13,v.getWay_v());
				p.setInt(14,v.getNumber());
				p.setString(15,v.getReaction());
				p.setString(16,v.getExecutant());
				p.setString(17, v.getRemarks());
				p.setInt(18,v.getId());
				p.executeUpdate();			
			}catch(SQLException sq){
				System.out.print(sq);
			}
	    }
	
	public int deleteVaccinum(int c)
	{
		String sql="delete from vaccinum where id=?";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,c);
			return p.executeUpdate();
		}catch(SQLException sq){
			System.out.print(sq);
		}
		return -1;
	}
}
