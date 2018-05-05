<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加房间类型</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
	<style>
.tw{
width:500px; 
height:50px;
margin-top:0px;
margin-left:200px;
border: 1px solid gray;
overflow: auto;
}
#s{
width:5px;
height:5px;
color:red;
}
#reset{
margin-left: 340px;
}
	</style>
	<script type="text/javascript">
 function check(){
var t1=$("#t1").val();
var t2=$("#t2").val();
var t3=$("#t3").val();
var t4=$("#t4").val();
if(t1==0){
alert("房类不可以为空");
return false;
}else if(t2==0){
alert("房价不可以为空");
return false;
}else if(t3==0){
alert("押金不可以为空");
return false;
}else if(t4==0){
alert("预定金不可以为空");
return false;
}
}
  </script>
  </head>
  
  <body>
       <form action="insertRT"  method="post" class="form-horizontal f1"  onsubmit="return check()">
    <table class="table  table-hover tw">
     <tr><td colspan="2" style="text-align: center;">添加房类
       <a href="showRoomType" id="reset" class="btn btn-primary">取消添加</a></td></tr>
    <tr><td>房类<span id="s">*</span></td><td><input type="text" id="t1" name="roomType" class="form-control" onchange="if(/[^\u4E00-\u9FA5]/g.test(this.value)){alert('房类只能输入汉字');this.value='';}"/></td></tr>
    <tr><td>房价<span id="s">*</span></td><td><input type="text"  id="t2" name="roomPrice" class="form-control" onchange="if(/\D/.test(this.value)){alert('房价只能输入数字');this.value='';}"/></td></tr>
    <tr><td>押金<span id="s">*</span></td><td><input type="text"  id="t3" name="money" class="form-control" onchange="if(/\D/.test(this.value)){alert('押金只能输入数字');this.value='';}"/></td></tr>
    <tr><td>预定金<span id="s">*</span></td><td><input type="text" id="t4"  name="bookMoney" class="form-control" onchange="if(/\D/.test(this.value)){alert('预定金只能输入数字');this.value='';}"/></td></tr>
    <tr><td>介绍</td><td>
    <textarea rows="3" cols="15" name="roomMark" class="form-control"></textarea></td></tr>
    <tr>
     <td colspan="2" style="text-align: center;">
     <input type="submit" value="添加" class="btn btn-primary"/>
         &nbsp;&nbsp;  &nbsp;&nbsp;
     <input type="reset" value="重置" class="btn btn-primary"/></td>
     </tr>
    </table>
    </form>
  </body>
</html>
