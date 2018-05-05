<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
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
	<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
	<link rel="stylesheet" type="text/css" href="themess/black/easyui.css">
	<link rel="stylesheet" type="text/css" href="themess/default/easyui.css">   
	<link rel="stylesheet" type="text/css" href="themess/icon.css"> 
	  <script type="text/javascript" src="js/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script> 
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="bootstrap.min.js"></script>
	
	<style>
		body{ font-size: 18;}
		a{font-size: 18; color: red;}
	a:hover {
	text-decoration: none;
}
.tw{
width:600px; 
height:200px;
margin:0px auto;
overflow: auto;
}
	</style>
  </head>
  
  <body>
      <div style="width: 810px; height: 350px; border: 1px solid black; margin: 50px 50px;">
      
     <div class="modal-header" style="width: 780px;height: 30px;">
        <h4 class="modal-title" id="myModalLabel">添加仓库
        <a href="findAllD" class="btn btn-default" style="float: right; width: 90px;">取消</a>
        </h4>
</div>
    <form action="insertDepotInfo" method="post" name="myform">
    <div class="modal-body" style="width: 780px;height: 200px;"><br/>
    <p>仓&nbsp;库&nbsp;号&nbsp;:&nbsp;<a>*</a><input type="text" name="depotId" value="${list}" readonly="readonly" class="form-control"/> </p>
    <p>仓库名称:<a>*</a><input type="text" name="depotName" class="form-control" placeholder="输入仓库名称"/></p> 
    <p>最大库存:<a>*</a><input type="text" name="depotNum" placeholder="输入最大库存" onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}"  class="form-control" /></p>
</div>
            
<div class="modal-footer" style="width: 780px;height: 40px;text-align: center;">
<input type="submit" value="添加" id="sub" class="btn btn-primary" style="width: 100px;height: 30px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" class="btn btn-default" value="重置" style="width: 100px;height: 30px;"/>
</div>
</form>
</div>
<script type="text/javascript">
window.onload=function(){
var sub=document.getElementById("sub");
sub.onclick=function(){
if(document.myform.depotId.value==""){
alert("仓库号不能为空!");
return false;
} else if(document.myform.depotName.value==""){
alert("仓库名不能为空!");
return false; 
}else if(document.myform.depotNum.value==""){
alert("仓库存量不能为空!");
return false; 
}
}}
</script>
</body>

</html>
