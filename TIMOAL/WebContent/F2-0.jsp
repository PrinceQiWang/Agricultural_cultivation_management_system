<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="tool.*"%>
<%@ page import="clas.Animal,clas.Code,clas.Farmer" import="Dao.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>猪只管理</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.tabfont01 {	
	font-family: "宋体";
	font-size: 9px;
	color: #555555;
	text-decoration: none;
	text-align: center;
}
.font051 {font-family: "宋体";
	font-size: 12px;
	color: #333333;
	text-decoration: none;
	line-height: 20px;
}
.font201 {font-family: "宋体";
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}
.button {
	font-family: "宋体";
	font-size: 14px;
	height: 37px;
}
html { overflow-x: auto; overflow-y: auto; border:0;} 
-->
</style>

<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">

</script>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
  
  <body>
 	<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
		<tr>
		<td height="30">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				<td height="62" background="images/nav04.gif">&nbsp;</td>
				</tr>
			</table>
		</td>
		</tr>
	<form name="listform" method="post" action="Animal?action=list&user=${sessionScope.farmer.id_f}">
	<table width="99%"  border="0" cellpadding="0" cellspacing="0" class="CContent">
 	<tr>
		<th class="tablestyle_title" >猪只管理</th>
	</tr>
		
	<tr>
	<td>
		<table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
		<td>
			<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
			<td height="20"></td>
			</tr>
			<tr>
			<td height="40" class="font42">
				<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
				<tr class="CTitle" >
				<td height="22" colspan="13" align="center" style="font-size:16px">猪只管理记录表</td>
				</tr>
				<tr bgcolor="#EEEEEE">
				<td width="10%" align="center" height="30">入栏日期</td>			
				<td width="10%" align="center" >栋号</td>
				<td width="10%" align="center" >栏号</td>
				<td width="10%" align="center" >耳号</td>
				<td width="10%" align="center" >种类</td>
				<td width="15%" align="center" >来源</td>
				<td width="15%" align="center" >录入时间</td>
				</tr>
	
				<% 
				Farmer f=(Farmer)session.getAttribute("farmer");
				ArrayList<Animal> list=(ArrayList<Animal>)session.getAttribute("list");
				if(list!=null){
					for(Animal u:list){
				%>
					<tr bgcolor="#FFFFFF">
					<td height="22" align="center" ><%=StringUtil.notNull(DateUtil.parseToString(u.getDate(),DateUtil.yyyyMMdd))%>&nbsp;</td>
					<td height="22" align="center" ><%=u.getBuilding() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getFence() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getId_a() %>&nbsp;</td>
					<td height="22" align="center" ><%=new CodeDao().getType(u.getType_v(),"type_v")%>&nbsp;</td>
					<td height="22" align="center" ><%=u.getSource() %>&nbsp;</td>
					<td height="22" align="center" ><%=StringUtil.notNull(DateUtil.parseToString(u.getDate_i(),DateUtil.yyyyMMdd))%>&nbsp;</td>
					<td height="22" align="center" ><a href="Animal?action=detail&id=<%=u.getId()%>">修改</a>&nbsp;<a href="Animal?action=delete&id=<%=u.getId()%>&user=<%= f.getId_f() %>">删除</a></td>
					</tr>
				<%}
				}
				else{
				%>
				<tr>
				<td height="22" colspan="7" align="center" >目前没有猪只管理记录！</td>
				</tr>
				<%}%>
	
				</table>
			</td>
			</tr>
			</table>
			
			<table width="90%" border="0" cellpadding="0" cellspacing="0" style="width:80%" align="center">
			<tr><td>
			<table width="50%" border="0" align="right" cellpadding="0" cellspacing="0">
			<tr>
						<td nowrap align="right" width="9%">栋号：</td>
						<td width="36%">
						<select name=building style="width: 150px; ">  
						<option value="-1">全部</option>
   					<%	
						AnimalDao dao=new AnimalDao();
   						ArrayList<Code> code=dao.building(f.getId_f()); 
   						for(Code c:code){
   					%> 
      				  <option value="<%=c.getId()%>" > <%=c.getNom() %></option>  
      				  
    				<%} %>
  						  </select>  
  						  
				   		<td width="12%"><div align="right">栏号：</div></td>
				   		<td width="43%">
				   			<select name=fence style="width: 150px; ">  
						<option value="-1">全部</option>
   					<%	
   						ArrayList<Code> code1=dao.fence(f.getId_f()); 
   						for(Code c:code1){
   					%> 
      				  <option value="<%=c.getId()%>" > <%=c.getNom() %></option>  
      				  
    				<%} %>
  						  </select>  
				      	<td><input type="submit" class="right-button01" value="查询" /></td>
				</tr>
				</table>
				</td></tr>
				</table>
			
		</td>
		</tr>
		</td></tr></table></form>
  </body>
</html>
