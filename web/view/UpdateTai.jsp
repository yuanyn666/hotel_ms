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
    
    <title>My JSP 'tai.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"></link>
	<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css"></link>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css"></link>
	<script type="text/javascript" src="js/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
	<script type="text/javascript" src="layer/layer.js"></script><!-- 模态弹窗 -->
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
#all{
border: 1px solid black;
 width: 500px; 
 height: 400px; 
 margin: 0px auto; 
 }
#left{
border: 0px solid red; 
width: 200px; 
height: 240px;
 float: left; 
 margin-left: 30px; 
 margin-top: 60px ;
 text-align: center;
 }
#right{
border: 0px solid red; 
width: 240px; 
height: 240px; 
float: right; 
margin-right: 20px;
margin-top: 60px;
text-align: center; 
}
#bottom{
border: 0px solid red;
margin-left: 180px; 
float: left; 
margin-top: 20px;
text-align: center;
}
#que{
margin-left: 50px;
}
#r{
font-size:30px;
 }
#t{
font-size: 18px;
}
p{
text-align: center;
font-size: 15px;
}
</style>
  </head>
  
  <body>
   <div id="all">
    <p>	房间号： <span id="r">${roomid}</span></p>
  			<c:forEach items="${rs}" var="s">
  			<input type="hidden" id="z" value="${s.roomState.roomStateId}"/>
  			</c:forEach>
  <form method="post" id="aasasdd">
  			<input type="hidden" name="roomId" value="${roomid}"/>
  			<div id="left">
  			<p id="t">设置房态</p>
  			<c:forEach items="${list}" var="s">
  			<p><input type="radio" value="${s.roomStateId}" name="roomStateId" class="dan"/>${s.roomState}</p>
  			</c:forEach>
  			</div>
  			<div id="right">
  			<p id="t">换房原因</p>
  			<p><textarea rows="6" cols="20" id="huan"></textarea></p>
  			</div>
  			<div id="bottom">
  			<input type="button" value="确定" class="btn btn-default" id="aasa"><span id="que"><input type="reset" value="取消" class="btn btn-default"></span> 
  			</div>
  			</form>
  </div>
  </body>
  <script type="text/javascript">
  $(".dan").each(function(){
  var s=$(this).val();
if(s==2){
$(this).attr("disabled",true);
}if(s==3){
$(this).attr("disabled",true);
}
  });
  
 var a=$("#z").val();
document.getElementsByName("roomStateId")[a-1].checked="checked";
	
	$("#aasa").click(function(){
		$.ajax({
  					type:"post",
  					url:'updat',
    				data:$("#aasasdd").serialize(),
   					 async:false,//把异步提交关闭，设置为同步提交
      					 });
      					 layer.msg('执行成功', {icon: 1});
	});
  </script>
</html>