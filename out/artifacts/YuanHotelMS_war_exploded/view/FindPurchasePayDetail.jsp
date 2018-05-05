<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'findsales.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link rel="stylesheet" type="text/css" href="themes2/icon.css">
	<link rel="stylesheet" type="text/css" href="themes2/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css">
	<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/datagrid-detailview.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<style type="text/css">
	.c{
		width: 200px;
		height: 40px;
		}
		html { overflow:hidden; }
	</style>
	
  </head>
  <body>
  <form action="" method="post" id="from2">
    <div style="margin-left: 200px; font-size: 15px; margin-top: 100px;">
    	<c:forEach items="${list}" var="b">
    		<div style="float: left;margin-top: 10px;">明细单号：</div><input type="text" value="${b.payDetaId}" readonly="readonly" name="payDetaId" class="form-control c" ><br/><br/>
    		<div style="float: left;margin-top: 10px;">付款单号：</div><input type="text" value="${b.payId }" readonly="readonly" name="payId" id="payId" class="form-control c"><br/><br/>
    		<div style="float: left;margin-top: 10px;">采购单号：</div><input type="text" value="${b.orderId }" readonly="readonly" name="orderId" class="form-control c"><br/><br/>
    	</c:forEach>
    </div>
    <a href="javaScript:" class="btn btn-default" onclick="a()" id="btn" style="width: 70px;height: 35px; font-size: 16px; margin-left: 446px;">付款</a>
    </form>
    <script type="text/javascript">

    $("#btn").click(function(){
    layer.msg('确定进行付款吗？', {
  time: 0 //不自动关闭
  ,btn: ['是', '否']
  ,yes: function(index){
    var id = $("#payId").val();
    document.forms.from2.action="listPayD?id="+id;
	document.forms.from2.submit();
  }
});
    })
    
    </script>
   </body>
</html>
