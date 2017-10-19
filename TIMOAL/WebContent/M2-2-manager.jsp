<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="tool.*"%>
<%@ page import="clas.Manager"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>管理员管理</title>
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

<!-- ****************************************************************************************** -->

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
		
	<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
 	<tr>
		<th class="tablestyle_title" >管理员管理</th>
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
				<td height="22" colspan="13" align="center" style="font-size:16px">管理员管理表</td>
				</tr>
				<tr bgcolor="#EEEEEE">
				<td width="25%" align="center" height="30">账号</td>			
				<td width="25%" align="center" >身份证号</td>
				<td width="25%" align="center" >管理用户列表权限</td>
				<td width="25%" align="center" >管理产品信息权限</td>
				</tr>
	
				<% 
				ArrayList<Manager> list=(ArrayList<Manager>)session.getAttribute("managerlist");
				if(list!=null){
					for(Manager u:list){
				%>
					<tr bgcolor="#FFFFFF">
					<td height="22" align="center" ><%=u.getId_m() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getId() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getAou() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getAop() %>&nbsp;</td>
					<td height="22" align="center" ><a href="Manager?action=selectuser&id=<%=u.getId()%>">修改</a>&nbsp;&nbsp;</td>
					</tr>
				<%}
				}
				else{
				%>
				<tr>
				<td height="22" colspan="7" align="center" >目前没有管理员管理记录！</td>
				</tr>
				<%}%>
	
				</table>
			</td>
			</tr>
			</table>
			

			
		</td>
		</tr>
		</table>
	
<!-- ****************************************************************************************** -->
<form name="ManagerForm" method="post"  onSubmit="return userValidate();">
<div class="MainDiv">
<% Manager m=(Manager)session.getAttribute("manager");
if(m!=null){
%>
  	<tr>
    <td class="CPanel">
		<table width="90%" border="0" cellpadding="0" cellspacing="0" style="width:80%" align="center">
		<TR>
		<TD width="100%">
			<fieldset style="height:100%;">
			<legend>管理员信息</legend>
				<table width="100%" border="0" cellpadding="2" cellspacing="1" style="width:100%">
					
					<tr>
						<td nowrap align="right" width="9%">账号：</td>
						<td width="36%">
						<input name="id_m" type="text" class="input" id="id_m" value="<%=m.getId_m() %>"/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">密码：</div></td>
				   		<td width="43%">
				   		<input name="password" type="text" class="input" id="password" value="<%=m.getPassword() %>"/>
				      	<span class="red">*</span>
				    </tr>
					<tr>
						<td nowrap align="right" width="9%">管理用户列表权限：</td>
						<td width="36%">
						<input name="aou" type="text" class="input" id="aou" value="<%=m.getAou() %>"/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">管理产品信息权限：</div></td>
				   		<td width="43%">
				   		<input name="aop" type="text" class="input" id="aop" value="<%=m.getAop() %>"/>
				      	<span class="red">*</span>
				    </tr>
				
				</table><br />
				</fieldset>
				</TD>		
		</TR>
		</TABLE>
	</td>
	</tr>
		
	<TR>
		<TD colspan="4" align="center" height="50px">
		<input name="增加" type="submit" class="button" onclick="M2-2-manager.jsp" value="增加"/>　
		<input name="修改" type="submit" class="button" onclick="Manager?action=update&user=<%=m.getId_m() %>" value="修改"/>　
		<input name="删除" type="submit" class="button" onclick="Manager?action=deleteuser&id=<%=m.getId_m() %>" value="删除"/>
		<input name="清空" type="reset" class="button" value="清空"/></TD>
	</TR>
		<%} %>
</div>
</form>
</TABLE>

<!-- ****************************************************************************************** -->
</body>
	
</html>

