<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<script type="text/javascript" src="js/jquery-1.8.0.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<style type="text/css">
	body{ font-size: 18;}
	p input{width: 150px; height: 25px;}
	span{ margin-left: 100px;}
	a{font-size: 18; color: red;}
	a:hover {
	text-decoration: none;
}
</style>
  </head>
  
  <body>
  <div style="width: 810px; height: 420px; border: 1px solid black; margin: 50px 80px;">
   <div class="modal-header" style="width: 780px;height: 30px;">
        <h4 class="modal-title" id="myModalLabel">添加商品信息
        <a href="findAllP" class="btn btn-default" style="float: right;">取消添加</a>
        </h4>
</div>
    <form action="insertP" method="post" name="myform">
    <div class="modal-body" style="width: 780px;height: 270px;"><br/>
    <p>
    <span>商品编码:<a>*</a><input id="t1"  onblur="show1()" maxlength="10"  type="text" value="${date}"  readonly="readonly" name="productId" class="form-control" placeholder="输入商品编码" style="height: 30px;" /></span>
    <span> 商品名称:<a>*</a><input id="t2"  onblur="show2()" maxlength="10" type="text" name="productName" onkeyup="value=value.replace(/[\d]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[\d]/g,''))"  class="form-control" placeholder="输入商品名称" style="height: 30px;"/></span>
    </p>
    <p>
   <span> 
   商品产地:<a>*</a><input  id="t3" onblur="show3()" maxlength="10" type="text" name="productAddress"  onkeyup="value=value.replace(/[\d]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[\d]/g,''))" class="form-control" placeholder="输入商品产地" style="height:30px;"/>
   </span>
   <span>
   商品类别:<a>*</a>
   <select name="productSort" style="width: 150px;" >
  			<option value="">选择商品类别</option>
  			<option value="饮品">饮品</option>
  			<option value="名烟">名烟</option>
  			<option value="日化用品">日化用品</option>
		</select> 
		</span>
    </p>
    <p>
   <span> 进货价格:<a>*</a><input maxlength="5"  onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" type="text" name="buyPrice" class="form-control" placeholder="输入进货价格"  style="height: 30px;"/></span>
    <span>销售价格:<a>*</a><input maxlength="5" onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" type="text" name="retailoPrice" class="form-control" placeholder="输入销售价格"  style="height: 30px;"/></span>
    </p>
    <p>
    <input type="hidden" value="0" name="state" />
    <span>商品说明:<input maxlength="50" type="text" name="ProductUction"class="form-control" placeholder="输入商品说明" style="width:480px;height: 50px;"/></span>
    </p>
</div>
            
<div class="modal-footer" style="width: 780px;height: 40px;text-align: center;">
<input type="submit" value="添加" id="sub" class="btn btn-primary" style="width: 100px;height: 30px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" class="btn btn-default" value="重置" style="width: 100px;height: 30px;"/>
</div>
    </form>
    
    </div>
  </body>
<script type="text/javascript">
window.onload=function(){
var sub=document.getElementById("sub");
sub.onclick=function(){
if(document.myform.productId.value==""){
alert("商品编码不能为空!");
return false;
} else if(document.myform.productName.value==""){
alert("商品名称不能为空!");
return false; 
}else if(document.myform.productAddress.value==""){
alert("商品产地不能为空!");
return false; 
}else if(document.myform.productSort.value==""){
alert("商品类别不能为空!");
return false; 
}else if(document.myform.buyPrice.value==""){
alert("进货价格不能为空!");
return false; 
}else if(document.myform.retailoPrice.value==""){
alert("销售价格不能为空!");
return false; 
}
}}

</script>

</html>
