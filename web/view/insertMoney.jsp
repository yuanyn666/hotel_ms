<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>会员充值</title>
    
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
border: 1px solid gray;
width:500px; 
height:50px;
margin:100px auto;
overflow: auto;
}
#reset{
margin-left: 320px;
}
</style>
<script type="text/javascript">
function check(){
var a=$("#a").val();
if(a==0){
alert("请充值！");
return false;
}
}
</script>
  </head>
  
  <body>
    <form action="insertMoney" method="post" onsubmit=" return check()">
    <table class="table  table-hover tw">
    <tr><td colspan="2" style="text-align: center;">会员充值
    <a href="showSuper" id="reset" class="btn btn-primary">取消充值</a></td></tr>
    <tr><td>卡号</td><td><input type="text" value="${sp.spId}" name="spId" class="form-control" readonly="readonly"/></td></tr>
    <tr><td>会员名</td>
    <td><input type="text" value="${sp.spName}" name="spName" class="form-control" readonly="readonly"/></td></tr>
     <tr><td>充值金额</td>
     <td><input type="text" id="a" name="newMoney" id="a" class="form-control" onchange="change()"/></td></tr>
     <tr><td>积分</td>
     <td>
     <input type="text"  name="newJF"  id="b"  class="form-control" value="0" readonly="readonly" />
     </td></tr>
     <tr>
     <td colspan="2" style="text-align: center;">
     <input type="submit" value="充值" class="btn btn-primary"/>
         &nbsp;&nbsp;&nbsp;&nbsp;
     <input type="reset" value="重置" class="btn btn-primary"/></td></tr>
    </table>
    </form>
  </body>
  <script type="text/javascript">
 function change(){
var a=$("#a").val();
var b=a/100;
$("#b").val(b)
}
  </script>
</html>
