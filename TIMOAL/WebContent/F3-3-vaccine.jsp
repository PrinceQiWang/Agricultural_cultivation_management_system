<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="tool.*"%>
<%@ page import="clas.*,Dao.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
		<th class="tablestyle_title" >免疫接种</th>
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
				<td height="22" colspan="15" align="center" style="font-size:16px">免疫接种记录表</td>
				</tr>
				<tr bgcolor="#EEEEEE">
				<td width="10%" align="center" height="30">前次时间</td>
				<td width="10%" align="center">本次时间</td>
				<td width="5%" align="center">免疫次数</td>
				<td width="5%" align="center" >栋号</td>
				<td width="5%" align="center" >栏号</td>
				<td width="5%" align="center" >猪只数量</td>
				<td width="5%" align="center" >日龄</td>
				<td width="5%" align="center" >预防疾病</td>
				<td width="5%" align="center" >选用疫苗</td>
				<td width="5%" align="center" >剂量</td>
				<td width="5%" align="center" >途径</td>
				<td width="10%" align="center" >反应情况</td>
				<td width="5%" align="center" >执行人员</td>
				<td width="10%" align="center" >备注</td>
				<td width="10%" align="center" >录入时间</td>
				</tr>
	
				<% 
				ArrayList<Vaccinum> list=(ArrayList<Vaccinum>)session.getAttribute("Vaccinumlist");
				if(list!=null){
					for(Vaccinum u:list){
				%>
					<tr bgcolor="#FFFFFF">
					<td height="22" align="center" ><%=StringUtil.notNull(DateUtil.parseToString(u.getLast(),DateUtil.yyyyMMdd))%>&nbsp;</td>
					<td height="22" align="center" ><%=StringUtil.notNull(DateUtil.parseToString(u.getNow(),DateUtil.yyyyMMdd))%>&nbsp;</td>
					<td height="22" align="center" ><%=u.getTime() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getBuilding() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getFence() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getNumber() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getAge() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getDisease() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getExecutant() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getRemarks() %>&nbsp;</td>
					<td height="22" align="center" ><%=StringUtil.notNull(DateUtil.parseToString(u.getDate_i(),DateUtil.yyyyMMdd))%>&nbsp;</td>
					<td height="22" align="center" ><a href="Medicine?action=list&user=${sessionScope.farmer.id_f}&id=<%=u.getId() %>">修改</a>&nbsp;&nbsp;</td>
					</tr>
				<%}
				}
				else{
				%>
				<tr>
				<td height="22" colspan="7" align="center" >目前没有免疫接种记录！</td>
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
<form name="vaccineForm" method="post"  onSubmit="return userValidate();">
<div class="MainDiv">
<% Vaccinum v=(Vaccinum)session.getAttribute("vaccinum");
if(v!=null){
%>
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
						<input name="last"  value="<%=DateUtil.parseToString(v.getLast(),DateUtil.yyyyMMdd)%>"/></td>
				   		<td nowrap align="right" width="9%">本次时间：</td>
						<td width="36%">
						<input name="new"  value="<%=DateUtil.parseToString(v.getNow(),DateUtil.yyyyMMdd)%>"/></td>
				    </tr>
				    <tr>
						<td nowrap align="right" width="9%">免疫次数：</td>
						<td width="36%">
						<input name="time" type="text" class="input" id="time" value=<%=v.getTime() %>/>
						<span class="red">*</span></td>
					<tr>
				    <tr>
						<td nowrap align="right" width="9%">栋号：</td>
						<td width="36%">
						<input name="building" type="text" class="input" id="building" value=<%=v.getBuilding() %>/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">栏号：</div></td>
				   		<td width="43%">
				   		<input name="fence" type="text" class="input" id="fence" value=<%=v.getFence() %>/>
				      	<span class="red">*</span></tr>
					<tr>
					 <tr>
						<td nowrap align="right" width="9%">猪只数量：</td>
						<td width="36%">
						<input name="number" type="text" class="input" id="number" value=<%=v.getNumber() %>/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">日龄：</div></td>
				   		<td width="43%">
				   		<input name="age" type="text" class="input" id="age" value=<%=v.getAge() %>/>
				      	<span class="red">*</span></tr>
					<tr>
					<tr>
						<td nowrap align="right" width="9%">预防疾病：</td>
						<td width="36%">
							<select name="type_a" style="width: 150px; ">  
   					<%	
   						int i=v.getType_a();
   						ArrayList<Code> code=new CodeDao().listCode("type_a"); 
   						 for(Code cd:code){
   					%> 
      				  <option value="<%=cd.getId()%>" <% if(cd.getId()==i) {%>selected <%} %> ><%=cd.getNom() %></option>  
      				  
    				<%} %>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">选用疫苗：</div></td>
				   		<td width="43%">
				   		<select name="disease" style="width: 150px; ">  
   					<%	
   						int j=v.getDisease();
   						ArrayList<Code> code5=new CodeDao().listCode("disease"); 
   						 for(Code c:code5){
   					%> 
      				  <option value="<%=c.getId()%>" <% if(c.getId()==j) {%>selected <%} %>  ><%=c.getNom() %></option>  
      				  
    				<%} %>
  						</select>  
				      	<span class="red">*</span>
				    </tr>
						
					</tr>
					<tr>
						<td nowrap align="right" width="9%">剂量：</td>
						<td width="36%">
						<input name="dosage" type="text" class="input" id="dosage" value=<%=v.getDosage() %>/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">途径：</div></td>
				   		<td width="43%">
						<<select name="way_v" style="width: 150px; ">  
   					<%	
   						int z=v.getWay_v();
   						ArrayList<Code> code3=new CodeDao().listCode("way_v"); 
   						 for(Code c:code3){
   					%> 
      				  <option value="<%=c.getId()%>" <% if(c.getId()==z) {%>selected <%} %>  ><%=c.getNom() %></option>  
      				  
    				<%} %>
  						</select>  
						<span class="red">*</span></tr>
					</tr>
					<tr>
						<td nowrap align="right">反应情况：</td>
						<td colspan="3">
						<textarea name="reaction" cols="90" rows="1" class="input" id="reaction"><%=v.getReaction() %></textarea></td>
					</tr>
					<tr>
					    <td width="12%"><div align="right">录入时间：</div></td>
				   		<td width="43%">
				   		<%=DateUtil.parseToString(v.getDate_i(),DateUtil.yyyyMMdd)%>
				      	<span class="red">*</span></td>
						<td nowrap align="right" width="9%">执行人员：</td>
						<td width="36%">
						<input name="executant" type="text" class="input" id="executant" value=<%=v.getExecutant() %>/>
						<span class="red">*</span></tr>
				   		
					</tr>
					
					<tr>
						<td nowrap align="right">备注：</td>
						<td colspan="3">
						<textarea name="remarks" cols="90" rows="5" class="input" id="remarks"><%=v.getRemarks() %></textarea></td>
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
		<input name="增加" type="button" class="button" onclick="F2-4-vaccine.jsp" value="增加"/>　
		<input name="修改" type="button" class="button" onclick="Vaccinum?action=update&user=<%= v.getId_f()%>" value="修改"/>　
		<input name="删除" type="button" class="button" onclick="Vaccinum?action=deleteuser&id=<%=v.getId()%>" value="删除"/>
		<input name="清空" type="reset" class="button" value="清空"/></TD>
	</TR>
		<%} %>
</div>
</form>
</TABLE>

<!-- ****************************************************************************************** -->
</body>
	
</html>

