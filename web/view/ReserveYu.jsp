<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>同福酒店管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"></link>
	<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css"></link>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css"></link>
	
	<link rel="stylesheet" type="text/css" href="themess/black/easyui.css">
	<link rel="stylesheet" type="text/css" href="themess/default/easyui.css">   
	<link rel="stylesheet" type="text/css" href="themess/icon.css"> 
	  <script type="text/javascript" src="js/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script> 
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	#show{
	width: 600px;height: 500px;text-align:center;border: 1px solid gray;margin:20px auto;
	}
	.font{font-size: 25px;}
	#kehu{font-size: 28px;color:red;}
	#room{font-size:28px;color:blue;}
	#time{font-size:28px;color:purple;}
	#top{width: 600px;height: 200px;border: 1px solid gray;text-align:center;margin:20px auto;background-color:#C8E8FF;}
	#bottom{width: 600px;height: 200px;border: 1px solid gray;text-align:center;margin: 50px auto;background-color:#C8E8FF; }
	</style>
  </head>
   <body>
   <div id="show">
   <div id="top">
   <p class="font"><label id="kehu">${reser.customerName }</label>您好，恭喜您！</p>
   <p class="font">成功预定了我们同福酒店的<label id="room">${reser.roomId }</label>房间</p>
   </div>
   <div id="bottom">
   <p class="font">请您在${reser.endTime}之前到达酒店入住</p>
   <p class="font">提前祝您入住愉快!</p>
   </div>
   <a href="TongFu">再次预定</a>
</div>
  </body>
  
</html>