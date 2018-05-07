<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'PurchasePay.jsp' starting page</title>
    
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
	<link rel="stylesheet" type="text/css" href="css/bootstrap1.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min1.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive1.css">
	<link rel="stylesheet" type="text/css" href="css/pace-theme-barber-shop1.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/datagrid-detailview.js"></script>
	<script type="text/javascript" src="js/pace.js"></script>
	<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
	
	<script type="text/javascript" src="layer/layer.js"></script>
	<style type="text/css">
	.c{
		width: 200px;
		height: 40px;
		}
	#myTabContent div{width: 500px;
	height: 400px;margin-left: 100px;
	}
	html{overflow: auto;}
	</style>
  </head>
  
  <body style="">
   <form action="" method="post" id="from2">
    <div id="sal3" style="position: absolute; z-index:3; background-color: white">
  <div style="display: none; width: 500px; margin-left: 250px;" id="sal">
  
  <c:forEach items="${list}" var="b">
    			<div style="margin-top: 10px;">明细单号：</div> 
    			<input type="text" value="${b.payDetaId}" readonly="readonly" name="payDetaId" class="form-control c" >
    		
    			 <div style=" margin-top: 10px;">付款单号：</div>
    			<input type="text" value="${b.payId }" readonly="readonly" name="payId" class="form-control c" >
    		
    		 <div style=" margin-top: 10px;">采购单号：</div> 
    		<input type="text" value="${b.orderId }" readonly="readonly" name="orderId" class="form-control c" >
    	</c:forEach>
  
  
  </div>
  <div id="sal2" style="width: 500px;font-size: 20px;margin-left: 350px;">查看详情</div>
  </div>
  <div style="position: absolute;z-index: 2;margin-top: 20px;">
    <ul id="myTab" class="nav nav-tabs" style="width: 500px;">
	<li class="active" id="li1">
		<a href="#home" data-toggle="tab" style="font-size: 20px;">支付宝</a>
	</li>
	<li><a href="#ios" data-toggle="tab" style="font-size: 20px;">微信</a></li>
	<li><a href="#styrr" data-toggle="tab" style="font-size: 20px;">银联卡</a></li>
</ul>
<div id="myTabContent" class="tab-content">
	<div class="tab-pane fade in active" id="home">
	<img src="images/pay1.png"></img>
	</div>
	<div class="tab-pane fade" id="ios" align="center">
		<img src="images/pay2.png"></img>
	</div>
	<div class="tab-pane fade" id="styrr" align="center">
		<img src="images/pay3.png" style="margin-top: 50px;"></img>
	</div>
</div>
<div id="radio" style="margin-left: 20px;">
<span style="font-size: 20px;">选择收货地址:</span>
<input type="radio" name="address" value="河南省郑州市郑州大学北校区123宿舍第一床位">河南省郑州市郑州大学北校区123宿舍第一床位<br/>
<span style="margin-left: 130px;">
<input type="radio" name="address" value="河南省郑州市郑州大学科学大道100号">河南省郑州市郑州大学科学大道100号
</span>
</div>
<input type="hidden" value="支付宝" id="text1" name="types">
<a href="javaScript:" class="btn btn-default" onclick="a()" id="btn" style="width: 70px;height: 35px; font-size: 16px; margin-left: 200px; margin-top: 0px;">付款</a>
</div>
    
</form>    

    <script type="text/javascript">
    $("li").click(function(){
	var a =$(this).text();
	$("#text1").val(a);
	})
    
    $("#btn").click(function(){ 
    var b= $("#text1").val();
    var r =$('input[name="address"]:checked').val();
    if(r==undefined)
    {
    alert("请选择收货地址！");
    }else{
    
    layer.msg('确定进行付款吗？', {
  time: 0 //不自动关闭
  ,btn: ['是', '否']
  ,yes: function(index){
    layer.close(index);
    document.forms.from2.action="updatePay?address="+r;
	document.forms.from2.submit();
  }
});
    
}
    })
    



$("#sal2").click(function(){
if($("#sal2").text()=="查看详情")
{
$("#sal").show(1000);
$("#sal2").text("关闭详情");
}else
{
$("#sal").hide(1000);
$("#sal2").text("查看详情");
}
})
    
    </script>
  </body>
</html>
