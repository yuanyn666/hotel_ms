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
    
    <title>My JSP 'UsersInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css">
	<link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="themes/icon.css">
	<script src="js/bootstrap.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script  src="js/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
	<style>
body{font-size: 16px;}
	a{text-decoration: none;
	color: green;
	}
	input{margin: 3px;}
	</style>
  </head>
  
  <body>
  <div class="container-fluid"> 
	
		<form class="navbar-form navbar-left" action="UsersAllBy" method="post">
		用户名：<input type="text" class="form-control" name="names" placeholder="员工姓名">
		职位：<select name="usersRoleId">
		<option value="0">所有职位</option>
		<c:forEach items="${myrole}" var="mr">
		<option value="${mr.roleId}">${mr.roleName}</option>
		</c:forEach>
		</select>	
		&nbsp;&nbsp;<button type="submit" class="btn btn-default">查找</button>
		<div class="pull-right"><a  href="findAllMyRoleC" class="btn btn-default">添加新用户</a></div>
		</form>
	
	</div>
    
  
  <table class="table table-striped table-hover">
	<caption><h4>员工基本信息</h4></caption>
	<thead>
		<tr>
		<th>员工姓名</th>
			<th>职位</th>
			<th>电话</th>
			<th>性别</th>
			<th>地址</th>
			<th>表现状态</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${listUsers}" var="s">
		<tr><td>${s.names }</td>
		<td>${s.roleName }</td>
		<td>${s.phone }</td>
		<td>${s.userSex }</td>
		<td>${s.address }</td>
		<td>${s.userFla }</td>
		 <td><a href="findUserByidC?userId=${s.userId}" class="btn btn-default">修改</a>
   				<a href="deleteUserByidC?userId=${s.userId}"  id="del" class="btn btn-default">删除</a></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
  
 
     <script>
  function show1(str){
	  alert(str);
var roomSid=$(str)parent().parent().children().val();//获取当前按钮的下一个元素的值
alert(roomSid);

}
  </script>
  </body>
 
</html>
