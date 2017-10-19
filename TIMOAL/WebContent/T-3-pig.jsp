<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>高级畜牧表T-3</title>
    <style type="text/css">
        body,table
        {
            margin:0;
            padding:0;
            font-size:13px;
        }            
        table,tr,th,td
        {
            border:0.5px solid #464646;
        }
        th
        {
            background-color:#7F9DB9; 
            width:160px;
        }
        .oddColor
        {
            background-color:#ccc;
        }
        .evenColor
        {
            background-color:#EEEEEE;
        }
        .overColor
        {
            background-color:#7F9DB9;
        }
        .CTitle
        {
			background:#6795B4;
			padding:5px;
			text-align:left;
			color:#FFFFFF;
			font-size:13px;
			font-family: Verdana, Arial, Helvetica, sans-serif;
		}
    </style>
    <script type="text/javascript">
        //定义嵌套数组
        var datas = [["A","a",16001], ["A","a",16002], ["A","a",16003],["A","a",16004], ["A","a",16005], ["A","a",16006]];
        //动态创建表格
        function CreateMyTable() {
            var tblMain = document.getElementById("tblMain");
            var rowsCount = tblMain.rows.length;
            var addRow;
            var addCol;
            var detailInfos;
            for (var i = 0; i < datas.length; i++) {
                addRow = tblMain.insertRow(rowsCount - 1);//控制数据行添加到倒数第二列
                addCol = addRow.insertCell(-1);
                addCol.innerHTML = "<input type='checkbox' name='item' />";
                addCol.align = "center";  //控制列居中
                detailInfos = datas[i];
                for (var j = 0; j < detailInfos.length; j++) {
                    addCol = addRow.insertCell(-1);
                    addCol.innerHTML = detailInfos[j];
                    addCol.align = "center";  //控制列居中
                }
                addCol = addRow.insertCell(-1);
                addCol.innerHTML = "<input type='button' id='btnOut" + i + "' value='退回栏操作' onclick='btnOut(this)' />";
                addCol.align = "center";  //控制列居中
                rowsCount++;
            }
            TableColor();
        }
        
        //设置网格间隔色和高亮显示
        var oldClassName;             //记住行的背景色
        function TableColor() {
            var tblMain = document.getElementById("tblMain");
            var rowNodes = tblMain.rows;
 
            for (var i = 1; i < rowNodes.length-1; i++) {        //除去首行和末行
                if (i % 2 == 0) {
                    rowNodes[i].className = "evenColor";
                }
                else {
                    rowNodes[i].className = "oddColor";
                }
                rowNodes[i].onmouseover = function () {
                    oldClassName = this.className;
                    this.className = "overColor";
                }
                rowNodes[i].onmouseout = function () {
                    this.className = oldClassName;
                }
            }
        }
        
        //复选框全选函数
        function checkAll() {
            var currentCheckNode = event.srcElement;
            var checkAllNodes = document.getElementsByName("all");
            //把没有点击的全选复选框去除复选
            for (var i = 0; i < checkAllNodes.length; i++) {
                if (currentCheckNode != checkAllNodes[i]) {
                    checkAllNodes[i].checked = false;
                }
            }
            var checkItemNodes = document.getElementsByName("item");
            for (var i = 0; i < checkItemNodes.length; i++) {
                checkItemNodes[i].checked = currentCheckNode.checked;
            }
        }
 
        //按钮选择函数
        function btnCheckboxSel(index) {
            var checkItemNodes = document.getElementsByName("item");
            for (var i = 0; i < checkItemNodes.length; i++) {
                if (index == 2) {
                    checkItemNodes[i].checked = !checkItemNodes[i].checked;
                }
                else {
                    checkItemNodes[i].checked = index;
                }
            }
        }
 
        //每行的返回上级页面按钮
        function btnOut(btn) {
        	var tblMain = document.getElementById("tblMain");
            var delRowNode = btn.parentNode.parentNode;
            var sMsg = "您是否要返回【" + delRowNode.cells[1].innerText + "】栋页对栏面进行操作";
            if (window.confirm(sMsg)) {
                //tblMain.tBodies[0].removeChild(delRowNode);
                TableColor();
            }
        }
        
        //删除所选项按钮函数
        function btnDelSelectRow() {
 
            var arrDel = new Array();
            var pos = 0;
            var itemNodes = document.getElementsByName("item");
            for (var i = 0; i < itemNodes.length; i++) {
                if (itemNodes[i].checked) {
                    arrDel[pos] = itemNodes[i].parentNode.parentNode;
                    pos++;
                }
            }
 
            if (pos <= 0) {
                return;
            }
 
            if (!window.confirm("是否要删除选择的数据?"))
                return;
 
            var tblMain = document.getElementById("tblMain");
            for (var i = 0; i < arrDel.length; i++) {
                tblMain.tBodies[0].removeChild(arrDel[i]);
            }
        }
        window.onload = CreateMyTable;
    </script>
</head>
<body>
    <table id="tblMain" cellspacing="0" cellpadding="10px" align="center">
     <tr class="CTitle" >
		<td height="22" colspan="9" align="center" style="font-size:16px">猪只操作表</td>
	</tr>
        <tbody>
            <tr>
                <th>选项</th>
                <th>栋号</th>
                <th>栏号</th>
                <th>耳号</th>
                <th>操作</th>
            </tr>
            <tr>
                
                <th colspan="5">
                    <input type="button" value="全选" onclick="btnCheckboxSel(1)" />
                    <input type="button" value="全清" onclick="btnCheckboxSel(0)" />
                    <input type="button" value="反选" onclick="btnCheckboxSel(2)" />
                    <input type="button" value="删除所选项" onclick="btnDelSelectRow()" />
                </th>
            </tr>
        </tbody>        
    </table>
</body>
</html> 