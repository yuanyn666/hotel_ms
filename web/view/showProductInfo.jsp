<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品信息主表</title>
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
	<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css">
  
  	<link rel="stylesheet" href="css/bootstrap.min.css">
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

	
  </head>
  
  <body>
  <div style=" width:920px; height:360px; border: 1px solid black; margin: 50px 50px; overflow: scroll;">
  
 <div class="modal-header" style="width: 870px;height: 20px; ">
 	<h4 class="modal-title" id="myModalLabel" style="margin-bottom: -11px;">商品信息
 	<a href="insertProductInfo1" class="btn btn-default" style="float: right; width: 60px;margin-top: -11px;">添加</a>
 	<a href="findAllP1" class="btn btn-primary" style="float: right; width: 60px;margin-top: -11px;">查找下架</a>
 	</h4>
 	<form action="findName" method="post" style="width: 350px; float: right;margin-top: -20px;"> 
 	<input type="text" name="productName" placeholder="输入商品名称关键字" /> 
    <input id="sub" type="submit" value="搜索"  class="btn btn-primary" style="margin-bottom:11px; width: 100px;" />
   </form>
    
</div>
    <table class="table table-hover " style="width: 900px;">
    <tr style="height: 30px;" >
    <td>商品编码</td>
    <td>商品名称</td>
    <td>商品产地</td>
    <td>进货价格</td>
    <td>销售价格</td>
    <td>商品类别</td>
    <td>商品说明</td>
    <td>操作</td>
    </tr>
    <c:forEach items="${list}" var="s">
    <tr >
    <td>${s.productId}</td>
    <td>${s.productName}</td>
    <td>${s.productAddress}</td>
    <td>${s.buyPrice}</td>
    <td>${s.retailoPrice}</td>
    <td>${s.productSort}</td>
    <td>${s.productUction}</td>
    <td>
    <a href="findByIdP?id=${s.productId}" class="btn btn-primary" >修改</a>
    <a href="updateState?productId=${s.productId}" class="btn btn-primary" >下架</a>
	</td>
    </tr>
    </c:forEach>

    </table>
</div>
<script type="text/javascript">

</script>

  </body>

  
</html>

