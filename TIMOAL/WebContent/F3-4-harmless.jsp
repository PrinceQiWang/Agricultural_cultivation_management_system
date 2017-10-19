<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="tool.*"%>
<%@ page import="clas.Dispose"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无害处理</title>
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
		<th class="tablestyle_title" >无害处理</th>
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
				<td height="22" colspan="10" align="center" style="font-size:16px">无害处理记录表</td>
				</tr>
				<tr bgcolor="#EEEEEE">
				<td width="10%" align="center" height="30">处理时间</td>
				<td width="5%" align="center" >栋号</td>
				<td width="5%" align="center" >栏号</td>
				<td width="5%" align="center" >耳号</td>
				<td width="5%" align="center" >处理原因</td>
				<td width="5%" align="center" >处理方式</td>
				<td width="10%" align="center" >执行人员</td>
				<td width="10%" align="center" >备注</td>
				<td width="10%" align="center" >录入时间</td>
				</tr>
	
				<% 
				ArrayList<Dispose> list=(ArrayList<Dispose>)session.getAttribute("disposelist");
				if(list!=null){
					for(Dispose u:list){
				%>
					<tr bgcolor="#FFFFFF">
					<td height="22" align="center" ><%=StringUtil.notNull(DateUtil.parseToString(u.getDate(),DateUtil.yyyyMMdd))%>&nbsp;</td>
					<td height="22" align="center" ><%=u.getBuilding() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getFence() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getId_a() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getReason() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getWay_f() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getExecutant() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getRemarks() %>&nbsp;</td>
					<td height="22" align="center" ><%=StringUtil.notNull(DateUtil.parseToString(u.getDate_i(),DateUtil.yyyyMMdd))%>&nbsp;</td>
					<td height="22" align="center" ><a href="Dispose?action=selectuser&id=<%=u.getId()%>">修改</a>&nbsp;&nbsp;<a href="Dispose?action=deleteuser&id=<%=u.getId()%>">删除</a></td>
					</tr>
				<%}
				}
				else{
				%>
				<tr>
				<td height="22" colspan="7" align="center" >目前没有无害处理记录！</td>
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
<form name="disposeForm" method="post" action="dispose?action=adduser" onSubmit="return userValidate();">
<div class="MainDiv">
<% Dispose d=(Dispose)session.getAttribute("dispose");
if(d!=null){
%>
  	<tr>
    <td class="CPanel">
		<table width="90%" border="0" cellpadding="0" cellspacing="0" style="width:80%" align="center">
		<TR>
		<TD width="100%">
			<fieldset style="height:100%;">
			<legend>无害处理信息</legend>
				<table width="100%" border="0" cellpadding="2" cellspacing="1" style="width:100%">
					
					<tr>
						<td nowrap align="right" width="9%">处理时间：</td>
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
				    </tr>
				    <tr>
						<td nowrap align="right" width="9%">栋号：</td>
						<td width="36%">
						<input name="building" type="text" class="input" id="building" value=<%=d.getBuilding() %>/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">栏号：</div></td>
				   		<td width="43%">
				   		<input name="fence" type="text" class="input" id="fence" value=<%=d.getFence() %>/>
				      	<span class="red">*</span></tr>
					<tr>
					 <tr>
						<td nowrap align="right" width="9%">耳号：</td>
						<td width="36%">
						<input name="id_a" type="text" class="input" id="id_a" value=<%=d.getId_a() %>/>
						<span class="red">*</span></td>
					<tr>
					<tr>
						<td nowrap align="right">处理原因：</td>
						<td colspan="3">
						<textarea name="reason" cols="90" rows="1" class="input" id="reason"><%=d.getReason() %></textarea></td>
					</tr>
					<tr>
						<td nowrap align="right">处理方式：</td>
						<td colspan="3">
						<textarea name="way_f" cols="90" rows="1" class="input" id="way_f"><%=d.getWay_f() %></textarea></td>
					</tr>
					<tr>
					    <td width="12%"><div align="right">录入时间：</div></td>
				   		<td width="43%">
				   		<%= StringUtil.notNull(DateUtil.parseToString(d.getDate_i(),DateUtil.yyyyMMdd)) %>
				      	<span class="red">*</span></td>
						<td nowrap align="right" width="9%">执行人员：</td>
						<td width="36%">
						<input name="executant" type="text" class="input" id="executant" value=<%=d.getExecutant() %>/>
						<span class="red">*</span></tr>
				   		
					</tr>
					
					<tr>
						<td nowrap align="right">备注：</td>
						<td colspan="3">
						<textarea name="remarks" cols="90" rows="5" class="input" id="remarks"><%=d.getRemarks() %></textarea></td>
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
		<input name="修改" type="submit" class="button" value="修改"/>　
		<input name="删除" type="submit" class="button" value="删除"/>
		<input name="清空" type="reset" class="button" value="清空"/></TD>
	</TR>
		<%} %>
</div>
</form>
</TABLE>

<!-- ****************************************************************************************** -->
</body>
	
</html>

