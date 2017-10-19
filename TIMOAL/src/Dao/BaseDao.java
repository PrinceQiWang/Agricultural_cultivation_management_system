package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
public class BaseDao {
public Connection getConnection(){
String username="root";
String password="wzq95617";
String driver="com.mysql.jdbc.Driver";
String url="jdbc:mysql://localhost:3306/timoal";
try{
Class.forName(driver);
return DriverManager.getConnection(url,username,password);
}catch(Exception e){
System.out.print(e);
}
return null;
}
public static void main(String[] args){
Connection conn=new BaseDao().getConnection();
System.out.print(conn);
}
}