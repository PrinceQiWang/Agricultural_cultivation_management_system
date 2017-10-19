<%@ page language="java" import="java.util.*,clas.Code,Dao.CodeDao" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" type="image/ico" href="/images/favicon.ico" />
    <title>Login</title>
    <link href="styles.css" type="text/css" media="screen" rel="stylesheet" />
    <link href="jquery-ui-1.8.16.custom.css" rel="stylesheet"></link>
    <script src="jquery-1.6.2.min.js"></script>
    <script src="jquery-ui-1.8.16.custom.min.js"></script>
    <script type="text/javascript" src="jquery.keyboard.extension-typing.js"></script>
    <link type="text/css" href="keyboard.css" rel="stylesheet" />
    <script type="text/javascript" src="Jjquery.keyboard.js"></script>


    

</head>
<body id="login">
    <div id="wrappertop">
    </div>
    <div id="wrapper">
        <div id="content">
            <div id="header">
                <h1>
                    <a href="">
                      </a></h1>
            </div>
            <div id="darkbanner" class="banner320">
                <h2>
                    系统登录</h2>
            </div>
            <div id="darkbannerwrap">
            </div>
            <form name="form1" method="post" action="index.php">
            <fieldset class="form">
                <p>
                    <label class="loginlabel" for="user_name">
                        用户名:</label>
                    <input class="logininput ui-keyboard-input ui-widget-content ui-corner-all" name="user_name"
                        id="user_name" type="text" value="" />
                </p>
                <p>
                    <label class="loginlabel" for="user_password">
                        密码:</label>
                    <span>
                        <input class="logininput"   name="user_password" id="user_password" type="password" />
                </p>
                <button id="loginbtn" type="button" class="positive" name="Submit">
                    <img src="images/key.png" alt="Announcement" />登录</button>
              
 
            </fieldset>
        </div>
    </div>
 
	<div style="text-align:center;">
</div>
</body>