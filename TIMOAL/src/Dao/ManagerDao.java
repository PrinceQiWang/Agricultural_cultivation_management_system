package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import clas.Manager;
import servlet.MD5;

public class ManagerDao extends BaseDao{
	Connection con=getConnection();
	public void addManager(Manager m){
		String sql="insert into manager values(null,?,?,?,?)";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			MD5 md = new MD5();
			p.setString(2,md.Encrypt(m.getId()));
			p.setInt(3,0);
			p.setInt(4,0);
			p.executeUpdate();
			
		}catch(SQLException sq){
			System.out.print(sq);
		}
	}
	
	public Manager loadManager(int id_m){
		String sql="Select * from manager where id_m=?";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,id_m);
			ResultSet rs=p.executeQuery();
			 rs.next();
			Manager m=new Manager();
			m.setId_m(Integer.parseInt(rs.getString("id_m")));
			m.setId(rs.getString("id"));
			m.setPassword(rs.getString("password"));
			m.setAou(rs.getInt("aou"));
			m.setAop(rs.getInt("aop"));
			return m;
		}catch(SQLException sq){
			System.out.print(sq);
			return null;
		}
	}
	public void password(Manager users,String nouvel){
		String sql="update manager set password=? where id_m=?";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			MD5 md = new MD5();
			p.setString(1,md.Encrypt(nouvel));
			p.setInt(2, users.getId_m());
			p.executeUpdate();
		}catch(SQLException sq){
			System.out.print(sq);
		}
	}
	public void updateManager(){
		String sql="update set id=?,password=?,aou=?,aop=?";
	}
	
	
}
