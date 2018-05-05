<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/datagrid-detailview.js"></script>
 	<script type="text/javascript" src="layer/layer.js"></script>
 	<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
 <style type="text/css">
body{ font-size: 15px;}
html { overflow:hidden; }
 </style>
  </head>
  <script type="text/javascript">
   var n =1;
 function del(n){
    		$('#tr'+n).remove();//删除
    	}
    	
    	
    	
    	
function a(){	
var g = $('#pro').combogrid('grid');	// 获取表格控件对象
var r = g.datagrid('getSelected');//获取表格当前选中行
if(r==null)
{
alert("请选择商品!");
}else{
var d = $("#sum").val();
if(d=="")
{
d=1;
}
  $("#table").append("<tr id='tr"+n+"'><td><input type='text' name='productId' readonly='readonly' value="+r.productId+"></td>"+
"<td><input type='text' name='productName' readonly='readonly' value="+r.productName+"></td>"+
"<td><input type='text'  name='returnNum' readonly='readonly' value="+d+"></td>"+
"<td><input type='text'  name='price'  readonly='readonly' value="+r.buyPrice+"></td>"+
"<td><input type='text'  name='totalMoney' readonly='readonly' value="+d*r.buyPrice+"></td>"+
"<td><input type='text'  name='returnMoney' value="+d*r.buyPrice+" onkeyup='retuanMoney(this)'></td>"+
"<td><a href='javascript:del("+n+")'>删除</a></td></tr>");
n++;
}
}
</script>
<style>
table input{border: 0px; width: 65px;}
</style>
  <body>
     <form action="" method="post" id="from2">
     <div style="margin-top: 30px;">
     <span style="margin-left: 10px;" >退货单号: <input  type="text" value="${returnId}" name="returnId"  readonly="readonly"  style="width: 160px; background-color: white;"></span>
   <span style="margin-left: 10px;" >退货时间:<input type="text"  style="width:160px; background-color: white;" name="returnDete" value="${returnDate}" readonly="readonly" ></span>
	操作人：<input type="hidden"  style="width:80px; " value="${myUsers.userId }" name="UserId" readonly="readonly" ><input type="text"  style="width:57px;" value="${myNames }"  readonly="readonly" >
   <br/><br/>
   
   <span style="margin-left: 10px;" >选择商品: <input id="pro" type="text" width="170px;"></span>
   <span style="margin-left: 10px;" >商品数量:<input type="text"  onkeyup="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" id="sum" maxlength='5'   style="width:80px; border: 0px; border-bottom: 1px solid red; background-color: white;" ></span>
 	<span style="margin-bottom: 0px; margin-left: 7px; "> 说明:</span><textarea name="mark" maxlength='50' placeholder="请输入内容" style="width: 160px; height: 50px; " ></textarea>
   </div>
       <div class="modal-header" style="width: 630px;height: 20px; ">
	<h4>退货信息
	<a href="javaScript:" class="btn btn-default" onclick="a()" id="btn"  style=" margin-top: -12px ; margin-left: 493px ;">新增</a>
	</h4>
	</div>
   <div style="overflow: scroll; height: 178px;" >
   <table id="table" class="table" height="140px;" >
   	<tr id="tabletr"><td>商品编号</td><td>商品名称</td><td>商品数量</td><td>商品单价</td><td>应退金额</td><td>实退金额</td></tr>
   </table>
   </div>
<div class="modal-footer" style="width: 630px;height: 30px;text-align: center;">
<input type="submit" value="提交计划" id="sub" class="btn btn-primary" style="width: 100px;height: 30px; float: right;"/>
</div>
   </form>
   
   <script type="text/javascript">
 $("#pro").combogrid({
	panelWidth:170,
	url: 'FindProduct',
	idField:'productId',
	textField:'productName',
	columns:[[
		{field:'productId',title:'商品ID',},
		{field:'productName',title:'商品名称',align:'right',},
		{field:'buyPrice',title:'商品进价',align:'right',},
	]]
});

$("#sub").click(function (){
var a = $("#tabletr").next().text();
if(a=="")
{
	alert("请新增商品！");
}else
{
	document.forms.from2.action="adReturnProduct";
	document.forms.frsom2.submit();
}
})

function retuanMoney(node){
    	var a= $(node).parent().prev().children().val();
    	var b = $(node).val();
    	if(b>a)
    	{
    	alert("实退金额不能大于应退金额！");
    	$(node).val("");
    	}
    	}
  </script>
  </body>
</html>