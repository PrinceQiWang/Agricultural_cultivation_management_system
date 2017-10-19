<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="tool.*"%>
<%@ page import="clas.*,Dao.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
<%
Farmer f=(Farmer)session.getAttribute("farmer");
 %>
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
		<th class="tablestyle_title" >兽药使用</th>
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
				<td height="22" colspan="14" align="center" style="font-size:16px">兽药使用记录表</td>
				</tr>
				<tr bgcolor="#EEEEEE">
				<td width="10%" align="center" height="30">用药时间</td>
				<td width="5%" align="center" >栋号</td>
				<td width="5%" align="center" >栏号</td>
				<td width="5%" align="center" >耳号</td>
				<td width="5%" align="center" >日龄</td>
				<td width="5%" align="center" >猪只症状</td>
				<td width="5%" align="center" >所用药品</td>
				<td width="5%" align="center" >剂量</td>
				<td width="5%" align="center" >途径</td>
				<td width="10%" align="center" >治疗效果</td>
				<td width="10%" align="center" >休药期</td>
				<td width="10%" align="center" >执行人员</td>
				<td width="10%" align="center" >备注</td>
				<td width="10%" align="center" >录入时间</td>
				</tr>
	
				<% 
				ArrayList<Medicine> list=(ArrayList<Medicine>)session.getAttribute("medicinelist");
				if(list!=null){
					for(Medicine u:list){
				%>
					<tr bgcolor="#FFFFFF">
					<td height="22" align="center" ><%=StringUtil.notNull(DateUtil.parseToString(u.getTime(),DateUtil.yyyyMMdd))%>&nbsp;</td>
					<td height="22" align="center" ><%=u.getBuilding() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getFence() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getId_a() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getAge() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getSymptom() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getMedicine() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getDosage() %>&nbsp;</td>
					<td height="22" align="center" ><%=new CodeDao().getType(u.getWay_m(),"way_m") %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getEffect() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getTime_r() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getExecutant() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getRemarks() %>&nbsp;</td>
					<td height="22" align="center" ><%=StringUtil.notNull(DateUtil.parseToString(u.getDate_i(),DateUtil.yyyyMMdd))%>&nbsp;</td>
					<td height="22" align="center" ><a href="Medicine?action=list&user=${sessionScope.farmer.id_f}&id=<%=f.getId() %>">修改</a>&nbsp;&nbsp;</td>
					</tr>
				<%}
				}
				else{
				%>
				<tr>
				<td height="22" colspan="7" align="center" >目前没有兽药使用记录！</td>
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
				      	<td><input type="button" class="right-button01" value="查询" /></td>
				</tr>
				</table>
				</td></tr>
				</table>
			
		</td>
		</tr>
		</table>
	
<!-- ****************************************************************************************** -->
<form name="userForm" method="post" onSubmit="return userValidate();">
<div class="MainDiv">
<% 

Medicine m=(Medicine)session.getAttribute("medicine");
if(m!=null){
%>
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
						<input name="time" type="text" class="input" id="building" value=<%=StringUtil.notNull(DateUtil.parseToString(m.getTime(),DateUtil.yyyyMMdd))%>/>			
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">休药期：</div></td>
				   		<td width="43%">
				   		<input name="time_r" type="text" class="input" id="time" value=<%=m.getTime_r() %>/>
				      	<span class="red">*</span>
				    </tr>
				    <tr>
						<td nowrap align="right" width="9%">栋号：</td>
						<td width="36%">
						<input name="building" type="text" class="input" id="building" value=<%=m.getBuilding() %>/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">栏号：</div></td>
				   		<td width="43%">
				   		<input name="fence" type="text" class="input" id="fence" value=<%=m.getFence() %>/>
				      	<span class="red">*</span></tr>
					<tr>
					 <tr>
						<td nowrap align="right" width="9%">耳号：</td>
						<td width="36%">
						<input name="id_a" type="text" class="input" id="id_a" value=<%=m.getId_a() %>/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">日龄：</div></td>
				   		<td width="43%">
				   		<input name="age" type="text" class="input" id="age" value=<%=m.getAge() %>/>
				      	<span class="red">*</span></tr>
					<tr>
					<tr>
						<td nowrap align="right" width="9%">猪只症状：</td>
						<td width="36%">
						<input name="symptom" type="text" class="input" id="symptom" value=<%=m.getSymptom() %>/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">所用药品：</div></td>
				   		<td width="43%">
				   		<select name="medicine" style="width: 150px; ">  
   					<%	
   						int i=m.getMedicine();
   						ArrayList<Code> code4=new CodeDao().listCode("name"); 
   						 for(Code c:code4){
   					%> 
      				  <option value="<%=c.getId()%>" <% if(c.getId()==i) {%>selected <%} %>  ><%=c.getNom() %></option>  
      				  
    				<%} %>
  						</select>  
				      	<span class="red">*</span></tr>
						
					</tr>
					<tr>
						<td nowrap align="right" width="9%">剂量：</td>
						<td width="36%">
						<input name="dosage" type="text" class="input" id="dosage" value=<%=m.getDosage() %>/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">途径：</div></td>
				   		<td width="43%">
						<select name="way_m" style="width: 150px; ">  
   					<%	
   						int j=m.getWay_m();
   						ArrayList<Code> code5=new CodeDao().listCode("way_m"); 
   						 for(Code c:code5){
   					%> 
      				  <option value="<%=c.getId()%>" <% if(c.getId()==j) {%>selected <%} %>  ><%=c.getNom() %></option>  
      				  
    				<%} %>
  						</select>  
						<span class="red">*</span></tr>
					</tr>
					<tr>
						<td nowrap align="right">治疗效果：</td>
						<td colspan="3">
						<textarea name="effect" cols="90" rows="1" class="input" id="effect"></textarea></td>
					</tr>
					<tr>
					    <td width="12%"><div align="right">录入时间：</div></td>
				   		<td width="43%">
		
				   		<%= StringUtil.notNull(DateUtil.parseToString(m.getDate_i(),DateUtil.yyyyMMdd)) %>
				      </td>
						<td nowrap align="right" width="9%">执行人员：</td>
						<td width="36%">
						<input name="executant" type="text" class="input" id="executant" value=<%=m.getExecutant() %>/>
						<span class="red">*</span></tr>
				   		
					</tr>
					
					<tr>
						<td nowrap align="right">备注：</td>
						<td colspan="3">
						<textarea name="remarks" cols="90" rows="5" class="input" id="remarks"><%=m.getRemarks() %></textarea></td>
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
		<input name="增加" type="button" class="button" onclick="F2-3-medicine.jsp" value="增加"/>　
		<input name="修改" type="button" class="button" onclick="Medicine?action=update&user=<%= f.getId_f()%>" value="修改"/>　
		<input name="删除" type="button" class="button" onclick="Medicine?action=deleteuser&id=<%=f.getId()%>" value="删除"/>
		<input name="清空" type="reset" class="button" value="清空"/></TD>
	</TR>
		<%} %>
</div>
</form>
</TABLE>

<!-- ****************************************************************************************** -->
</body>
	
</html>

