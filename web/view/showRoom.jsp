<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>显示房间信息</title>
    
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
width:850px; 
height:50px;
text-align:center;
margin:0px auto;
overflow: auto;
}
.ta{
width:850px; 
height:50px;
border: 1px solid gray;
text-align:center;
margin-top:0px;
margin-left:60px;
overflow: auto;
}
#showR{
width:850px; 
height:500px;
margin-top:0px;
margin-left:60px;
border: 1px solid gray;
overflow: auto;
}
#select{
margin-right: 180px;
}
#add{
margin-right: 50px;
}
	</style>

  </head>
  
  <body> 
 	
 	<form action="findByRoomType" method="post">
 	<table class="table table-striped table-hover ta">
 	<tr>
    <td colspan="7" style="text-align: center;">
    选择房类
    <select name="roomTypeId">
    <option value="0">所有房类</option>
    <c:forEach items="${rtlist}" var="rt">
    <option value="${rt.roomTypeId}">${rt.roomType}</option>
    </c:forEach>
    </select>
   <input type="submit" id="select" value="查询" class="btn btn-primary"/>
   <a href="showRoomType" class="btn btn-primary">查看房类</a>
   <a href="findforInsert" id="add" class="btn btn-primary">添加房间</a>
    </td>
     </tr>
 	</table>
 	</form>
 	<div id="showR">
     <table  class="table table-striped table-hover tw">
   <tr>
   <td>房间号</td><td>房类</td><td>房价</td><td>房态</td><td>电话</td><td>编辑房间</td>
   </tr>
   <c:forEach items="${list}" var="r">
   <tr>
   <td>${r.roomId}</td>
   <td>${r.roomType.roomType}</td>
   <td>${r.roomType.roomPrice}</td>
   <td>${r.roomState.roomState}</td>
   <td>${r.roomPhone}</td>
   <td>
   <a href="findRoomById?roomId=${r.roomId}" class="btn btn-primary">修改</a>
   <a href="deleteRoom?roomId=${r.roomId}" class="btn btn-primary" onclick='return confirm("您忍心删除吗？");'>删除</a></td>
   </tr>
   </c:forEach>
   <c:if test="${not empty roomRT}">
   <c:forEach items="${roomRT}" var="r">
   <tr>
   <td>${r.roomId}</td>
    <td>${r.roomType.roomType}</td>
    <td>${r.roomType.roomPrice}</td>
   <td>${r.roomState.roomState}</td>
   <td>${r.roomPhone}</td>
   <td>
   <a href="findRoomById?roomId=${r.roomId}" class="btn btn-primary">修改</a>
   <a href="deleteRoom?roomId=${r.roomId}" class="btn btn-primary" onclick='return confirm("您忍心删除吗？");'>删除</a></td>
   </tr>
   </c:forEach>
   </c:if>
   </table>
   </div>
  </body>
</html>
