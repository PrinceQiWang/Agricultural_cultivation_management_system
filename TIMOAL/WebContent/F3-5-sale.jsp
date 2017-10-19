<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="tool.DateUtil,tool.StringUtil"%>
<%@ page import="clas.*,Dao.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
		<th class="tablestyle_title" >生猪销售</th>
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
				<td height="22" colspan="13" align="center" style="font-size:16px">生猪销售记录表</td>
				</tr>
				<tr bgcolor="#EEEEEE">
				<td width="10%" align="center" height="30">销售时间</td>
				<td width="5%" align="center" >栋号</td>
				<td width="5%" align="center" >栏号</td>
				<td width="5%" align="center" >耳号</td>
				<td width="5%" align="center" >猪只类别</td>
				<td width="5%" align="center" >销售单价</td>
				<td width="5%" align="center" >销售总量</td>
				<td width="10%" align="center" >销售去向</td>
				<td width="10%" align="center" >检疫结论</td>
				<td width="10%" align="center" >执行人员</td>
				<td width="10%" align="center" >备注</td>
				<td width="10%" align="center" >录入时间</td>
				</tr>
	
				<% 
				ArrayList<Sale> list=(ArrayList<Sale>)session.getAttribute("Salelist");
				if(list!=null){
					for(Sale u:list){
				%>
					<tr bgcolor="#FFFFFF">
					<td height="22" align="center" ><%=StringUtil.notNull(DateUtil.parseToString(u.getDate_s(),DateUtil.yyyyMMdd))%>&nbsp;</td>
					<td height="22" align="center" ><%=u.getBuilding() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getFence() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getId_a() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getType_v() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getPrice() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getAmount() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getDirection() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getConclusion() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getExecutant() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getRemarks() %>&nbsp;</td>
					<td height="22" align="center" ><%=StringUtil.notNull(DateUtil.parseToString(u.getDate_i(),DateUtil.yyyyMMdd))%>&nbsp;</td>
					<td height="22" align="center" ><a href="Sale?action=list&user=${sessionScope.farmer.id_f}&id=<%=u.getId() %>">修改</a>&nbsp;&nbsp;</td>
					</tr>
				<%}
				}
				else{
				%>
				<tr>
				<td height="22" colspan="7" align="center" >目前没有生猪销售记录！</td>
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
<form name="SaleForm" method="post" onSubmit="return userValidate();">
<div class="MainDiv">
<% Sale s=(Sale)session.getAttribute("sale");
if(s!=null){
%>
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
						<input name="date_s" type="text" class="input" id="building" value=<%=StringUtil.notNull(DateUtil.parseToString(s.getDate_s(),DateUtil.yyyyMMdd))%>/>
						<span class="red">*</span></td>
				    </tr>
				    <tr>
						<td nowrap align="right" width="9%">栋号：</td>
						<td width="36%">
						<input name="building" type="text" class="input" id="building" value=<%=s.getBuilding() %>/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">栏号：</div></td>
				   		<td width="43%">
				   		<input name="password" type="text" class="input" id="password" value=<%=s.getFence() %>/>
				      	<span class="red">*</span>
				    </tr>
					<tr>
					<tr>
						<td nowrap align="right" width="9%">耳号：</td>
						<td width="36%">
						<input name="id_a" type="text" class="input" id="id_a" value=<%=s.getId_a() %>/>
						<span class="red">*</span></td>
					<tr>
					<tr>
						<td nowrap align="right" width="9%">猪只类别：</td>
						<td width="36%">
						<select name=type_v style="width: 150px; ">  
   					<%	
   						int i=s.getType_v();
   						ArrayList<Code> code=new CodeDao().listCode("type_v"); 
   						 for(Code c:code){
   					%> 
      				  <option value="<%=c.getId()%>" <% if(c.getId()==i) {%>selected <%} %> ><%=c.getNom() %></option>  
      				  
    				<%} %>
  						</select> 
						<span class="red">*</span></td>
				    </tr>
				    <tr>
						<td nowrap align="right" width="9%">销售单价：</td>
						<td width="36%">
						<input name="price" type="text" class="input" id="price" value=<%=s.getPrice() %>/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">销售总量：</div></td>
				   		<td width="43%">
				   		<input name="amount" type="text" class="input" id="amount" value=<%=s.getAmount() %>/>
				      	<span class="red">*</span>
				    </tr>
					<tr>
						<td nowrap align="right">销售去向：</td>
						<td colspan="3">
						<textarea name="direction" cols="90" rows="1" class="input" id="direction"><%=s.getDirection() %></textarea></td>
					</tr>
					<tr>
						<td nowrap align="right">检疫结论：</td>
						<td colspan="3">
						<textarea name="conclusion" cols="90" rows="1" class="input" id="conclusion"><%=s.getConclusion() %></textarea></td>
					</tr>
					<tr>
					    <td width="12%"><div align="right">录入时间：</div></td>
				   		<td width="43%">
				   		<%=StringUtil.notNull(DateUtil.parseToString(s.getDate_i(),DateUtil.yyyyMMdd))%>
				      	</td>
						<td nowrap align="right" width="9%">执行人员：</td>
						<td width="36%">
						<input name="executant" type="text" class="input" id="executant" value=<%=s.getExecutant() %>/>
						<span class="red">*</span></tr>
				   		
					</tr>
					
					<tr>
						<td nowrap align="right">备注：</td>
						<td colspan="3">
						<textarea name="remarks" cols="90" rows="5" class="input" id="remarks"><%=s.getRemarks() %></textarea></td>
					</tr>
				
				</table><br />
				</fieldset>
				</TD>		
		</TR>
		</TABLE>
	</td>
	</tr>
		
	<input name="增加" type="submit" class="button" onclick="F2-6-sale.jsp" value="增加"/>　
		<input name="修改" type="submit" class="button" onclick="Sale?action=update&user=<%= s.getId_f()%>" value="修改"/>　
		<input name="删除" type="submit" class="button" onclick="Sale?action=deleteuser&id=<%=s.getId()%>" value="删除"/>
		<input name="清空" type="reset" class="button" value="清空"/></TD>
		<%} %>
</form>
</TABLE>

<!-- ****************************************************************************************** -->
</body>
	
</html>

