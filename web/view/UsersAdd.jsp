<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'UsersAdd.jsp' starting page</title>
    
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
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css">
	<link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="themes/icon.css">
	<script src="js/bootstrap.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script  src="js/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
  </head>
  <style>
  body{font-size: 16px;}
  
  .tw{
width:650px; 
height:50px;
margin-top:20px;
margin-left:200px;
border: 1px solid gray;
overflow: auto;
}
#s{
width:5px;
height:5px;
color:red;
}
.mt{
width: 100px;
}
  </style>
 
  <body>
 
   <form action="addUsersC" method="post" onsubmit="return mycheck()">
   <table class="table table-striped table-hover tw">
   <caption><h4>新员工注册</h4></caption>
   <tr>
   <td>职位</td>
   <td><select name="usersRoleId" id="usersRoleId">
   	<option value="0">-请选择职位-</option>
   <c:forEach items="${listMR}" var="mr">
   
   	<option value="${mr.roleId}">${mr.roleName}</option>
   </c:forEach>
   </select></td>
   <td>姓名<span id="s">*</span></td>
   <td><input type="text" name="names" class="form-control" placeholder="请输入姓名"  onchange="myCheckName(this)" id="t1"></td>
   </tr>
   <tr>
   <td>密码<span id="s">*</span></td>
   <td><input type="password" name="userPwd" placeholder="请输入密码" onchange="myCkeckPwd(this)" id="t2">
   <input type="hidden" name="state" value="1"/></td>
   <td>性别</td>
   <td>
 			<input type="radio" name="userSex" checked="checked" value="男">&nbsp;男&nbsp;&nbsp;
			 <input type="radio" name="userSex" value="女">&nbsp;女</td>
			 </tr>
   <tr>
   <td>电话<span id="s">*</span></td>
   <td><input type="text" name="phone" class="form-control" placeholder="请输入电话号码" onchange="myCheckPhone(this)" id="t3"></td>
  	<td>地址</td><td><input type="text" name="address" class="form-control" placeholder="请输入地址" id="t4"></td>
	</tr>
   <tr><td>状态</td><td colspan="3"><input type="text" name="userFla" class="form-control" placeholder="请输入状态"></td></tr>
   <tr><td ></td><td style="text-align:center;"><button type="submit" class="btn btn-default mt" >提交</button></td>
   
   <td style="text-align:center;"><button type="reset" class="btn btn-default mt">重置</button></td><td></td></tr>
   </table>
</form>
   <script type="text/javascript">
   var str=true;
  //匹配名称
  function myCheckName(st){
  var name=/^[\u4e00-\u9fa5]{0,}$/; //中文
  var t1=$(st).val();
  if(!name.test(t1)){//test()表示是否存在，匹配到满足正则表达式的，条件表达式中表示true
  str=false;
  alert("用户名不为空，切只能为中文");
  }else{
  str=true;
  }
  };
  //密码
  function myCkeckPwd(st){
  var pwd=/^[a-zA-Z]\w{5,17}$/;//以字母开头，长度在6~18之间，只能包含字母、数字和下划线
  var t1=$(st).val();
  if(!pwd.test(t1)){
   str=false;
  alert("密码需字母开头，长度在6~18之间，只能包含字母、数字和下划线");
  }else{
  str=true;
  }
  };
   //电话
   function myCheckPhone(st){
   var phone=/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
   var t1=$(st).val();
  if(!phone.test(t1)){
   str=false;
  alert("您输入的手机号格式不正确");
  }else{
  str=true;
  }
 }
   function mycheck(){
    var name=/^[\u4e00-\u9fa5]{0,}$/; //中文
     var phone=/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
     var pwd=/^[a-zA-Z]\w{5,17}$/;//以字母开头，长度在6~18之间，只能包含字母、数字和下划线
   if($("#usersRoleId").val()==0){
   alert("请选择职位");
   str=false;
   }else if($("#t1").val()==""||!name.test($("#t1").val())){
 alert("用户名不为空，切只能为中文");
 str=false;
 }else if($("#t2").val()==""||!pwd.test($("#t2").val())){
   alert("密码需字母开头，长度在6~18之间，只能包含字母、数字和下划线。不为空");
  str=false;
 }else if($("#t3").val()==""||!phone.test($("#t3").val())){
  alert("手机号不为空或格式不正确");
  str=false;
 }
  return str; 
   }
   
   </script>
  </body>
</html>
