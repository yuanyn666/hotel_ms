<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();//项目名称
// http: //   主机名  :  端口号   项目名称
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html lang="en-US">
	<head>
	<%--	basePath必须放在head中间(表示绝对路径)	--%>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>同福酒店管理系统</title>
		<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript" charset="UTF-8" src="js/prefixfree.min.js"></script>
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
	
	
<style type="text/css">
*{margin:0;padding:0;list-style:none;border:0;}
/*background-color: #edecec;*/
body {
	background-color: #63adaa;
	font-family: "微软雅黑";
}
#nav{
background-color: #edecec;
}
.nav-menu {
	display: block;
	background: #74adaa;
	width: 99%;
	margin-left: 50px;
	margin-top: 5px;
}
.nav-menu > li {
	display: inline;
	float: left;
	border-right: 1px solid #94c0be;
	font-family: "微软雅黑";
}
.nav-menu > li:last-child {
	border-right: none;
}
.nav-menu li a {
	color: #fff;
	display: block;
	text-decoration: none;
	font-family: 'sansationregular';
	-webkit-font-smoothing: antialiased;
	-moz-font-smoothing: antialiased;
	font-smoothing: antialiased;
	text-transform: capitalize;
	overflow: visible;
	line-height: 20px;
	font-size: 20px;
	padding: 15px 30px 15px 31px;
}
/* animation domination */
.three-d {
	perspective: 200px;
	transition: all .07s linear;
	position: relative;
}
.three-d:not(.active):hover {
	cursor: pointer;
}
.three-d:not(.active):hover .three-d-box,  .three-d:not(.active):focus .three-d-box {
	transform: translateZ(-25px) rotateX(90deg);
}
.three-d-box {
	transition: all .3s ease-out;
	transform: translatez(-25px);
	transform-style: preserve-3d;
	pointer-events: none;
	position: absolute;
	top: 0;
	left: 0;
	display: block;
	width: 100%;
	height: 100%;
}
.front {
	transform: rotatex(0deg) translatez(25px);
}
.back {
	transform: rotatex(-90deg) translatez(25px);
	color: #FFE7C4;
}
.front, .back {
	display: block;
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
	background: #74adaa;
	padding: 15px 30px 15px 31px;
	color: white;
	pointer-events: none;
	box-sizing: border-box;
}
.nav-menu li .active .front,  .nav-menu li .active .back,  .nav-menu li a:hover .front,  .nav-menu li a:hover .back {
	background-color: #51938f;
	background-size: 5px 5px;
	background-position: 0 0, 30px 30px;
 background-image: -*-linear-gradient(45deg, #478480 25%, transparent 25%, transparent 75%, #478480 75%, #478480), linear-gradient(45deg, #478480 25%, transparent 25%, transparent 75%, #478480 75%, #478480);
}
.nav-menu ul {
	position: absolute;
	text-align: left;
	line-height: 40px;
	font-size: 14px;
	width: 200px;
	transition: all 0.3s ease-in;
	transform-origin: 0px 0px;
	transform: rotateX(-90deg);
	backface-visibility: hidden;
}
.nav-menu > li:hover ul {
	display: block;
	transform: rotateX(0deg);
}


#top1{
border: 0px red solid;
}
#lo{
float:right;
margin-right: 50px;
height: 30px;
width: 80px;
margin-top:-35px;
background: #74adaa;

}
</style>
</head>
<body>
<div id="top1">

<section class="demo">
<div id="nav">
<!--
欢迎使用同福酒店管理系统--登录人-->
<ul class="nav-menu clearfix unstyled">

<li><a class="three-d" > 系统 <span class="three-d-box">
<span class="front">系统</span><span class="back">系统</span></span> </a>
<ul class="clearfix unstyled drop-menu" id="p1">

</ul>
</li>

<li><a href="#" class="three-d">财务管理 <span class="three-d-box"><span class="front">财务管理</span><span class="back">财务管理</span></span> </a>
<ul class="clearfix unstyled drop-menu" id="p2">

</ul>
</li>
<li><a href="#" class="three-d"> 客房中心 <span class="three-d-box"><span class="front">客房中心</span><span class="back">客房中心</span></span> </a>
<ul class="clearfix unstyled drop-menu" id="p3">

</ul>
</li>
<li><a href="#" class="three-d"> 商品管理 <span class="three-d-box"><span class="front">商品管理 </span><span class="back">商品管理 </span></span> </a>
<ul class="clearfix unstyled drop-menu" id="p4">

</ul></li>
<li><a href="#" class="three-d"> 库存管理 <span class="three-d-box"><span class="front">库存管理 </span><span class="back">库存管理 </span></span> </a>
<ul class="clearfix unstyled drop-menu" id="p5">

</ul></li>
<li><a href="#" class="three-d">帮助中心 <span class="three-d-box"><span class="front">帮助中心 </span><span class="back">帮助中心 </span></span> </a>
<ul class="clearfix unstyled drop-menu" id="p6">

</ul>
</li>

</ul>
</div>
</section>
</div>
<span id="lo">登录人 :${myNames}</span>
<div>
<input type="hidden" id="usersRoleId" value="${myUsers.usersRoleId}"/>
<input type="hidden" id="userid" value="${myUsers.userId}"/>

<!--<br/>
<br/>
<br/>-->
<iframe src="<%=basePath%>showRoomIST" height="800px" width="100%" frameborder="0" name="main" title="主页面">
</iframe> 
</div>


<!--<div style="width: 100%; height: 50px; line-height: 50px; text-align: center; clear: both; position: absolute; bottom: 0px;">
	同福系统感谢您的使用，同福方便你我他！
</div>
--></body>
<script type="text/javascript">

$(function(){
var usersRId=$("#usersRoleId").val();
var userid=$("#userid").val();
//追加  根据用户职位ID
$.post("mainShow1",{usersRoleId:usersRId,userid:userid},function(data){
	for(i=0;i<data.length;i++){
	if(data[i].rightTip=="系统"){
	$("#p1").append("<li><a href='"+data[i].rightUrl+"' target='main' class='three-d'> "+data[i].ringhtText+" <span class='three-d-box'><span class='front'>"+data[i].ringhtText+"</span><span class='back'>"+data[i].ringhtText+" </span></span> </a></li>");
	}
	if(data[i].rightTip=="财务管理"){
	$("#p2").append("<li><a href='"+data[i].rightUrl+"' target='main' class='three-d'> "+data[i].ringhtText+" <span class='three-d-box'><span class='front'>"+data[i].ringhtText+"</span><span class='back'>"+data[i].ringhtText+" </span></span> </a></li>");
	}
	if(data[i].rightTip=="客房中心"){
	$("#p3").append("<li><a href='"+data[i].rightUrl+"' target='main' class='three-d'> "+data[i].ringhtText+" <span class='three-d-box'><span class='front'>"+data[i].ringhtText+"</span><span class='back'>"+data[i].ringhtText+" </span></span> </a></li>");
	}
	if(data[i].rightTip=="商品管理"){
	$("#p4").append("<li><a href='"+data[i].rightUrl+"' target='main' class='three-d'> "+data[i].ringhtText+" <span class='three-d-box'><span class='front'>"+data[i].ringhtText+"</span><span class='back'>"+data[i].ringhtText+" </span></span> </a></li>");
	}
	if(data[i].rightTip=="库存管理"){
	$("#p5").append("<li><a href='"+data[i].rightUrl+"' target='main' class='three-d'> "+data[i].ringhtText+" <span class='three-d-box'><span class='front'>"+data[i].ringhtText+"</span><span class='back'>"+data[i].ringhtText+" </span></span> </a></li>");
	}
	if(data[i].rightTip=="帮助中心"){
	$("#p6").append("<li><a href='"+data[i].rightUrl+"' target='main' class='three-d'> "+data[i].ringhtText+" <span class='three-d-box'><span class='front'>"+data[i].ringhtText+"</span><span class='back'>"+data[i].ringhtText+" </span></span> </a></li>");
	}
}
});

});

</script>
</html>
