package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import clas.Medicine;

public class MedicineDao extends BaseDao{
	Connection con=getConnection();
	public void addMedicine(Medicine m){
		java.util.Date date=new java.util.Date();
		String sql="insert into medicine values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,m.getId_f());
			p.setDate(2,new java.sql.Date(date.getYear(),date.getMonth(),date.getDate()));
			//p.setInt(3,m.getId_m());
			Date d=m.getTime();
			p.setDate(3,new java.sql.Date(d.getYear(),d.getMonth(),d.getDate()));
			p.setInt(4,m.getId_a());
			p.setInt(5,m.getAge());
			p.setInt(6,m.getBuilding());
			p.setInt(7,m.getFence());
			p.setString(8,m.getSymptom());
			p.setInt(9,m.getMedicine());
			p.setDouble(10,m.getDosage());
			p.setInt(11,m.getWay_m());
			p.setString(12,m.getEffect());
			p.setInt(13,m.getTime_r());
			p.setString(14,m.getRemarks());
			p.executeUpdate();
			
		}catch(SQLException sq){
			System.out.print(sq);
		}
	}
	
	public Medicine loadMedicine(int id){
		String sql="Select * from medicine where id=?";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,id);
			ResultSet rs=p.executeQuery();
			 rs.next();
			 Medicine f=new Medicine();
				f.setId(Integer.parseInt(rs.getString("id")));
				f.setId_f(Integer.parseInt(rs.getString("id_f")));
				Date d_i=rs.getDate("date_i");
				f.setDate_i(d_i);
				//f.setId_m(Integer.parseInt(rs.getString("id_m")));
				Date d=rs.getDate("time");
				f.setTime(d);
				f.setId_a(Integer.parseInt(rs.getString("id_a")));
				f.setAge(Integer.parseInt(rs.getString("age")));
				f.setBuilding(Integer.parseInt(rs.getString("building")));
				f.setFence(Integer.parseInt(rs.getString("fence")));
				f.setSymptom(rs.getString("symptom"));
				f.setMedicine(Integer.parseInt(rs.getString("medicine")));
				f.setDosage(Double.parseDouble(rs.getString("Dosage")));
				f.setWay_m(Integer.parseInt(rs.getString("way_m")));
				f.setEffect(rs.getString("effect"));
				f.setExecutant(rs.getString("executant"));
				f.setTime_r(Integer.parseInt(rs.getString("time_r")));
				f.setRemarks(rs.getString("remarks"));
			return f;
		}catch(SQLException sq){
			System.out.print(sq);
			return null;
		}
	}
	
	public ArrayList<Medicine> listMedicine(int id){
		 ArrayList<Medicine> list=new ArrayList<Medicine>();
			String sql="Select * from medicine where id_f=?";
			try{
				PreparedStatement p=con.prepareStatement(sql);
				p.setInt(1,id);
				ResultSet rs=p.executeQuery();
				while( rs.next()){
					 Medicine f=new Medicine();
						f.setId(Integer.parseInt(rs.getString("id")));
						f.setId_f(Integer.parseInt(rs.getString("id_f")));
						Date d_i=rs.getDate("date_i");
						f.setDate_i(d_i);
						f.setId_m(Integer.parseInt(rs.getString("id_m")));
						Date d=rs.getDate("time");
						f.setTime(d);
						f.setId_a(Integer.parseInt(rs.getString("id_a")));
						f.setAge(Integer.parseInt(rs.getString("age")));
						f.setBuilding(Integer.parseInt(rs.getString("building")));
						f.setFence(Integer.parseInt(rs.getString("fence")));
						f.setSymptom(rs.getString("symptom"));
						f.setMedicine(Integer.parseInt(rs.getString("medicine")));
						f.setDosage(Double.parseDouble(rs.getString("Dosage")));
						f.setWay_m(Integer.parseInt(rs.getString("way_m")));
						f.setEffect(rs.getString("effect"));
						f.setExecutant(rs.getString("executant"));
						f.setTime_r(Integer.parseInt(rs.getString("time_r")));
						f.setRemarks(rs.getString("remarks"));
				list.add(f);
				}
				 return list;		//返回人员列表
			}catch(SQLException sq){
				System.out.print(sq);
				return null;
			}
		   
	}
	
	
	public void updateMedicine(Medicine m){
        
        String sql="update medicine set id_f=?,id_m=?,time=?,id_a=?,age=?,building=?,fence=?,sympton=?,medicine=?,dosage=?,way_m=?,effect=?,time_r=?,remarks=? where id=? ";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,m.getId_f());
			p.setInt(2,m.getId_m());
			Date d=m.getTime();
			p.setDate(3,new java.sql.Date(d.getYear(),d.getMonth(),d.getDate()));
			p.setInt(4,m.getId_a());
			p.setInt(5,m.getAge());
			p.setInt(6,m.getBuilding());
			p.setInt(7,m.getFence());
			p.setString(8,m.getSymptom());
			p.setInt(9,m.getMedicine());
			p.setDouble(10,m.getDosage());
			p.setInt(11,m.getWay_m());
			p.setString(12,m.getEffect());
			p.setInt(13,m.getTime_r());
			p.setString(14,m.getRemarks());
			p.setInt(15, m.getId());
			p.executeUpdate();
			
		}catch(SQLException sq){
			System.out.print(sq);
		}
    }
	
	public int deleteMedicine(int id)
	{
		String sql="Delete from medicine where id=?";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,id);
			return p.executeUpdate();
		}catch(SQLException sq){
			System.out.print(sq);
		}
		return -1;
	}
}
