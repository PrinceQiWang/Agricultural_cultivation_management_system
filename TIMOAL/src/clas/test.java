package clas;

import servlet.MD5;

public class test {
String str="admin";
public test(){
	MD5 md = new MD5();
	str = md.Encrypt(str);
	System.out.println(str);
	str = md.Encrypt(str);
	System.out.println(str);
	
}
public static void main(String[] args){
	
	test t=new test();
}

}
