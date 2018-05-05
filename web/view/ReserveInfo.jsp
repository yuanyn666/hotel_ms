<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>所有预定信息显示</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="themess/black/easyui.css">
	<link rel="stylesheet" type="text/css" href="themess/default/easyui.css">   
	<link rel="stylesheet" type="text/css" href="themess/icon.css"> 
	<script type="text/javascript" src="bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
	<style>

	</style>
  </head>
  
  <body>
 <table class="table table-striped table-hover">
	<caption><h4>所有客人预定信息</h4></caption>
	<thead>
		<tr>
			<th>客户名称</th>
			<th>客户电话</th>
			<th>房间类型编号</th>
			<th>房间号</th>
			<th>预抵时间</th>
			<th>保留时间</th>
			<th>预定时间</th>
			<th>已交金额</th>
			<th>客户类型</th>
			<th>总金额</th>
			<th>备注</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list}" var="s">
		<tr>
		<td>${s.customerName }</td>
		<td>${s.customerPhone }</td>
		<td>${s.roomtype.roomType}</td>
		<td>${s.roomId }</td>
		<td>${endTime }</td>
		<td>${s.keepTime }</td>
		<td>${s.reserveTime }</td>
		<td>${s.bookMoney }</td>
		<td>${s.customerType.cTypeName }</td>
		<td>${s.totalMoney }</td>
		<td>${s.remark }</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
 
 
 
 
  </body>
  <script type="text/javascript">

  </script>
</html>
