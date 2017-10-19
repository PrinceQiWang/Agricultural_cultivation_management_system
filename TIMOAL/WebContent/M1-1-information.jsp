<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="tool.*"%>
<%@ page import="clas.*,Dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type"  />
<title>我的信息</title>
<link rel="stylesheet" rev="stylesheet" href="css/style.css " type="text/css" media="all" />
<script type="text/javascript" src="Js/typem.js"></script>
<script type="text/javascript" src="Js/js.js"></script>
<style type="text/css">
<!--
.atten {font-size:12px;font-weight:normal;color:#F00;}
-->
</style>
</head>
<body class="ContentBody">
<% Manager m=(Manager)session.getAttribute("manager"); %>
<form name="userForm" method="post" action="user.do?action=adduser" onSubmit="return userValidate();">
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >我的信息</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table width="90%" border="0" cellpadding="0" cellspacing="0" style="width:80%" align="center">
		
		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>我的信息</legend>
				<table width="100%" border="0" cellpadding="2" cellspacing="1" style="width:100%">
					<tr>
						<td nowrap align="right" width="9%">id：</td>
						<td width="36%">
						<input name="id" type="text" class="input" value="<%= m.getId_m()%>"/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">账号：</div></td>
				   		<td width="43%">
				   		<input name=" " type="text" class="input" value="<%= m.getId()%>"/>
				      	<span class="red">*</span>
				    </tr>
					<tr>
						<td nowrap align="right" width="9%">用户列表权限：</td>
						<td width="36%">
						<input name="aou" type="text" class="input"  value="<%= m.getAou()==1?"有":"无"%>"/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">产品信息权限：</div></td>
				   		<td width="43%">
				   		<input name="aop" type="text" class="input" value="<%= m.getAou()==1?"有":"无"%>" />
				      	<span class="red">*</span>
				    </tr>
				</table>
			 		 <br />
				</fieldset>
				</TD>
			
		</TR>
		</TABLE>
	 </td>
  </tr>
		<TR>
			<TD colspan="2" align="center" height="50px">
			<input name="提交" type="submit" class="button" value="保存"/>　
			
			<input name="重置" type="reset" class="button" value="重置"/></TD>
		</TR>
		</TABLE>
</div>
</form>
</body>
</html>

