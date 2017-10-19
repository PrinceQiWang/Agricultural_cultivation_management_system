<%@ page contentType="text/html; charset=GBK" language="java" %>
<html>
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
	background-image: url(images/left.gif);
}
-->
</style>

<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<SCRIPT language=JavaScript>
function tupian(idt){
    var nametu="xiaotu"+idt;
    var tp = document.getElementById(nametu);
    tp.src="images/ico05.gif";//图片ico04为白色的正方形
	
	for(var i=1;i<30;i++)
	{
	  
	  var nametu2="xiaotu"+i;
	  if(i!=idt*1)
	  {
	    var tp2=document.getElementById('xiaotu'+i);
		if(tp2!=undefined)
	    {tp2.src="images/ico06.gif";}//图片ico06为蓝色的正方形
	  }
	}
}

function list(idstr){
	var name1="subtree"+idstr;
	var name2="img"+idstr;
	var objectobj=document.all(name1);
	var imgobj=document.all(name2);
	
	
	//alert(imgobj);
	
	if(objectobj.style.display=="none"){
		for(i=1;i<10;i++){
			var name3="img"+i;
			var name="subtree"+i;
			var o=document.all(name);
			if(o!=undefined){
				o.style.display="none";
				var image=document.all(name3);
				//alert(image);
				image.src="images/ico04.gif";
			}
		}
		objectobj.style.display="";
		imgobj.src="images/ico03.gif";
	}
	else{
		objectobj.style.display="none";
		imgobj.src="images/ico04.gif";
	}
}

</SCRIPT>

<body>
<table width="198" border="0" cellpadding="0" cellspacing="0" class="left-table01">
	<tr>
    	<TD>
		
	    <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td width="207" height="55" background="images/nav01.gif">
					<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="25%" rowspan="2"><img src="images/ico02.gif" width="35" height="35" /></td>
							<td width="75%" height="22" class="left-font01">您好，<span class="left-font02">${sessionScope.farmer.name}</span></td>
						</tr>
						<tr>
							<td height="22" class="left-font01">[&nbsp;<a href="welcome.jsp" target="_top" class="left-font01">退出</a>&nbsp;]</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		

		<!--  用户信息维护部分  -->
		<TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29">
				<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="8%"><img name="img8" id="img8" src="../images/ico04.gif" width="8" height="11" /></td>
						<td width="92%"><a href="javascript:" target="mainFrame" class="left-font03" onClick="list('8');" >用户信息维护</a></td>
					</tr>
				</table>
			</td>
          </tr>		  
        </TABLE>
		
		<table id="subtree8" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" 
				cellspacing="0" class="left-table02">
				<tr>
				  <td width="9%" height="20" ><img id="xiaotu1" src="../images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="F1-1-information.jsp" target="mainFrame" class="left-font03" onClick="tupian('1');">我的信息</a></td>
				</tr>
				<tr>
				  <td width="9%" height="21" ><img id="xiaotu2" src="../images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="F1-2-password.jsp" target="mainFrame" class="left-font03" onClick="tupian('2');">我的密码</a></td>
				</tr>
       </table>
		<!--  用户信息维护部分  -->

		
		<!--  猪只养殖管理部分  -->
		<TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
        	<tr>
        		<td height="29">
					<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="8%"><img name="img7" id="img7" src="../images/ico04.gif" width="8" height="11" /></td>
							<td width="92%"><a href="javascript:" target="mainFrame" class="left-font03" onClick="list('7');" >猪只养殖管理</a></td>
						</tr>
					</table>
				</td>
        	</tr>		  
        </TABLE>
		
		<table id="subtree7" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="left-table02">
		
			<tr>
				<td width="9%" height="20" ><img id="xiaotu3" src="../images/ico06.gif" width="8" height="12" /></td>
				<td width="91%"><a href="Animal?action=list&user=${sessionScope.farmer.id_f}" target="mainFrame" class="left-font03" onClick="tupian('3');">猪只管理</a></td>
			</tr>
		
			<tr>
				<td width="9%" height="20" ><img id="xiaotu4" src="../images/ico06.gif" width="8" height="12" /></td>
				<td width="91%"><a href="F2-1-pig.jsp" target="mainFrame" class="left-font03" onClick="tupian('4');">猪只添加</a></td>
			</tr>
			<tr>
				<td width="9%" height="20" ><img id="xiaotu5" src="../images/ico06.gif" width="8" height="12" /></td>
				<td width="91%"><a href="F2-2-food.jsp" target="mainFrame" class="left-font03" onClick="tupian('5');">饲料使用</a></td>
			</tr>
			<tr>
				<td width="9%" height="20" ><img id="xiaotu6" src="../images/ico06.gif" width="8" height="12" /></td>
				<td width="91%"><a href="F2-3-medicine.jsp" target="mainFrame" class="left-font03" onClick="tupian('6');">兽药使用</a></td>
			</tr>
			<tr>
				<td width="9%" height="20" ><img id="xiaotu7" src="../images/ico06.gif" width="8" height="12" /></td>
				<td width="91%"><a href="F2-4-vaccine.jsp" target="mainFrame" class="left-font03" onClick="tupian('7');">免疫接种</a></td>
			</tr>
			<tr>
				<td width="9%" height="20" ><img id="xiaotu8" src="../images/ico06.gif" width="8" height="12" /></td>
				<td width="91%"><a href="F2-5-harmless.jsp" target="mainFrame" class="left-font03" onClick="tupian('8');">无害处理</a></td>
			</tr>
			<tr>
				<td width="9%" height="20" ><img id="xiaotu9" src="../images/ico06.gif" width="8" height="12" /></td>
				<td width="91%"><a href="F2-6-sell.jsp" target="mainFrame" class="left-font03" onClick="tupian('9');">生猪销售</a></td>
			</tr>
			
      	</table>
	  <!--  猪只养殖管理部分  -->


	  <!--  猪只养殖记录部分  -->
	  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
      	<tr>
      		<td height="29">
      			<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
      				<tr>
      					<td width="8%" height="12"><img name="img2" id="img2" src="../images/ico04.gif" width="8" height="11" /></td>
      					<td width="92%"><a href="javascript:" target="mainFrame" class="left-font03" onClick="list('2');" >猪只养殖记录</a></td>
      				</tr>
      			</table>
      		</td>
      	</tr>
      </table>
	  
	  <table id="subtree2" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="left-table02">
      	<tr>
      		<td width="9%" height="20" ><img id="xiaotu10" src="../images/ico06.gif" width="8" height="12" /></td>
      		<td width="91%"><a href="F3-1-food.jsp" target="mainFrame" class="left-font03" onClick="tupian('10');">饲料使用</a></td>
      	</tr>
	  	<tr>
      		<td width="9%" height="20" ><img id="xiaotu11" src="../images/ico06.gif" width="8" height="12" /></td>
      		<td width="91%"><a href="F3-2-medicine.jsp" target="mainFrame" class="left-font03" onClick="tupian('11');">兽药使用</a></td>
      	</tr>
      	<tr>
			<td width="9%" height="20" ><img id="xiaotu12" src="../images/ico06.gif" width="8" height="12" /></td>
			<td width="91%"><a href="F3-3-vaccine.jsp" target="mainFrame" class="left-font03" onClick="tupian('12');">免疫接种</a></td>
		</tr>
		<tr>
			<td width="9%" height="20" ><img id="xiaotu13" src="../images/ico06.gif" width="8" height="12" /></td>
			<td width="91%"><a href="F3-4-harmless.jsp" target="mainFrame" class="left-font03" onClick="tupian('13');">无害处理</a></td>
		</tr>
		<tr>
			<td width="9%" height="20" ><img id="xiaotu14" src="../images/ico06.gif" width="8" height="12" /></td>
			<td width="91%"><a href="F3-5-sell.jsp" target="mainFrame" class="left-font03" onClick="tupian('14');">生猪销售</a></td>
		</tr>
      </table>
	  <!--  猪只养殖记录部分  -->
	  
	  <!--  卫生消毒记录部分  -->
	  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
      	<tr>
      		<td height="29">
      			<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
      				<tr>
      					<td width="8%" height="12"><img name="img9" id="img9" src="../images/ico04.gif" width="8" height="11" /></td>
      					<td width="92%"><a href="javascript:" target="mainFrame" class="left-font03" onClick="list('9');" >卫生消毒记录</a></td>
      				</tr>
      			</table>
      		</td>
      	</tr>
      </table>
	  
	  <table id="subtree9" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="left-table02">
      	<tr>
      		<td width="9%" height="20" ><img id="xiaotu15" src="../images/ico06.gif" width="8" height="12" /></td>
      		<td width="91%"><a href="Clean?action=list" target="mainFrame" class="left-font03" onClick="tupian('15');">日常消毒</a></td>
      	</tr>
	  	<tr>
      		<td width="9%" height="20" ><img id="xiaotu16" src="../images/ico06.gif" width="8" height="12" /></td>
      		<td width="91%"><a href="F4-2-pool.jsp" target="mainFrame" class="left-font03" onClick="tupian('16');">蓄水清理</a></td>
      	</tr>
      </table>
	  <!--  卫生消毒记录部分  -->

		</TD>
	</tr>
  
</table>
</body>
</html>
