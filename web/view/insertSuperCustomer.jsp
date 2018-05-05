<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加会员</title>
    
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
#s{
width:5px;
height:5px;
color:red;
}
.tw{
border: 1px solid gray;
width:680px; 
height:50px;
margin-top:0px;
margin-left:150px;
overflow: auto;
}
#reset{
margin-left: 450px;
}
</style>
<script type="text/javascript">
 function check(){
var t1=$("#t1").val();
var t2=$("#t2").val();
var t3=$("#t3").val();
var t4=$("#t4").val();
var t5=$("#a").val();
if(t1==0){
alert("姓名不可以为空");
return false;
}else if(t2==0){
alert("地址不可以为空");
return false;
}else if(t3==0){
alert("电话不可以为空");
return false;
 }if(t3.length!=11){
alert("电话位数不正确");
return false;
}else if(t4==0){
alert("证件号不可以为空");
return false;
 }else if(t5==0){
alert("请充值！");
return false;
 }
}
  </script>
  </head>
  
  <body>
    <form action="insertSuper"  method="post" class="form-horizontal f1" onsubmit="return check()">
    <table class="table table-hover tw">
    <tr><td colspan="4" style="text-align: center;">添加会员
     <a href="showSuper" id="reset" class="btn btn-primary">取消添加</a></td></tr>
    <tr><td>卡号</td>
    <td><input type="text" name="spId" value="${spId}" class="form-control" readonly="readonly"/></td>
    <td>姓名<span id="s">*</span></td>
    <td><input type="text" id="t1" name="spName" class="form-control" onchange="if(/[^\u4E00-\u9FA5]/g.test(this.value)){alert('姓名只能输入汉字');this.value='';}"/>
    <!-- 标识 --><input type="hidden" name="state" value="1" /></td></tr>
    <tr>
    <td>性别<span id="s">*</span></td>
    <td><select name="spSex" class="form-control"/>
    <option>男</option><option>女</option></select></td>
    <td>证件类型</td><td><select name="spCardType" class="form-control"/>
    <option>身份证</option><option>临时身份证</option>
    <option>学生证</option><option>驾驶证</option></select></td>
    </tr>
    <tr>
    <td>地址<span id="s">*</span></td>
    <td><input type="text" id="t2" name="spAddress" class="form-control" onchange="if(/[^\u4E00-\u9FA5]/g.test(this.value)){alert('地址只能输入汉字');this.value='';}"/></td>
    <td>电话<span id="s">*</span></td>
    <td><input type="text" id="t3" name="spPhone" class="form-control" onchange="if(/\D/.test(this.value)){alert('电话只能输入数字');this.value='';}"/></td>
    </tr>
    <tr>
    <td>证件号<span id="s">*</span></td>
    <td><input type="text" id="t4" name="spCardId" class="form-control" onchange="if(/\D/.test(this.value)){alert('证件号只能输入数字');this.value='';}"/></td>
    <td>充值<span id="s">*</span></td>
    <td><input type="text" id="a" value="0" name="balance" class="form-control" onchange="change()"/></td>
    </tr>
    <tr>
    <td>积分</td><td>
     <input type="text" id="b" value="0" name="integration"class="form-control" readonly="readonly" /></td>
    <td>备注</td>
    <td><textarea rows="3" cols="15" name="mark" class="form-control"></textarea>
    </td></tr>
    <tr><td colspan="4" style="text-align: center;">
    <input type="submit" value="添加" class="btn btn-primary"/>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <input type="reset" value="重置" class="btn btn-primary"/></td></tr>
    </table>
    </form>
  </body>
  <script type="text/javascript">
 function change(){
var a=$("#a").val();
var b=a/100;
$("#b").val(b);
}
  </script>
</html>
