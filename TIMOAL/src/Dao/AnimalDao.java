package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import clas.Animal;
import clas.Code;
import clas.Kind;


public class AnimalDao extends BaseDao{
	Connection con=getConnection();
	Connection conn=getConnection();
	public int addAnimal(Animal j){
		java.util.Date date=new java.util.Date();
		String sql="insert into animal(id_a,type_a,type_v,fence,building,id_f,source,date,date_i) values(?,?,?,?,?,?,?,?,?)";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,j.getId_a());
			p.setInt(2,1);
			p.setInt(3,j.getType_v());
			p.setInt(4,j.getFence());
			p.setInt(5,j.getBuilding());
			p.setInt(6,j.getId_f());
			p.setString(7,j.getSource());
			Date d=j.getDate();
			p.setDate(8,new java.sql.Date(d.getYear(),d.getMonth(),d.getDate()));
			p.setDate(9,new java.sql.Date(date.getYear(),date.getMonth(),date.getDate()));
			p.executeUpdate();

		}catch(SQLException sq){
			System.out.print(sq);
		}
		return -1;
	}

	public ArrayList<Animal> listAnimal(int id_f,int building,int fence){
		 ArrayList<Animal> list=new ArrayList<Animal>();
			String sql="Select * from animal where id_f="+id_f;
			if(building!=-1)
			{
				sql=sql+" and building="+building;
			}
			if(fence!=-1)
			{
				sql=sql+" and fence="+fence;
			}
			try{
				PreparedStatement p=con.prepareStatement(sql);
				ResultSet rs=p.executeQuery();
				while( rs.next()){
				Animal j=new Animal();
				j.setId(Integer.parseInt(rs.getString("id")));
				j.setId_a(Integer.parseInt(rs.getString("id_a")));
				j.setType_a(Integer.parseInt(rs.getString("type_a")));
				j.setType_v(Integer.parseInt(rs.getString("type_v")));
				j.setFence(Integer.parseInt(rs.getString("fence")));
				j.setBuilding(Integer.parseInt(rs.getString("building")));
				j.setId_f(Integer.parseInt(rs.getString("id_f")));
				j.setSource(rs.getString("source"));
				Date d=rs.getDate("date");
				j.setDate(d);
				Date d_i=rs.getDate("date_i");
				j.setDate_i(d_i);
				j.setId_m(Integer.parseInt(rs.getString("id_m")));		
				list.add(j);
				}
				 return list;		
			}catch(SQLException sq){
				System.out.print(sq);
				return null;
			}
		   
	}

	public Animal loadAnimal(int id){
		String sql="Select * from animal where id=?";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,id);
	
			ResultSet rs=p.executeQuery();
			 rs.next();
			Animal j=new Animal();
			j.setId(Integer.parseInt(rs.getString("id")));
			j.setId_a(Integer.parseInt(rs.getString("id_a")));
			j.setType_a(Integer.parseInt(rs.getString("type_a")));
			j.setType_v(Integer.parseInt(rs.getString("type_v")));
			j.setFence(Integer.parseInt(rs.getString("fence")));
			j.setBuilding(Integer.parseInt(rs.getString("building")));
			j.setId_f(Integer.parseInt(rs.getString("id_f")));
			j.setSource(rs.getString("source"));
			Date d=rs.getDate("date");
			j.setDate(d);
			Date d_i=rs.getDate("date_i");
			j.setDate_i(d_i);
			j.setId_m(Integer.parseInt(rs.getString("id_m")));
			
			return j;
		}catch(SQLException sq){
			System.out.print(sq);
			return null;
		}
	}

	public int deleteAnimal(int j){
		String sql="Delete from animal where id=?";
		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,j);
			return p.executeUpdate();
		}catch(SQLException sq){
			System.out.print(sq);
		}
		return -1;
	}

    public void updateAnimal(Animal a){
          
        String sql="update animal set id_a=?,type_a=?,type_v=?,fence=?,building=?,source=?,date=?,id_m=? where id=?";

		try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1, a.getId_a());
			p.setInt(2,a.getType_a());
			p.setInt(3,a.getType_v());
			p.setInt(4,a.getFence());
			p.setInt(5,a.getBuilding());
			//p.setInt(6,a.getId_f());
			p.setString(6,a.getSource());
			Date d=a.getDate();
			p.setDate(7,new java.sql.Date(d.getYear(),d.getMonth(),d.getDate()));
			p.setInt(8,a.getId_m());
			p.setInt(9,a.getId());
			p.executeUpdate();
		}catch(SQLException sq){
			System.out.print(sq);
		}
    }
    public ArrayList<Code> building(int id_f){
    	 ArrayList<Code> list=new ArrayList<Code>();
    	String sql="select building from animal where id_f=? group by building";
    	try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,id_f);
			ResultSet rs=p.executeQuery();
			while(rs.next())
			{
				Code c=new Code();	
				c.setNom(rs.getString("building"));
				c.setId(Integer.parseInt(c.getNom()));
				list.add(c);
			}
			return list;
		}catch(SQLException sq){
			System.out.print(sq);
		}
    	return null;
    }
    
    public ArrayList<Code> fence(int id_f){
   	 ArrayList<Code> list=new ArrayList<Code>();
   	String sql="select fence from animal where id_f=? group by fence";
   	try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,id_f);
			ResultSet rs=p.executeQuery();
			while(rs.next())
			{
				Code c=new Code();	
				c.setNom(rs.getString("fence"));
				c.setId(Integer.parseInt(c.getNom()));
				list.add(c);
			}
			return list;
		}catch(SQLException sq){
			System.out.print(sq);
		}
   	return null;
   }
    
    
    public ArrayList<Code> id_a(int id_f){
      	 ArrayList<Code> list=new ArrayList<Code>();
      	String sql="select id_a from animal where id_f=? group by id_a";
      	try{
   			PreparedStatement p=con.prepareStatement(sql);
   			p.setInt(1,id_f);
   			ResultSet rs=p.executeQuery();
   			while(rs.next())
   			{
   				Code c=new Code();	
   				c.setNom(rs.getString("id_a"));
   				c.setId(Integer.parseInt(c.getNom()));
   				list.add(c);
   			}
   			return list;
   		}catch(SQLException sq){
   			System.out.print(sq);
   		}
      	return null;
      }
    
    public ArrayList<Kind> count(int id_f){
    	ArrayList<Kind> list=new ArrayList<Kind>();
    	String sql="select building,sum(1) num from animal where id_f=? group by building order by building";
    	try{
			PreparedStatement p=con.prepareStatement(sql);
			p.setInt(1,id_f);
			ResultSet rs=p.executeQuery();
			while(rs.next())
			{
				Kind k=new Kind();
				k.setN(Integer.parseInt(rs.getString("building")));
				k.setA(Integer.parseInt(rs.getString("num")));	
				PreparedStatement ps=conn.prepareStatement("select sum(1) coun from animal where id_f=? and building=?");
				ps.setInt(1,id_f);
				ps.setInt(2,k.getN());
				ResultSet r=ps.executeQuery();
				r.next();
				k.setB(Integer.parseInt(r.getString("coun")));
				System.out.println(k.getN());
				System.out.println(k.getA());
				System.out.println(k.getB());
				list.add(k);
			}
			return list;
		}catch(SQLException sq){
			System.out.print(sq);
		}
    	return null;
    }
}
