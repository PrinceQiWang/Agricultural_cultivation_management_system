<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="tool.*"%>
<%@ page import="clas.*,clas.Animal,Dao.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>免疫接种</title>
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
<form name="userForm" method="post" action="Vaccinum?action=add&user=${sessionScope.farmer.id_f}" onSubmit="return userValidate();">
<div class="MainDiv">

<tr>
    <td class="CPanel">
		<table width="90%" border="0" cellpadding="0" cellspacing="0" style="width:80%" align="center">
		<TR>
		<TD width="100%">
			<fieldset style="height:100%;">
			<legend>免疫接种信息</legend>
				<table width="100%" border="0" cellpadding="2" cellspacing="1" style="width:100%">
					
					<tr>
						<td nowrap align="right" width="9%">前次时间：</td>
						<td width="36%">
						<input name="last" type="text" class="input"">
						<span class="red">*</span>
						
						</td>
				   		<td nowrap align="right" width="9%">本次时间：</td>
						<td width="36%">
						<input name="now" type="text" class="input"">
						<span class="red">*</span></td>
				    </tr>
				    <tr>
						<td nowrap align="right" width="9%">免疫次数：</td>
						<td width="36%">
						<input name="time" type="text" class="input" />
						<span class="red">*</span></td>
					<tr>
				    <tr>
						<td nowrap align="right" width="9%">栋号：</td>
						<td width="36%">
						<input name="building" type="text" class="input"/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">栏号：</div></td>
				   		<td width="43%">
				   		<input name="fence" type="text" class="input"/>
				      	<span class="red">*</span></tr>
					<tr>
					 <tr>
						<td nowrap align="right" width="9%">猪只数量：</td>
						<td width="36%">
						<input name="number" type="text" class="input"/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">日龄：</div></td>
				   		<td width="43%">
				   		<input name="age" type="text" class="input" />
				      	<span class="red">*</span></tr>
					<tr>
					<tr>
						<td nowrap align="right" width="9%">预防疾病：</td>
						<td width="36%">
						<select name="disease" style="width: 150px; ">  
   					<%	
   						
   						ArrayList<Code> code=new CodeDao().listCode("disease"); 
   						 for(Code c:code){
   					%> 
      				  <option value="<%=c.getId()%>"  ><%=c.getNom() %></option>  
      				  
    				<%} %>
  						</select>  
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">选用疫苗：</div></td>
				   		<td width="43%">
				   	<select name="vaccinum" style="width: 150px; ">  
   					<%	
   						
   						ArrayList<Code> code1=new CodeDao().listCode("vaccine"); 
   						 for(Code c:code1){
   					%> 
      				  <option value="<%=c.getId()%>"  ><%=c.getNom() %></option>  
      				  
    				<%} %>
  						</select>  <span class="red">*</span>
				    </tr>
						
					</tr>
					<tr>
						<td nowrap align="right" width="9%">剂量：</td>
						<td width="36%">
						<input name="dosage" type="text" class="input"/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">途径：</div></td>
				   		<td width="43%">
							<select name="way_v" style="width: 150px; ">  
   					<%	
   						
   						ArrayList<Code> code2=new CodeDao().listCode("way_v"); 
   						 for(Code c:code2){
   					%> 
      				  <option value="<%=c.getId()%>"  ><%=c.getNom() %></option>  
      				  
    				<%} %>
  						</select> 
						<span class="red">*</span></tr>
					</tr>
					<tr>
						<td nowrap align="right">反应情况：</td>
						<td colspan="3">
						<textarea name="reaction" cols="90" rows="1" class="input" id="content"></textarea></td>
					</tr>
					<tr>
					    
						<td nowrap align="right" width="9%">执行人员：</td>
						<td width="36%">
						<input name="executant" type="text" class="input"/>
						<span class="red">*</span>	
						
						<td nowrap align="right" width="9%">备注：</td>
						<td width="36%">
						<input name="remarks" type="text" class="input"/>
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
		<input name="增加" type="submit" class="button" value="增加"/>　
		<input name="清空" type="reset" class="button" value="清空"/></TD>
	</TR>
		
</div>
</form>
</TABLE>

<!-- ****************************************************************************************** -->
</body>
	
</html>

