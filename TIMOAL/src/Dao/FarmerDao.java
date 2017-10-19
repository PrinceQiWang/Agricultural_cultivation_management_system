package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import clas.Farmer;
import servlet.MD5;

public class FarmerDao extends BaseDao{
	Connection con=getConnection();
	public void addFarmer(Farmer f){
		String sql="insert into farmer values(null,?,?,?,?,?,?,?,?)";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setString(1,f.getId());
			MD5 md = new MD5();
			p.setString(2,md.Encrypt(f.getId()));
			p.setString(3,f.getName());
			p.setString(4,f.getAddress());
			p.setString(5,f.getTelephone());
			p.setString(6,f.getEmail());
			p.setInt(7, f.getGroup());
			p.setInt(8,0);
			p.executeUpdate();
			
		}catch(SQLException sq){
			System.out.print(sq);
		}
	}
	
	public ArrayList<Farmer> listFarmer(){
		 ArrayList<Farmer> list=new ArrayList<Farmer>();
			String sql="Select * from farmer";
			try{
				PreparedStatement p=con.prepareStatement(sql);
				ResultSet rs=p.executeQuery();
				while( rs.next()){
				Farmer f=new Farmer();
				f.setId_f(Integer.parseInt(rs.getString("id_f")));
				f.setId(rs.getString("id"));
				f.setPassword(rs.getString("password"));
				f.setName(rs.getString("name"));
				f.setAddress(rs.getString("address"));
				f.setTelephone(rs.getString("telephone"));
				f.setEmail(rs.getString("email"));
				f.setGroup(Integer.parseInt(rs.getString("groupe")));
				f.setReport(Integer.parseInt(rs.getString("report")));		
				list.add(f);
				}
				 return list;
			}catch(SQLException sq){
				System.out.print(sq);
				return null;
			}
		   
	}
	
	public Farmer loadFarmer(int id_f){
		String sql="Select * from farmer where id_f=?";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,id_f);
			ResultSet rs=p.executeQuery();
			 rs.next();
			Farmer f=new Farmer();
			f.setId_f(Integer.parseInt(rs.getString("id_f")));
			f.setId(rs.getString("id"));
			f.setPassword(rs.getString("password"));
			f.setName(rs.getString("name"));
			f.setAddress(rs.getString("address"));
			f.setTelephone(rs.getString("telephone"));
			f.setEmail(rs.getString("email"));
			f.setGroup(Integer.parseInt(rs.getString("groupe")));
			f.setReport(Integer.parseInt(rs.getString("report")));
			return f;
		}catch(SQLException sq){
			System.out.print(sq);
			return null;
		}
	}
	
	public void updateFarmer(Farmer f){
		String sql="update farmer set id=?,name=?,address=?,telephone=?,email=?,groupe=? where id_f=?";
		
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setString(1,f.getId());
			p.setString(2,f.getName());
			p.setString(3,f.getAddress());
			p.setString(4,f.getTelephone());
			p.setString(5,f.getEmail());
			p.setInt(6,f.getGroup());
			p.setInt(7,f.getId_f());
			p.executeUpdate();
			
		}catch(SQLException sq){
			System.out.print(sq);
		}
	}
	
	public void password(Farmer users,String nouvel){
		String sql="update farmer set password=? where id_f=?";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			MD5 md = new MD5();
			p.setString(1,md.Encrypt(nouvel));
			p.setInt(2, users.getId_f());
			p.executeUpdate();
		}catch(SQLException sq){
			System.out.print(sq);
		}
	}
	
	public int deleteFarmer(int c)
	{
		String sql="Delete from farmer where id_f=?";
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
