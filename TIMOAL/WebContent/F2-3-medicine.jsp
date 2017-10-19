<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="tool.*"%>
<%@ page import="clas.Clean,clas.Farmer,clas.Code,Dao.CodeDao,Dao.AnimalDao"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>兽药使用</title>
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
<form name="userForm" method="post" action="Medicine?action=add&user=${sessionScope.farmer.id_f}" onSubmit="return userValidate();">
<div class="MainDiv">

  	<tr>
    <td class="CPanel">
		<table width="90%" border="0" cellpadding="0" cellspacing="0" style="width:80%" align="center">
		<TR>
		<TD width="100%">
			<fieldset style="height:100%;">
			<legend>兽药使用信息</legend>
				<table width="100%" border="0" cellpadding="2" cellspacing="1" style="width:100%">
					
					<tr>
						<td nowrap align="right" width="9%">用药时间：</td>
						<td width="36%">
						<select id="year"  name="year">
							<option value="0">----年</option>
							<option value="2016">2016年</option>
							<option value="2017">2017年</option>
							<option value="2018">2018年</option>
							<option value="2019">2019年</option>
							<option value="2020">2020年</option>
							<option value="2021">2021年</option>
							<option value="2022">2022年</option>
							<option value="2023">2023年</option>
							<option value="2024">2024年</option>
							<option value="2025">2025年</option>
						</select>
						<select id="month"  name="month">
							<option value="0">--月</option>
							<option value="1">01月</option>
							<option value="2">02月</option>
							<option value="3">03月</option>
							<option value="4">04月</option>
							<option value="5">05月</option>
							<option value="6">06月</option>
							<option value="7">07月</option>
							<option value="8">08月</option>
							<option value="9">09月</option>
							<option value="10">10月</option>
							<option value="11">11月</option>
							<option value="12">12月</option>
						</select>
						<select id="day"  name="day">
							<option value="0">--日</option>
							<option value="1">01日</option>
							<option value="2">02日</option>
							<option value="3">03日</option>
							<option value="4">04日</option>
							<option value="5">05日</option>
							<option value="6">06日</option>
							<option value="7">07日</option>
							<option value="8">08日</option>
							<option value="9">09日</option>
							<option value="10">10日</option>
							<option value="11">11日</option>
							<option value="12">12日</option>
							<option value="13">13日</option>
							<option value="14">14日</option>
							<option value="15">15日</option>
							<option value="16">16日</option>
							<option value="17">17日</option>
							<option value="18">18日</option>
							<option value="19">19日</option>
							<option value="20">20日</option>
							<option value="21">21日</option>
							<option value="22">22日</option>
							<option value="23">23日</option>
							<option value="24">24日</option>
							<option value="25">25日</option>
							<option value="26">26日</option>
							<option value="27">27日</option>
							<option value="28">28日</option>
							<option value="29">29日</option>
							<option value="30">30日</option>
							<option value="31">31日</option>
						</select>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">休药期：</div></td>
				   		<td width="43%">
				   		<input name="time_r" type="text" class="input" />
				      	<span class="red">*</span>
				    </tr>
				    <tr>
						<td nowrap align="right" width="9%">栋号：</td>
						<td width="36%">
						<select name="building" style="width: 150px; ">  
   					<%	
						AnimalDao dao=new AnimalDao();
   						ArrayList<Code> code=dao.building(f.getId_f()); 
   						for(Code c:code){
   					%> 
      				  <option value="<%=c.getId()%>" > <%=c.getNom() %></option>  
      				  
    				<%} %>
  						  </select> <span class="red">*</span> </td></td>
				   		<td width="12%"><div align="right">栏号：</div></td>
				   		<td width="43%">
				   		<select name=fence style="width: 150px; ">  
   					<%	
   						ArrayList<Code> code1=dao.fence(f.getId_f()); 
   						for(Code c:code1){
   					%> 
      				  <option value="<%=c.getId()%>" > <%=c.getNom() %></option>  
      				  
    				<%} %>
  						  </select> <span class="red">*</span> </tr>
					<tr>
					 <tr>
						<td nowrap align="right" width="9%">耳号：</td>
						<td width="36%">
						<select name="id_a"style="width: 150px; ">  
   					<%	
   						ArrayList<Code> code3=dao.id_a(f.getId_f()); 
   						for(Code c:code3){
   					%> 
      				  <option value="<%=c.getId()%>" > <%=c.getNom() %></option>  
      				  
    				<%} %>
  						  </select> 
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">日龄：</div></td>
				   		<td width="43%">
				   		<input name="age" type="text" class="input"  />
				      	<span class="red">*</span></tr>
					<tr>
					<tr>
						<td nowrap align="right" width="9%">猪只症状：</td>
						<td width="36%">
						<input name="symptom" type="text" class="input"  />
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">所用药品：</div></td>
				   		<td width="43%">
				   		<select name="medicine" style="width: 150px; ">  
   					<%	
   						
   						ArrayList<Code> code4=new CodeDao().listCode("name"); 
   						 for(Code c:code4){
   					%> 
      				  <option value="<%=c.getId()%>"  ><%=c.getNom() %></option>  
      				  
    				<%} %>
  						</select>  
				      	<span class="red">*</span></tr>
						
					</tr>
					<tr>
						<td nowrap align="right" width="9%">剂量：</td>
						<td width="36%">
						<input name="dosage" type="text" class="input" />
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">途径：</div></td>
				   		<td width="43%">
						<select name="way_m" style="width: 150px; ">  
   					<%	
   						
   						ArrayList<Code> code5=new CodeDao().listCode("way_m"); 
   						 for(Code c:code5){
   					%> 
      				  <option value="<%=c.getId()%>"  ><%=c.getNom() %></option>  
      				  
    				<%} %>
  						</select>  
						<span class="red">*</span></tr>
					</tr>
					<tr>
						<td nowrap align="right">治疗效果：</td>
						<td colspan="3">
						<textarea name="effect" cols="90" rows="1" class="input" id="content"></textarea></td>
					</tr>
					<tr>
						<td nowrap align="right" width="9%">执行人员：</td>
						<td width="36%">
						<input name="executant" type="text" class="input" id="username"/>
						<span class="red">*</span></tr>
				   		
					</tr>
					
					<tr>
						<td nowrap align="right">备注：</td>
						<td colspan="3">
						<textarea name="content" cols="90" rows="5" class="input" id="content"></textarea></td>
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

