<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="tool.*"%>
<%@ page import="clas.*,Dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type"/>
<title>通州区猪只养殖质量安全管理系统</title>

<link rel="stylesheet" rev="stylesheet" href="css/style.css " type="text/css" media="all" />
<script type="text/javascript" src="Js/typem.js"></script>
<script type="text/javascript" src="Js/js.js"></script>
<style type="text/css">
<!--
.atten {font-size:12px;font-weight:normal;color:#F00;}
-->
</style>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->

</style>
<link href="css/css.css" rel="stylesheet" type="text/css" />

<style type="text/css">
<!--
.STYLE1 {
	font-size: 36px;
	color: #009999;
	font-family: "方正舒体";
}
-->
</style>

</head>

<body>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="147" background="images/top02.gif"><div align="center"><span class="STYLE1">通州区猪只养殖质量安全管理系统</span></div></td>
  </tr>
</table>

<table width="562" border="0" align="center" cellpadding="0" cellspacing="0" class="right-table03">
  <tr>
    <td width="221"><table width="95%" border="0" cellpadding="0" cellspacing="0" class="login-text01">
      
     
    
    </table></td>
<!-- ************************************************************************************* -->     
<table>
<form name="userForm" method="post" action="Sign" onSubmit="return userValidate();">
<div class="MainDiv">
<table width="60%" align="center" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title">新用户注册</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table width="90%" border="0" cellpadding="0" cellspacing="0" style="width:80%" align="center">
		
		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>用户信息</legend>
				<table width="100%" border="0" cellpadding="2" cellspacing="1" style="width:100%">
					<tr>
						<td nowrap align="right" width="10%">身份证号：</td>
						<td width="40%">
						<input name="id" type="text" class="input" />
						<span class="red">*</span></td>
				   		<td width="10%"><div align="right">姓名：</div></td>
				   		<td width="40%">
				   		<input name="name" type="text" class="input" />
				      	<span class="red">*</span>
				    </tr>
					<tr>
						<td><div align="right">用户组：</div></td>
						<td >
						  <select name=group style="width: 150px; ">  
   					<%	
   					
   						ArrayList<Code> code=new CodeDao().listCode("groupe"); 
   						 for(Code c:code){
   					%> 
      				  <option value="<%=c.getId()%>" ><%=c.getNom() %></option>  
      				  
    				<%} %>
  						</select>  
						<span class="red">*</span>
						</td>
					</tr>
					<tr>
						<td nowrap align="right" width="9%">联系电话：</td>
						<td width="36%">
						<input name="telephone" type="text" class="input" id="username"/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">邮箱：</div></td>
				   		<td width="43%">
				   		<input name="email" type="text" class="input" id="password" />
				      	<span class="red">*</span>
				    </tr>
					<tr>
						<td nowrap align="right">地址：</td>
						<td colspan="3">
						<textarea name="address" cols="60" rows="1" class="input" id="content"></textarea><span class="red">*</span></td>
						
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
			<input name="注册" type="submit" class="button" value="注册"/>　
			<input name="重置" type="reset" class="button" value="重置"/>
			<input name="返回" type="button" class="button" onclick="javascrtpt:window.location.href='U1-1-welcome.jsp'" value="返回"/></TD>
		</TR>
		</TABLE>
</div>
</form>
</table>
<!-- ************************************************************************************* -->  
  </tr>
</table>

</body>
</html>