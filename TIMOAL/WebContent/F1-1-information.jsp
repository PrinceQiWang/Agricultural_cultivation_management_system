<%@ page contentType="text/html; charset=utf-8" import="java.util.*,clas.Code,Dao.CodeDao,clas.Farmer" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
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
<%
	Farmer f=(Farmer)session.getAttribute("farmer");
 %>
<form name="userForm" method="post" action="Farmer?action=update&user=<%=f.getId_f()%>" onSubmit="return userValidate();">
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
						<td nowrap align="right" width="9%">身份证号：</td>
						<td width="36%">
						<input name="id" type="text" class="input" id="username" value="${sessionScope.farmer.id}"/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">姓名：</div></td>
				   		<td width="43%">
				   		<input name="name" type="text" class="input" id="name" value="${sessionScope.farmer.name}"/>
				      	<span class="red">*</span>
				    </tr>
					
					<tr>
						<td nowrap align="right" width="9%">联系电话：</td>
						<td width="36%">
						<input name="telephone" type="text" class="input" value="${sessionScope.farmer.telephone}"/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">邮箱：</div></td>
				   		<td width="43%">
				   		<input name="email" type="text" class="input" value="${sessionScope.farmer.email}"/>
				      	<span class="red">*</span>
				    </tr>
				    <tr>
				    <td nowrap align="right" width="9%">所在区域：</td>
				    <td>
				    
				    <select name=group style="width: 150px; ">  
   					<%	
   						int i=f.getGroup();
   						ArrayList<Code> code=new CodeDao().listCode("groupe"); 
   						 for(Code c:code){
   					%> 
      				  <option value="<%=c.getId()%>" <% if(c.getId()==i) {%>selected <%} %> ><%=c.getNom() %></option>  
      				  
    				<%} %>
  						</select>  </td>
				    </tr>
					<tr>
						<td nowrap align="right">地址：</td>
						<td colspan="3">
						<textarea  name="address" cols="70" rows="1" class="input" id="content" style="height: 89px; ">${sessionScope.farmer.address}</textarea><span class="red">*</span></td>
						
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

