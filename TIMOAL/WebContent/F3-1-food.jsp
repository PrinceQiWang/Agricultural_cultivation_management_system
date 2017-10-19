<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="tool.*"%>
<%@ page import="clas.Forage,clas.Code,Dao.CodeDao"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>饲料使用</title>
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
		<th class="tablestyle_title" >饲料使用</th>
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
				<td height="22" colspan="9" align="center" style="font-size:16px">饲料使用记录表</td>
				</tr>
				<tr bgcolor="#EEEEEE">
				<td width="10%" align="center" height="30">投放时间</td>
				<td width="10%" align="center" >栋号</td>
				<td width="10%" align="center" >栏号</td>
				<td width="10%" align="center" >猪只数量</td>
				<td width="10%" align="center" >饲料型号</td>
				<td width="10%" align="center" >投入量</td>
				<td width="10%" align="center" >执行人员</td>
				<td width="20%" align="center" >备注</td>
				<td width="10%" align="center" >录入时间</td>
				</tr>
	
				<% 
				ArrayList<Forage> list=(ArrayList<Forage>)session.getAttribute("list");
				if(list!=null){
					for(Forage f:list){
				%>
					<tr bgcolor="#FFFFFF">
					<td height="22" align="center" ><%=StringUtil.notNull(DateUtil.parseToString(f.getDate_a(),DateUtil.yyyyMMdd))%>&nbsp;</td>
					<td height="22" align="center" ><%=f.getBuilding() %>&nbsp;</td>
					<td height="22" align="center" ><%=f.getFence() %>&nbsp;</td>
					<td height="22" align="center" ><%=f.getNumber_a() %>&nbsp;</td>
					<td height="22" align="center" ><%= new CodeDao().getType(f.getType_f(),"type_f")%>&nbsp;</td>
					<td height="22" align="center" ><%=f.getAmount() %>&nbsp;</td>
					<td height="22" align="center" ><%=f.getFeeder() %>&nbsp;</td>
					<td height="22" align="center" ><%=f.getRemarks() %>&nbsp;</td>
					<td height="22" align="center" ><%=StringUtil.notNull(DateUtil.parseToString(f.getDate_i(),DateUtil.yyyyMMdd))%>&nbsp;</td>
					<td height="22" align="center" ><a href="Forage?action=list&user=${sessionScope.farmer.id_f}&id=<%=f.getId() %>">修改</a></td>
					</tr>
				<%}
				}
				else{
				%>
				<tr>
				<td height="22" colspan="7" align="center" >目前没有饲料使用记录！</td>
				</tr>
				<%}%>
	
				</table>
			</td>
			</tr>
			</table>
			
		</td>
		</tr>
		
		</table>
	<%Forage f=(Forage)session.getAttribute("forage"); if(f!=null){%>
<!-- ****************************************************************************************** -->
<form name="ForageForm" method="post" action="Forage?action=update&user=${sessionScope.farmer.id_f}&id=<%=f.getId() %>" onSubmit="return userValidate();">
<div class="MainDiv">

  	<tr>
    <td class="CPanel">
		<table width="90%" border="0" cellpadding="0" cellspacing="0" style="width:80%" align="center">
		<TR>
		<TD width="100%">
			<fieldset style="height:100%;">
			<legend>饲料使用信息</legend>
				<table width="100%" border="0" cellpadding="2" cellspacing="1" style="width:100%">
					
					<tr>
						<td nowrap align="right" width="9%">投放时间：</td>
						<td width="36%">
						<input name="date_a"  value="<%=DateUtil.parseToString(f.getDate_a(),DateUtil.yyyyMMdd)%>"/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">猪只数量：</div></td>
				   		<td width="43%">
				   		<input name="number_a" type="text" class="input" id="number_a" value="<%=f.getNumber_a() %>"/>
				      	<span class="red">*</span>
				    </tr>
				    <tr>
						<td nowrap align="right" width="9%">栋号：</td>
						<td width="36%">
						<input name="building" type="text" class="input" id="building" value="<%=f.getBuilding()%>"/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">栏号：</div></td>
				   		<td width="43%">
				   		<input name="fence" type="text" class="input" id="fence" value="<%=f.getFence() %>"/>
				      	<span class="red">*</span></tr>
					<tr>
					<tr>
						<td nowrap align="right" width="9%">饲料型号：</td>
						<td width="36%">
						<select name="type_f" style="width: 150px; ">  
   					<%	
   						int i=f.getType_f();
   						ArrayList<Code> code=new CodeDao().listCode("type_f"); 
   						 for(Code cd:code){
   					%> 
      				  <option value="<%=cd.getId()%>" <% if(cd.getId()==i) {%>selected <%} %> ><%=cd.getNom() %></option>  
      				  
    				<%} %>
  						</select> 
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">投入量：</div></td>
				   		<td width="43%">
				   		<input name="amount" type="text" class="input" id="amount" value="<%=f.getAmount() %>"/>
				      	<span class="red">*</span></tr>
					</tr>
					
					<tr>
					    <td width="12%"><div align="right">录入时间：</div></td>
				   		<td width="43%">
				   		<%=StringUtil.notNull(DateUtil.parseToString(f.getDate_i(),DateUtil.yyyyMMdd))%>
				      	</td>
						<td nowrap align="right" width="9%">执行人员：</td>
						<td width="36%">
						<input name="feeder" type="text" class="input" id="feeder" value="<%=f.getFeeder() %>"/>
						<span class="red">*</span></tr>
				   		
					</tr>
					
					<tr>
						<td nowrap align="right">备注：</td>
						<td colspan="3">
						<textarea name="remarks" cols="90" rows="5" class="input" id="remarks"><%=f.getRemarks() %></textarea></td>
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
		<input name="增加" type="button" class="button" onclick='location.href("F2-2-food.jsp")' value="增加"/>　
		<input name="修改" type="submit" class="button" value="修改"/>　
		<input name="删除" type="button" class="button" onclick='location.href("Forage?action=deleteuser&id=<%=f.getId()%>")' value="删除"/>
		<input name="清空" type="reset" class="button" value="清空"/></TD>
	</TR>
		
</div>
</form><%} %>
</TABLE>

<!-- ****************************************************************************************** -->
</body>
	
</html>

