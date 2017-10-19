package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import clas.Code;


public class CodeDao extends BaseDao{
	Connection con=getConnection();
	public String getType(int i,String type)
	{
		String sql="select nom from "+type+" where id=?";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,i);
			ResultSet rs=p.executeQuery();
			rs.next();
			return rs.getString("nom");
			
		}catch(SQLException sq){
			System.out.print(sq);
		}
		return null;
	}
	
	public ArrayList<Code> listCode(String type){
		 ArrayList<Code> list=new ArrayList<Code>();
			String sql="Select * from "+type;
			try{
				PreparedStatement p=con.prepareStatement(sql);
				ResultSet rs=p.executeQuery();
				while( rs.next()){
				Code c=new Code();
				c.setId(Integer.parseInt(rs.getString("id")));
				c.setNom(rs.getString("nom"));
				list.add(c);
				}
				 return list;		//∑µªÿ¡–±Ì
			}catch(SQLException sq){
				System.out.print(sq);
				return null;
			}
		   
	}
}
