<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="tool.*"%>
<%@ page import="clas.*,Dao.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>生猪销售</title>
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

     
  
       
        th
        {
            background-color:#7F9DB9; 
            width:160px;
        }
        .oddColor
        {
            background-color:#ccc;
        }
        .evenColor
        {
            background-color:#EEEEEE;
        }
        .overColor
        {
            background-color:#7F9DB9;
        }

html { overflow-x: auto; overflow-y: auto; border:0;} 
-->
</style>

<link href="css/css.css" rel="stylesheet" type="text/css" />

<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>

<!-- ****************************************************************************************** -->

<body>

		<%
  Farmer f=(Farmer)session.getAttribute("farmer");
     
      %>
	
<!-- ****************************************************************************************** -->
<form name="userForm" method="post" action="Sale?action=add&user=${sessionScope.farmer.id_f}" onSubmit="return userValidate();">
<div class="MainDiv">

  	<tr>
    <td class="CPanel">
		<table width="90%" border="0" cellpadding="0" cellspacing="0" style="width:80%" align="center">
		<TR>
		<TD width="100%">
			<fieldset style="height:100%;">
			<legend>生猪销售信息</legend>
				<table width="100%" border="0" cellpadding="2" cellspacing="1" style="width:100%">
					
					<tr>
						<td nowrap align="right" width="9%">销售时间：</td>
						<td width="36%">
						<input name="date_s" type="text" class="input"">
						<span class="red">*</span></td>
				    </tr>
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
						<span class="red">*</span></td>
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
				      	<span class="red">*</span></tr>
					<tr>
					 <tr>
						<td nowrap align="right" width="9%">耳号：</td>
						<td width="36%">
						<select name="id_a" style="width: 150px; ">  
						<option value="-1">全部</option>
   					<%	
   						ArrayList<Code> code2=dao.id_a(f.getId_f()); 
   						for(Code c:code2){
   					%> 
      				  <option value="<%=c.getId()%>" > <%=c.getNom() %></option>  
      				  
    				<%} %>
  						  </select>  
						<span class="red">*</span></td>
					<tr>
						<td nowrap align="right" width="9%">猪只类别：</td>
				   		<td width="43%">
				   		<select name=type_v style="width: 150px; ">  
   					<%	
   						ArrayList<Code> code3=new CodeDao().listCode("type_v"); 
   						 for(Code c:code3){
   					%> 
      				  <option value="<%=c.getId()%>" ><%=c.getNom() %></option>  
      				  
    				<%} %>
  						</select> 
				      	<span class="red">*</span></tr>
				    </tr>
				    <tr>
						<td nowrap align="right" width="9%">销售单价：</td>
						<td width="36%">
						<input name="price" type="text" class="input"/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">销售重量：</div></td>
				   		<td width="43%">
				   		<input name="amount" type="text" class="input"  />
				      	<span class="red">*</span>
				    </tr>
					<tr>
						<td nowrap align="right">销售去向：</td>
						<td colspan="3">
						<textarea name="direction" cols="90" rows="1" class="input" ></textarea></td>
					</tr>
					<tr>
						<td nowrap align="right">检疫结论：</td>
						<td colspan="3">
						<textarea name="conclusion" cols="90" rows="1" class="input" ></textarea></td>
					</tr>
					
						<td nowrap align="right" width="9%">执行人员：</td>
						<td width="36%">
						<input name="executant" type="text" class="input"/>
						<span class="red">*</span></tr>	   		
					</tr>
					<tr>
						<td nowrap align="right">备注：</td>
						<td colspan="3">
						<textarea name="remarks" cols="90" rows="5" class="input"></textarea></td>
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
		<input name="增加" type="submit" class="button" value="增加"/>　
		<input name="清空" type="reset" class="button" value="清空"/></TD>
	</TR>
		
</div>
</form>
</TABLE>

<!-- ****************************************************************************************** -->
</body>
	
</html>

