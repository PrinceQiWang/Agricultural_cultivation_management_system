package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDao extends BaseDao{
	Connection con=getConnection();
	public int login(String id,String pwd,boolean f)
	{String sql;
		if(f==true)//是管理员
		 sql="SELECT id_m from manager where id=? and password=?";
		else
			sql="SELECT id_f from farmer where id=? and password=?";
	        try{
				PreparedStatement p=con.prepareStatement(sql);
				p.setString(1,id);
				p.setString(2,pwd);
				 ResultSet rs=p.executeQuery();
			        if (rs.next()) {
			        	if(f==true)
			        	return Integer.parseInt(rs.getString("id_m"));
			        	else
			        		return Integer.parseInt(rs.getString("id_f"));
			        }
			}catch(SQLException sq){
				System.out.print(sq);
			}
	        return -1;
	}
}
