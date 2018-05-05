<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查看房类</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="bootstrap.min.js"></script>
	<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
	<style>
	a{
text-decoration: none;
color: black;
}
.tw{
border: 1px solid gray;
width:700px; 
height:50px;
overflow: auto;
}
#showRT{
width:700px; 
height:500px;
margin-top:0px;
margin-left:100px;
overflow: auto;
}
</style>

  </head>
  
  <body>
  <div id="showRT">
    <table class="table table-striped table-hover tw">
    <tr>
    <td></td><td></td><td></td><td></td><td></td>
    <td><a href="view/insertRoomType.jsp" class="btn btn-primary">添加房类</a></td>
    </tr>
    <tr>
    <td>房类</td><td>房价</td><td>押金</td>
    <td>预定金</td><td>介绍</td><td>编辑房类</td>
    </tr>
    <c:forEach items="${rtlist}" var="rt">
    <tr>
    <td>${rt.roomType}</td>
    <td>${rt.roomPrice}</td>
    <td>${rt.money}</td>
    <td>${rt.bookMoney}</td>
    <td>${rt.roomMark}</td>
    <td><a href="findRTById?roomTypeId=${rt.roomTypeId}" class="btn btn-primary">修改</a>
    <a href="deleteRT?roomTypeId=${rt.roomTypeId}" class="btn btn-primary" onclick='return confirm("您忍心删除吗？");'>删除</a></td>
    </tr>
    </c:forEach>
     </table>
    </div>
  </body>
</html>
