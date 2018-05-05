<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改</title>
    
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
	<style type="text/css">
	span{ margin-left: 32px;}
	.tw{width:810px; height:30px;margin:10px auto; overflow: auto;}
	</style>
  </head>
  
  <body>
    <div style="width: 810px; height: 355px; border: 1px solid black; margin: 50px 100px;">
  
 <div class="modal-header" style="width: 780px;height: 20px; ">
    <h4 class="modal-title" id="myModalLabel">修改商品信息
    <a href="findAllP" class="btn btn-default" style="float: right; margin-top: -11px;" >返回</a>
    </h4>
</div>
<form action="updateP" method="post" name="myform">
    <table class="table table-striped  tw"  >
    <tr>
    <td> 商品编码:<input maxlength="10" type="text" value="${list.productId}" class="form-control" name="productId" readonly="readonly"></td>
    <td>商品名称:<input id="t1"  onblur="show1()" onkeyup="value=value.replace(/[\d]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[\d]/g,''))" type="text" name="productName" class="form-control" placeholder="输入商品名称"  value="${list.productName}" ></td>
    </tr>
    <tr>
    <td>商品产地:<input id="t2" onblur="show1()"  onkeyup="value=value.replace(/[\d]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[\d]/g,''))" type="text" name="productAddress"class="form-control" placeholder="输入商品产地"  value="${list.productAddress}" ></td>
    <td>商品类别:
       <select  style="width: 200px;" name="productSort" " >
  			<option value="${list.productSort}" >${list.productSort}(已选中)</option>
  			<option value="日化用品" >日化用品</option>
  			<option value="名烟">名烟</option>
  			<option value="饮品">饮品</option>
		</select> 
    
    </tr>
    <tr>
    <td>进货价格:<input id="t3" onblur="show1()"   maxlength="5"  onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" type="text" value="${list.buyPrice}" class="form-control"  name="buyPrice"></td>
    <td>销售价格:<input id="t4" onblur="show1()"   maxlength="5"  onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" type="text" value="${list.retailoPrice}" class="form-control"  name="retailoPrice"></td>
    </tr>
    <tr>
    <td>商品说明:<input type="text" value="${list.productUction}" class="form-control" style=" width:330px;height: 50px;" name="productUction"></td>
    
    </tr>
    
<tr>
	<td colspan="4" style="text-align: center;">
	<input id="sub" type="submit" value="确定" class="btn btn-primary" style="width: 100px;"/>
    <span></span><span></span><span></span>
    <input type="reset" value="重置" class="btn btn-primary" style="width: 100px;"/>
    </td>
</tr>
</table>

</form>
<script type="text/javascript">
window.onload=function(){
var sub=document.getElementById("sub");
sub.onclick=function(){
 if(document.myform.productName.value==""){
alert("商品名称不能为空!");
return false; 
}else if(document.myform.productAddress.value==""){
alert("商品产地不能为空!");
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
  </body>
</html>
