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
    
    <title>库存管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<script type="text/javascript" src="js/jquery-1.8.0.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
<link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="themes/icon.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>

  </head>
  
  <body>  
<div id="t1" style=" width:920px; height:360px; border: 1px solid black; margin: 50px 50px; overflow: scroll;">

 <div class="modal-header" style="width: 870px;height: 20px; ">
 	<input type="button" value="添加退货单" id="btn1" class="btn btn-default" style="float: right;" >
 	<form action="findProducttype" method="post" style="float: right; width: 400px;"> 
 	
 	<input type="text" name="producttype" placeholder="输入商品类别关键字"  style="height: 30px;"/> 
    <input  type="submit" value="搜索" class="btn btn-primary" style="margin-bottom:11px; width: 100px;" />
   </form>
    <h4 class="modal-title" id="myModalLabel">仓库商品信息</h4>
</div>


    <table class="table table-hover" style="width: 900px;height: 100px; ">
    <tr>
    <td>商品名称</td>
    <td>类别</td>
    <td>库存数量</td>
    <td>总金额</td>
    <td>存放仓库</td>
    </tr>
    <c:forEach items="${list}" var="s">
    <tr>
    <td>${s.productName}</td>
    <td>${s.productType}</td>
    <td>${s.depotNum}</td>
    <td>${s.totalMoney}</td>
    <td>${s.depotName}</td>
    </tr>
    </c:forEach>
    </table>
</div>
<script type="text/javascript">

$("#btn1").click(function(){
  	layer.open({
  type: 2 //Page层类型
  ,area: ['990px', '600px']
  ,title: '退货页面'
  ,shade: 0.6 //遮罩透明度
  ,anim: 3 //0-6的动画形式，-1不开启
  ,content: 'returnDan',
  offset: '70px'
});
  	})
</script>

  </body>
</html>
