<%@ page contentType="text/html; charset=GBK" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>通州区猪只养殖质量安全管理系统</title>

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->

</style>
<link href="css/css.css" rel="stylesheet" type="text/css" />

<style type="text/css">
<!--
.STYLE1 {
	font-size: 36px;
	color: #009999;
	font-family: "方正舒体";
}
-->
</style>

</head>

<body>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="147" background="images/top02.gif"><div align="center"><span class="STYLE1">通州区猪只养殖质量安全管理系统</span></div></td>
  </tr>
</table>

<table width="562" border="0" align="center" cellpadding="0" cellspacing="0" class="right-table03">
  <tr>
    <td width="221"><table width="95%" border="0" cellpadding="0" cellspacing="0" class="login-text01">
      
      <tr>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="login-text01">
          
          <tr>
            <td align="center"><img src="images/ico13.gif" width="107" height="97" /></td>
          </tr>
          
          <tr>
            <td height="40" align="center">&nbsp;</td>
          </tr>
          
        </table></td>
        <td><img src="images/line01.gif" width="5" height="292" /></td>
      </tr>
    
    </table></td>
 <!-- ************************************************************************************* -->     
    <td>
	<form name="usersForm" method="post" action="login">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="width:100%">
	
     	<tr>
        	<td class="login-text02">用户名：<br /></td>
        	<td><input name="username" type="text" id="username" size="20" /></td>
      	</tr>
      
     	<tr>
        	<td class="login-text02">密　码：<br /> </td>
        	<td><input name="password" type="password" id="password" size="20" /></td>
     	</tr>
   <!-- ******************************************************* -->  
      	<tr>
		 	<td class="login-text02"><input name="usertype" type="radio" value="0" />管理员</td>
		 	<td class="login-text02"><input name="usertype" type="radio" value="1" checked />农户</td>
	 	</tr>
   <!-- ******************************************************* -->       
      	  <tr>
      	    <td><input type="button" class="right-button01" onclick="javascrtpt:window.location.href='U1-2-signin.jsp'"  value="注 册" /></td>
        	<td><input type="submit" class="right-button01"  value="登 录" /><td>
        	<td><input type="reset" class="right-button01" value="重 置" /></td>
          </tr>
      
    </table>
	</form>
	</td>
<!-- ************************************************************************************* -->  
  </tr>
</table>

</body>
</html>
