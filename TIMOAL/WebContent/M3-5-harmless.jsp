<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="tool.*"%>
<%@ page import="clas.Clean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
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
				<td height="22" colspan="11" align="center" style="font-size:16px">无害处理记录表</td>
				</tr>
				<tr bgcolor="#EEEEEE">
				<td width="10%" align="center" height="30">农号</td>
				<td width="10%" align="center">处理时间</td>
				<td width="5%" align="center" >栋号</td>
				<td width="5%" align="center" >栏号</td>
				<td width="5%" align="center" >耳号</td>
				<td width="5%" align="center" >数量</td>
				<td width="5%" align="center" >处理原因</td>
				<td width="5%" align="center" >处理方式</td>
				<td width="5%" align="center" >执行人员</td>
				<td width="5%" align="center" >备注</td>
				<td width="10%" align="center" >录入时间</td>
				</tr>
	
				
					<tr bgcolor="#FFFFFF">
					<td height="22" align="center" >&nbsp;</td>
					<td height="22" align="center" >&nbsp;</td>
					<td height="22" align="center" >&nbsp;</td>
					<td height="22" align="center" >&nbsp;</td>
					<td height="22" align="center" >&nbsp;</td>
					<td height="22" align="center" >&nbsp;</td>
					<td height="22" align="center" >&nbsp;</td>
					<td height="22" align="center" >&nbsp;</td>
					<td height="22" align="center" ><a href="user.do?action=selectuser&id=">修改</a>&nbsp;&nbsp;<a href="user.do?action=deleteuser&id=">删除</a></td>
					</tr>
				
				<tr>
				<td height="22" colspan="7" align="center" >目前没有无害处理记录！</td>
				</tr>
				
	
				</table>
			</td>
			</tr>
			</table>
			
			<!-- ******************************表格查询模块****************************** -->			
			<table width="90%" border="0" cellpadding="0" cellspacing="0" style="width:80%" align="center">
			<tr><td>
			<div class="MainDiv">
			<fieldset style="height:100%;">
			<legend>筛选条件</legend>
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
					<tr>
						<td nowrap align="center" width="5%">农号：</td>
						<td width="15%">
						<input name="username" type="text" class="input" id="username"/>
						</td>
						<td><input type="button" class="right-button01" value="查询" /></td>
					</tr>
					<tr>
						<td nowrap align="center" width="5%">处理时间：从</td>
						<td width="30%">
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
						</td>
				    
						<td nowrap align="center" width="5%">至</td>
						<td width="30%">
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
						</td>
				  </tr>
				  <tr>
						<td nowrap align="center" width="5%">栋号：</td>
						<td width="10%">
						<select id="buliding"  name="building">
							<option value="0">请选择</option>
							<option value="999">所有栋</option>
							<option value="1">A栋</option>
							<option value="2">B栋</option>
							<option value="3">C栋</option>
							<option value="4">D栋</option>
							<option value="5">E栋</option>
							<option value="6">F栋</option>
							<option value="7">G栋</option>
							<option value="8">H栋</option>
							<option value="9">I栋</option>
							<option value="10">J栋</option>
						</select>
						
				   		<td width="5%"><div align="center">栏号：</td>
				   		<td width="10%">
				   		<select id="basket"  name="basket">
							<option value="0">请选择</option>
							<option value="999">所有栏</option>
							<option value="1">A栏</option>
							<option value="2">B栏</option>
							<option value="3">C栏</option>
							<option value="4">D栏</option>
							<option value="5">E栏</option>
							<option value="6">F栏</option>
							<option value="7">G栏</option>
							<option value="8">H栏</option>
							<option value="9">I栏</option>
							<option value="10">J栏</option>
						</select>
						</td>
						</td>
						</tr>
				      	
				      	
				      		
				</tr>
				</table>
				</fieldset>
				</div>
				</td></tr>
				</table>
				<!-- ******************************表格查询模块****************************** -->				
			
		</td>
		</tr>
		</table>
	
<!-- ****************************************************************************************** -->
<form name="userForm" method="post" action="user.do?action=adduser" onSubmit="return userValidate();">
<div class="MainDiv">

  	<tr>
    <td class="CPanel">
		<table width="90%" border="0" cellpadding="0" cellspacing="0" style="width:80%" align="center">
		<TR>
		<TD width="100%">
			<fieldset style="height:100%;">
			<legend>无害处理信息</legend>
				<table width="100%" border="0" cellpadding="2" cellspacing="1" style="width:100%">
										<tr>
						<td nowrap align="right" width="9%">农号：</td>
						<td width="36%">
						<input name="username" type="text" class="input" id="username"/>
						<span class="red">*</span></td>
				    </tr>
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
						<input name="username" type="text" class="input" id="username"/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">栏号：</div></td>
				   		<td width="43%">
				   		<input name="password" type="text" class="input" id="password" />
				      	<span class="red">*</span></tr>
					<tr>
					 <tr>
						<td nowrap align="right" width="9%">耳号：</td>
						<td width="36%">
						<input name="username" type="text" class="input" id="username"/>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">数量：</div></td>
				   		<td width="43%">
				   		<input name="password" type="text" class="input" id="password" />
				      	<span class="red">*</span></tr>
					<tr>
					<tr>
						<td nowrap align="right">处理原因：</td>
						<td colspan="3">
						<textarea name="content" cols="90" rows="1" class="input" id="content"></textarea></td>
					</tr>
					<tr>
						<td nowrap align="right">处理方式：</td>
						<td colspan="3">
						<textarea name="content" cols="90" rows="1" class="input" id="content"></textarea></td>
					</tr>
					<tr>
					    <td width="12%"><div align="right">录入时间：</div></td>
				   		<td width="43%">
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
						<td nowrap align="right" width="9%">执行人员：</td>
						<td width="36%">
						<input name="username" type="text" class="input" id="username"/>
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
		<input name="修改" type="submit" class="button" value="修改"/>　
		<input name="删除" type="submit" class="button" value="删除"/>
		<input name="清空" type="reset" class="button" value="清空"/></TD>
	</TR>
		
</div>
</form>
</TABLE>

<!-- ****************************************************************************************** -->
</body>
	
</html>

