<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'UserUpdate.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
	<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
	<script>
	$(function(){
		$.post("findAllMyRoleCJ",function(data){//异步执行
			for(i=0;i<data.length;i++){
				if(data[i].roleId=="${user.usersRoleId}"){
					$("#p1").append("<option value='"+data[i].roleId+"' selected='selected'>"+data[i].roleName+"</option>");
				}else{
					$("#p1").append("<option value='"+data[i].roleId+"'>"+data[i].roleName+"</option>");
				}
			}
		});
		});
	</script>
	<style type="text/css">
	 #margin-form{
  width:300px;
  height:300px;
  margin: 30px auto;
  }

	</style>
  </head>
  <body>
     <div id="margin-form">
   <form action="updateUsersC" method="post" onsubmit="return mycheck()">
   <table>
   <caption><h4>修改员工信息</h4></caption>
   <tr><td><input type="hidden" name="userId" value="${user.userId }">职位：</td>
   <td><select id="p1" name="usersRoleId"></select></td></tr>
   
   <tr><td>姓名:</td><td><input type="text" name="names" value="${user.names }" onchange="myCheckName(this)" id="t1" ></td></tr>
   <tr><td>密码：</td><td><input type="password" name="userPwd" value="${user.userPwd }"  onchange="myCkeckPwd(this)"  id="t2"></td></tr>
   <tr><td>性别:</td><td>
   <c:choose>
   <c:when test="${user.userSex=='男'}">
   	<input type="radio" name="userSex" checked="checked" value="男">&nbsp;男&nbsp;&nbsp;
	<input type="radio" name="userSex" value="女">&nbsp;女</c:when>
	<c:when test="${user.userSex=='女'}">
   	<input type="radio" name="userSex" value="男">&nbsp;男&nbsp;&nbsp;
	<input type="radio" name="userSex"  checked="checked" value="女">&nbsp;女</c:when>
   </c:choose></td></tr>
   <tr><td>联系电话:</td><td><input type="text" name="phone" value="${user.phone }" class="form-control"  onchange="myCheckPhone(this)" id="t3"></td></tr>
   <tr><td>地址：</td><td>
		<input type="text" name="address" value="${user.address }" class="form-control"></td></tr>
		<tr><td>状态:</td><td><input type="text" name="userFla" value="${user.userFla }" class="form-control" ></td></tr>
   <tr><td colspan="2" style="text-align: center;"><button type="submit" class="btn btn-default">提交</button>&nbsp;&nbsp;
   <a href="UsersAll" class="btn btn-default">取消修改</a></td></tr>
   </table>
</form>
</div>

  </body>
  
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
  
</html>
