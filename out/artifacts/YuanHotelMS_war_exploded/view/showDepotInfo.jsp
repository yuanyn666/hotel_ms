<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"   %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cangku.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
  </head>
  
  <body>
    <div id="t1" style=" width:900px; height:360px; border: 1px solid black; margin: 50px 50px;">
    
    <div class="modal-header" style="width: 870px;height: 20px; ">
    <a href="insertDepotInfo1" class="btn btn-default" style="float: right; width: 100px;">添加</a>
	<h3>仓库信息表</h3>
	</div>
    <table class="table table-hover" style="width: 900px;height: 100px;">
    <tr><td>仓库编号</td><td>名称</td><td>最大库存</td><td>操作</td></tr>
    <c:forEach items="${list}" var="s">
    <tr>
    <td>${s.depotId}</td>
    <td>${s.depotName}</td>
    <td>${s.depotNum}</td>
    <td><a href="findByIdDe?depotId=${s.depotId}" class="btn btn-primary">修改</a>
    </tr>
    </c:forEach>
    </table>
    </div>
  </body>
</html>
