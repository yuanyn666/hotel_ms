<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
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
  
  <input type="hidden" value="${state}" id="state" />
  <form action="" method="post" id="from1">
  <div style="overflow: scroll; height: 200px;" >
  	<table class="table" >
  	<tr><td>商品ID</td><td>商品名称</td><td>商品数量</td><td>商品单价</td><td>金额</td></tr>
    <c:forEach items="${list}" var="b">
    	<tr style="height: 30px;">
    	<td><input type="text" value="${b.productId }" class="c1" style="color: red"  name="productId" readonly="readonly"></td>
    	<td><input type="text" value="${b.productName }" class="c1" style="color: red"  name="productName" readonly="readonly"></td>
    	<td><input type="text" value="${b.productSum }" class="c1" style="color: green" name="productSum" onkeyup="b(this)"></td>
    	<td><input type="text" value="${b.buyPrice }" class="c1" style="color: red"  name="buyPrice" readonly="readonly"></td>
    	<td><input type="text" value="${b.productSum*b.buyPrice}" style="color: red" class="c1" readonly="readonly" name="zje"/></td>
    	</tr>
    </c:forEach>
    </table>
    </div>
  
 
   <div style="border: 1px solid red; width: 400px; height: 200px; float: left; margin-top: 0px; margin-left: 0px; " id="d2">
			<h4 style="" align="center">采购专用</h4>
			 <span style="margin-left: 10px; ">登录人：<input type="hidden"  style="width:90px;" value="${myUsers.userId }" name="UserId" readonly="readonly" id="UserId"><input type="text"  style="width:90px;margin-top: 7px;" value="${myNames }" name="UserId1" readonly="readonly" ></span> 
   <div style="float: left; width: 180px;margin-left: 15px;">
   
   		<p style="margin-top: 10px;">共同操作人:
   		<input type="text" style="width: 80px" id="userName1">
   		<input type="hidden" id="userId1" value="" name="userId1">
   		</p>
  		<p style="margin-top: 10px; margin-left: 43px;"> 密码:<input type="password"  style="width: 80px" id="pwd1" name="userName"></p>
  		<p style="margin-top: 10px;margin-left: 30px;"><span id="ok" style="width: 40px; font-size: 18px; color: green"></span><input type="button" value="验证"style="width: 90px; height: 35px;margin-left: 10px;" id="sub"/></p>
   </div> 
    <div style="float: left;width: 190px; margin-left: 10px; ">
    <textarea name="mark" placeholder="请输入备注" style="width: 150px; height: 55px;margin-top: 10px;margin-right: 10px;" id="ma"></textarea><br/>
    <h5 style="margin-left: 10px;margin-top: -10px; color: red">输入付款备注（<input type="text" value="50" readonly="readonly" id="sp" style="width: 25px; border: 0px;">字）</h5>
    </div>
    </div>
    <div style="margin-top: 50px;float: left; width: 240px;" id="d1">
    <input type="button" value="修改" id="btn1"style="width: 100px; height: 40px; margin-left: 70px;"><br/><br/>
    <input type="button" value="采购" id="btn2"style="width: 100px; height: 40px; margin-left: 70px;" ><br/>
    <span style="margin-left: 70px; font-size: 20px; "><input type="text" style="border: 0px;width: 90px; font-weight: bold;color: red;" value="" id="je" readonly="readonly"/></span>
   </div>
    </form>
	 <!-- -->
    <script type="text/javascript">
    //验证登录
     $("#sub").click(function(){
     var pwd1=$("#pwd1").val();
     var userName1=$("#userName1").val();
     var userid = $("#UserId").val();
 $.post('CheckKuCun',{names:userName1,userPwd:pwd1,userId:userid},function(data){
	if(data>0){
	 $("#ok").text("OK");
	 $("#userId1").val(data);
	}else if(data==0){
		alert("共同操作人不能与登录人相同！");
	}else{
	alert("抱歉，亲。您输入的账户有误！");
	$("#pwd1").val("");
	$("#userName1").val("").focus();//获取焦点
	}
   });
  });
   
   
    
    $("#btn1").click(function(){
    	layer.msg('确定进行修改吗？', {
  time: 0 //不自动关闭
  ,btn: ['是', '否']
  ,yes: function(index){
    layer.close(index);
	//var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
	//parent.layer.close(index); //再执行关闭
	document.forms.from1.action="updatePlanDetail?id=${planId}";
	document.forms.from1.submit();
	layer.msg('修改成功,请刷新查看',{icon: 1});
  }
});	
    })
    
    $("#btn2").click(function(){
    var a = $("#ok").text();
    if(a!="OK"){
    alert("先选择一个共同操作人吧！");
    }else{
    layer.msg('确定进行采购吗？', {
  time: 0 //不自动关闭
  ,btn: ['是', '否']
  ,yes: function(index){
    layer.close(index);
    document.forms.from1.action="adPurchaseOrder?id=${planId}";
	document.forms.from1.submit();
	layer.msg('采购成功,前去付款吧',{icon: 1});
  }
});	}
    })
    
    
    window.onload=function()
    {
  	var str=0;
 	 obj = document.getElementsByName("zje");
  	for(i=0;i<obj.length;i++){
  	str += parseInt(obj[i].value);
    }
   $("#je").val("￥（"+str+"）元");
   
   var a= $("#state").val();
   if(a=="已审核")
   {
   		$("#d1").css('display','none');
   		$("#d2").css('display','none');
   }
    }
    
    function b(node)
    {
    $(node).parent().next().next().children().val($(node).val()*$(node).parent().next().children().val());
    var str=0;
 	 obj = document.getElementsByName("zje");
  	for(i=0;i<obj.length;i++){
  	str += parseInt(obj[i].value);
    }
   $("#je").val("￥（"+str+"）元");
    }
    
    
    $("#ma").keydown(function(event){
    var keyCode = event.keyCode;
    if(keyCode==8)
    {
    	var sum = $("#ma").val().length-1;
    	if(sum<=0){
    	$("#sp").val("50");
    	}else{
    	$("#sp").val(50-parseInt(sum));}
    }else{
    	var sum = $("#ma").val().length+1;
    	var str = $("#ma").val().substring(0,49);
    	$("#ma").val(str);
    	$("#sp").val(50-parseInt(sum));
    	
    	if(sum>=50){
    	$("#sp").val("0");
    	}
    }
})
    </script>
   </body>
</html>
