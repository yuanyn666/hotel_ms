<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Depotproduct.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="themes/icon.css">
	<link rel="stylesheet" type="text/css" href="themes/bootstrap/easyui.css">
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
	.c1{
		border: 0px;
		width: 80px;
		}
	html { overflow:hidden; }
	</style>
  </head>
  
  <body>
  <form action="addStiorage" method="post">
  <div style="margin-left: 100px; margin-top: 10px;">
 入库单号 :<input type="text" value="${rukudan}"readonly="readonly" name="stiorageId" style="width: 155px;"> 
 <span style="margin-left: 30px;">操&nbsp;作&nbsp;人：<input type="hidden"  style="width:150px;" value="${myUsers.userId }" name="UserId" readonly="readonly" ><input type="text"  style="width:80px;" value="${myNames }"  readonly="readonly" ></span><br/>
 采购单号 :<input type="text" value="${orderId}"readonly="readonly" name="orderId"  style="width: 155px;">
 <span style="margin-left: 30px;">入库时间 :<input type="text" value="${Depotime}"readonly="readonly" name="Depotime"  style="width: 155px;"> </span>

 </div>
 <div style="overflow: scroll; height: 195px;" >
    <table class="table">
  	<tr><td>商品ID</td><td>商品名称</td><td>商品数量</td><td>单价</td><td>实际入库数量</td></tr>
    <c:forEach items="${list}" var="b">
    	<tr>
    	<td><input type="text" value="${b.productId }" class="c1"  name="productId" readonly="readonly"></td>
    	<td><input type="text" value="${b.productName }" class="c1"  name="productName" readonly="readonly"></td>
    	<td><input type="text" value="${b.productSum }" class="c1" readonly="readonly"></td>
    	<td><input type="text" value="${b.buyPrice }" class="c1"  name="buyPrice" readonly="readonly"></td>
    	<td><input type="text" value="${b.productSum }" style="color: red" class="c1" name="productSum"/></td>
    	</tr>
    </c:forEach>
    </table>
    </div>
   
    
 <div class="modal-footer" style="width: 630px;height: 60px;text-align: center;">
 <div style="float: left;width: 250px;">
 共同入库人：<input type="text" style="width: 100px;" id="userName1" >
 <input type="hidden" name="userId1" id="userId1">
 
 <br/>
 <span style="margin-left: 38px;">
 密码：<input type="password" style="width: 100px;" id="pwd1" ></span>
 <p style="margin-top: 10px;margin-left: 30px;"><span id="ok" style="width: 40px; font-size: 18px; color: green"></span>
  		<input type="button" value="验证"style="width: 90px; height: 35px;margin-left: 10px;" id="sub"/></p>
  		
 </div>
 <input type="submit" value="入库" id="sub" class="btn btn-primary" style="width: 100px;height: 30px; float: right;"/>
 <div style="float: right; width: 250px;" >
  <textarea name="mark" placeholder="入库说明" style="width: 150px; height: 25px; margin-right:100px;"></textarea><br/>
  <select name="godownId" style="margin-right:100px; width: 166px;" >
    	<option value="1">服务类仓库</option>
    	<option value="2">小吃类仓库</option>
    </select>
    </div>

</div>
  
  </form>
  </body>
  <script type="text/javascript">
   $("#sub").click(function(){
     var pwd1=$("#pwd1").val();
     var userName1=$("#userName1").val();
 $.post('CheckKuCun',{names:userName1,userPwd:pwd1},function(data){
	if(data>0){
	 $("#ok").text("OK");
	 
	 $("#userId1").val(data);
	}else {
	alert("抱歉，亲。您输入的账户有误！");
	$("#pwd1").val("");
	$("#userName1").val("").focus();//获取焦点
	}
   });
  });
  
  
  </script>
</html>
