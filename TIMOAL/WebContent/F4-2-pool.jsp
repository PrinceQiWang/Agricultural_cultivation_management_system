<%@ page contentType="text/html; charset=GBK" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="tool.*"%>
<%@ page import="clas.Clean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��ˮ��ϴ</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.tabfont01 {	
	font-family: "����";
	font-size: 9px;
	color: #555555;
	text-decoration: none;
	text-align: center;
}
.font051 {font-family: "����";
	font-size: 12px;
	color: #333333;
	text-decoration: none;
	line-height: 20px;
}
.font201 {font-family: "����";
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}
.button {
	font-family: "����";
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
		<th class="tablestyle_title" >��ˮ��ϴ</th>
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
				<td height="22" colspan="8" align="center" style="font-size:16px">��ˮ��ϴ��¼��</td>
				</tr>
				<tr bgcolor="#EEEEEE">
				<td width="10%" align="center" height="30">��ϴʱ��</td>
				<td width="10%" align="center" >��ϴ����</td>
				<td width="15%" align="center" >����ҩ����</td>
				<td width="10%" align="center" >����ҩ����</td>
				<td width="15%" align="center" >��ϴ����</td>
				<td width="10%" align="center" >ִ����Ա</td>
				<td width="20%" align="center" >��ע</td>
				<td width="10%" align="center" >¼��ʱ��</td>
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
					<td height="22" align="center" ><a href="user.do?action=selectuser&id=">�޸�</a>&nbsp;&nbsp;<a href="user.do?action=deleteuser&id=">ɾ��</a></td>
					</tr>
				
				<tr>
				<td height="22" colspan="7" align="center" >Ŀǰû����ˮ��ϴ��¼��</td>
				</tr>
			
	
				</table>
			</td>
			</tr>
			</table>
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
			<legend>��ˮ������Ϣ</legend>
				<table width="100%" border="0" cellpadding="2" cellspacing="1" style="width:100%">
					
					<tr>
						<td nowrap align="right" width="9%">��ϴʱ�䣺</td>
						<td width="36%">
						<select id="year"  name="year">
							<option value="0">----��</option>
							<option value="2016">2016��</option>
							<option value="2017">2017��</option>
							<option value="2018">2018��</option>
							<option value="2019">2019��</option>
							<option value="2020">2020��</option>
							<option value="2021">2021��</option>
							<option value="2022">2022��</option>
							<option value="2023">2023��</option>
							<option value="2024">2024��</option>
							<option value="2025">2025��</option>
						</select>
						<select id="month"  name="month">
							<option value="0">--��</option>
							<option value="1">01��</option>
							<option value="2">02��</option>
							<option value="3">03��</option>
							<option value="4">04��</option>
							<option value="5">05��</option>
							<option value="6">06��</option>
							<option value="7">07��</option>
							<option value="8">08��</option>
							<option value="9">09��</option>
							<option value="10">10��</option>
							<option value="11">11��</option>
							<option value="12">12��</option>
						</select>
						<select id="day"  name="day">
							<option value="0">--��</option>
							<option value="1">01��</option>
							<option value="2">02��</option>
							<option value="3">03��</option>
							<option value="4">04��</option>
							<option value="5">05��</option>
							<option value="6">06��</option>
							<option value="7">07��</option>
							<option value="8">08��</option>
							<option value="9">09��</option>
							<option value="10">10��</option>
							<option value="11">11��</option>
							<option value="12">12��</option>
							<option value="13">13��</option>
							<option value="14">14��</option>
							<option value="15">15��</option>
							<option value="16">16��</option>
							<option value="17">17��</option>
							<option value="18">18��</option>
							<option value="19">19��</option>
							<option value="20">20��</option>
							<option value="21">21��</option>
							<option value="22">22��</option>
							<option value="23">23��</option>
							<option value="24">24��</option>
							<option value="25">25��</option>
							<option value="26">26��</option>
							<option value="27">27��</option>
							<option value="28">28��</option>
							<option value="29">29��</option>
							<option value="30">30��</option>
							<option value="31">31��</option>
						</select>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">��ϴ����</div></td>
				   		<td width="43%">
				   		<input name="password" type="text" class="input" id="password" />
				      	<span class="red">*</span></tr>
					<tr>
						<td nowrap align="right" width="9%">����ҩ���ƣ�</td>
						<td width="36%">
						<select id="medicine"  name="medicine">
							<option value="0">��ѡ��</option>
							<option value="1">Aҩ��</option>
							<option value="2">Bҩ��</option>
							<option value="3">Cҩ��</option>
							<option value="4">Dҩ��</option>
							<option value="5">Eҩ��</option>
							<option value="6">Fҩ��</option>
							<option value="7">Gҩ��</option>
							<option value="8">Hҩ��</option>
							<option value="9">Iҩ��</option>
							<option value="10">Jҩ��</option>
						</select>
						<span class="red">*</span></td>
				   		<td width="12%"><div align="right">����ҩ������</div></td>
				   		<td width="43%">
				   		<input name="password" type="text" class="input" id="password" />
				      	<span class="red">*</span></tr>
					</tr>
					
					<tr>
						<td nowrap align="right">��ϴ������</td>
						<td colspan="3">
						<textarea name="content" cols="90" rows="1" class="input" id="content"></textarea></td>
					</tr>
					
					<tr>
					    <td width="12%"><div align="right">¼��ʱ�䣺</div></td>
				   		<td width="43%">
				   		<select id="year"  name="year">
							<option value="0">----��</option>
							<option value="2016">2016��</option>
							<option value="2017">2017��</option>
							<option value="2018">2018��</option>
							<option value="2019">2019��</option>
							<option value="2020">2020��</option>
							<option value="2021">2021��</option>
							<option value="2022">2022��</option>
							<option value="2023">2023��</option>
							<option value="2024">2024��</option>
							<option value="2025">2025��</option>
						</select>
						<select id="month"  name="month">
							<option value="0">--��</option>
							<option value="1">01��</option>
							<option value="2">02��</option>
							<option value="3">03��</option>
							<option value="4">04��</option>
							<option value="5">05��</option>
							<option value="6">06��</option>
							<option value="7">07��</option>
							<option value="8">08��</option>
							<option value="9">09��</option>
							<option value="10">10��</option>
							<option value="11">11��</option>
							<option value="12">12��</option>
						</select>
						<select id="day"  name="day">
						<option value="0">--��</option>
							<option value="1">01��</option>
							<option value="2">02��</option>
							<option value="3">03��</option>
							<option value="4">04��</option>
							<option value="5">05��</option>
							<option value="6">06��</option>
							<option value="7">07��</option>
							<option value="8">08��</option>
							<option value="9">09��</option>
							<option value="10">10��</option>
							<option value="11">11��</option>
							<option value="12">12��</option>
							<option value="13">13��</option>
							<option value="14">14��</option>
							<option value="15">15��</option>
							<option value="16">16��</option>
							<option value="17">17��</option>
							<option value="18">18��</option>
							<option value="19">19��</option>
							<option value="20">20��</option>
							<option value="21">21��</option>
							<option value="22">22��</option>
							<option value="23">23��</option>
							<option value="24">24��</option>
							<option value="25">25��</option>
							<option value="26">26��</option>
							<option value="27">27��</option>
							<option value="28">28��</option>
							<option value="29">29��</option>
							<option value="30">30��</option>
							<option value="31">31��</option>
						</select>
				      	<span class="red">*</span></td>
						<td nowrap align="right" width="9%">ִ����Ա��</td>
						<td width="36%">
						<input name="username" type="text" class="input" id="username"/>
						<span class="red">*</span></tr>
				   		
					</tr>
					
					<tr>
						<td nowrap align="right">��ע��</td>
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
		<input name="����" type="submit" class="button" value="����"/>��
		<input name="�޸�" type="submit" class="button" value="�޸�"/>��
		<input name="ɾ��" type="submit" class="button" value="ɾ��"/>
		<input name="���" type="reset" class="button" value="���"/></TD>
	</TR>
		
</div>
</form>
</TABLE>

<!-- ****************************************************************************************** -->
</body>
	
</html>