<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="tool.*"%>
<%@ page import="clas.Farmer"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>农户管理</title>
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
		<th class="tablestyle_title" >农户管理</th>
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
				<td height="22" colspan="13" align="center" style="font-size:16px">农户管理表</td>
				</tr>
				<tr bgcolor="#EEEEEE">
				<td width="10%" align="center" height="30">账号</td>			
				<td width="15%" align="center" >身份证号</td>
				<td width="10%" align="center" >姓名</td>
				<td width="10%" align="center" >联系电话</td>
				<td width="15%" align="center" >邮箱</td>
				<td width="20%" align="center" >地址</td>
				<td width="10%" align="center" >农户组</td>
				<td width="10%" align="center" >选项</td>
				</tr>
	
				<% 
				ArrayList<Farmer> list=(ArrayList<Farmer>)session.getAttribute("farmerlist");
				if(list!=null){
					for(Farmer u:list){
				%>
					<tr bgcolor="#FFFFFF">
					<td height="22" align="center" ><%=u.getId_f() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getId() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getName() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getTelephone() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getEmail() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getAddress() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getGroup() %>&nbsp;</td>
					<td height="22" align="center" ><a href="Farmer?action=selectuser&id=<%=u.getId()%>">修改</a>&nbsp;&nbsp;</td>
					</tr>
				<%}
				}
				else{
				%>
				<tr>
				<td height="22" colspan="7" align="center" >目前没有农户管理记录！</td>
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
<form name="FarmerForm" method="post"  onSubmit="return userValidate();">
<div class="MainDiv">
<% Farmer f=(Farmer)session.getAttribute("farmer");
if(f!=null){
%>
  	<tr>
    <td class="CPanel">
		<table width="90%" border="0" cellpadding="0" cellspacing="0" style="width:80%" align="center">
		<TR>
		<TD width="100%">
			<fieldset style="height:100%;">
			<legend>农户信息</legend>
				<table width="100%" border="0" cellpadding="2" cellspacing="1" style="width:100%">
					
					<tr>
						<td nowrap align="right" width="9%">账号：</td>
						<td width="36%">
						<input name="id_f" type="text" class="input" id="id_f" value="<%=f.getId_f() %>"/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">密码：</div></td>
				   		<td width="43%">
				   		<input name="password" type="text" class="input" id="password" value="<%=f.getPassword() %>"/>
				      	<span class="red">*</span>
				    </tr>
					<tr>
						<td nowrap align="right" width="9%">身份证号：</td>
						<td width="36%">
						<input name="id" type="text" class="input" id="id" value="<%=f.getId() %>"/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">姓名：</div></td>
				   		<td width="43%">
				   		<input name="name" type="text" class="input" id="name" value="<%=f.getName() %>"/>
				      	<span class="red">*</span>
				    </tr>
					<tr>
						<td nowrap align="right" width="9%">联系电话：</td>
						<td width="36%">
						<input name="telephone" type="text" class="input" id="telephone" value="<%=f.getTelephone() %>"/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">邮箱：</div></td>
				   		<td width="43%">
				   		<input name="email" type="text" class="input" id="email" value="<%=f.getEmail() %>"/>
				      	<span class="red">*</span>
				      	<td nowrap align="right" width="9%">农户组：</td>
						<td width="36%">
						<input name="groupe" type="text" class="input" id="groupe" value="<%=f.getGroup() %>"/>
						<span class="red">*</span></td>
				    </tr>
					<tr>
						<td nowrap align="right">地址：</td>
						<td colspan="3">
						<textarea name="address" cols="70" rows="1" class="input" id="content"><%=f.getAddress() %></textarea><span class="red">*</span></td>
						
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
		<input name="增加" type="submit" class="button" onclick="M2-1-farmer.jsp" value="增加"/>　
		<input name="修改" type="submit" class="button" onclick="Farmer?action=update&user=<%=f.getId_f() %>" value="修改"/>　
		<input name="删除" type="submit" class="button" onclick="Farmer?action=deleteuser&id=<%=f.getId_f() %>" value="删除"/>
		<input name="清空" type="reset" class="button" value="清空"/></TD>
	</TR>
		<%} %>
</div>
</form>
</TABLE>

<!-- ****************************************************************************************** -->
</body>
	
</html>

