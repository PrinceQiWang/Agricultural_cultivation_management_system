<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="tool.*"%>
<%@ page import="clas.Clean,clas.Code,Dao.CodeDao"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>日常消毒</title>
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
		<th class="tablestyle_title" >日常消毒</th>
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
				<td height="22" colspan="8" align="center" style="font-size:16px">日常消毒记录表</td>
				</tr>
				<tr bgcolor="#EEEEEE">
				<td width="10%" align="center" height="30">消毒时间</td>
				<td width="10%" align="center" >消毒对象</td>
				<td width="15%" align="center" >消毒剂名称</td>
				<td width="10%" align="center" >消毒剂用量</td>
				<td width="15%" align="center" >消毒方法</td>
				<td width="10%" align="center" >执行人员</td>
				<td width="10%" align="center" >备注</td>
				<td width="10%" align="center" >录入时间</td>
				<td width="10%" align="center" >操作</td>
				</tr>
				<% 
				ArrayList<Clean> list=(ArrayList<Clean>)session.getAttribute("cleanlist");
				if(list!=null){
					for(Clean u:list){
				%>
					<tr bgcolor="#FFFFFF">
					<td height="22" align="center" ><%=StringUtil.notNull(DateUtil.parseToString(u.getDate(),DateUtil.yyyyMMdd))%>&nbsp;</td>
					<td height="22" align="center" ><%=u.getNum() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getDisinfectant() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getConcentration() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getWay_c() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getExecutant() %>&nbsp;</td>
					<td height="22" align="center" ><%=u.getRemarks() %>&nbsp;</td>
					<td height="22" align="center" ><%=StringUtil.notNull(DateUtil.parseToString(u.getDate_i(),DateUtil.yyyyMMdd))%>&nbsp;</td>
					<td height="22" align="center" ><a href="Clean?action=list&id=<%=u.getId()%>" >修改</a>&nbsp;&nbsp;<a href="Clean?action=delete&id=<%=u.getId()%>">删除</a></td>
					</tr>
				<%}
				}
				else{
				%>
				<tr>
				<td height="22" colspan="7" align="center" >目前没有日常消毒记录！</td>
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
<form name="cleanForm" method="post"  onSubmit="return userValidate();">
<div class="MainDiv">
<% Clean c=(Clean)session.getAttribute("clean");
if(c!=null){
%>
  	<tr>
    <td class="CPanel">
		<table width="90%" border="0" cellpadding="0" cellspacing="0" style="width:80%" align="center">
		<TR>
		<TD width="100%">
			<fieldset style="height:100%;">
			<legend>日常消毒信息</legend>
				<table width="100%" border="0" cellpadding="2" cellspacing="1" style="width:100%">
					
					<tr>
						<td nowrap align="right" width="9%">消毒时间：</td>
						<td width="36%">
						<input name="date"  value="<%=DateUtil.parseToString(c.getDate(),DateUtil.yyyyMMdd)%>"/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">附着物：</div></td>
				   		<td width="43%">
				   		<input name="sticking" type="text" class="input" id="sticking" value=<%=c.getSticking() %>/>
				      	<span class="red">*</span></tr>
					<tr>
						<td nowrap align="right" width="9%">消毒剂名称：</td>
						<td width="36%">
						
						<select name="disinfectant" style="width: 150px; ">  
   					<%	
   						int i=c.getDisinfectant();
   						ArrayList<Code> code=new CodeDao().listCode("disinfectant"); 
   						 for(Code cd:code){
   					%> 
      				  <option value="<%=cd.getId()%>" <% if(cd.getId()==i) {%>selected <%} %> ><%=cd.getNom() %></option>  
      				  
    				<%} %>
  						</select> 
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">消毒剂用量：</div></td>
				   		<td width="43%">
				   		<input name="concentration" type="text" class="input" id="concentration" value=<%=c.getConcentration() %>/>
				      	<span class="red">*</span></tr>
					</tr>
					<tr>
						<td nowrap align="right">消毒方法：</td>
						<td colspan="3">
						<textarea name="way_c" cols="90" rows="1" class="input" ><%=c.getWay_c() %></textarea></td>
					</tr>
					
					<tr>
					    <td width="12%"><div align="right">录入时间：</div></td>
				   		<td width="43%">
				   		<input name="date_i" type="text" class="input" id="datei"><%=StringUtil.notNull(DateUtil.parseToString(c.getDate_i(),DateUtil.yyyyMMdd))%></input>
				      	<span class="red">*</span></td>
						<td nowrap align="right" width="9%">执行人员：</td>
						<td width="36%">
						<input name="executant" type="text" class="input" value=<%=c.getExecutant() %>/>
						<span class="red">*</span></tr>			   		
					</tr>
					<tr>
						<td nowrap align="right">备注：</td>
						<td colspan="3">
						<textarea name="remarks" cols="90" rows="5" class="input" id="content"><%=c.getRemarks() %></textarea></td>
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
		<input name="增加" type="submit" class="button" onclick="document.fm.action='xxx.jsp';document.fm.submit();" value="增加"/>　
		<input name="修改" type="submit" class="button" onclick="document.fm.action='xxx.jsp';document.fm.submit();" value="修改"/>　
		<input name="删除" type="submit" class="button" onclick="document.fm.action='xxx.jsp';document.fm.submit();"  value="删除"/>
		<input name="清空" type="reset" class="button" value="清空"/></TD>
	</TR>
		<%} %>
</div>
</form>
</TABLE>

<!-- ****************************************************************************************** -->
</body>
	
</html>

