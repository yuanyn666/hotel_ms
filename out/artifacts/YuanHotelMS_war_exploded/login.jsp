<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>同福客栈</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	 <link rel="stylesheet" type="text/css" href="css/stylel.css" />
	 	<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript">
			Cufon.replace('h1',{ textShadow: '1px 1px #fff'});
			Cufon.replace('h2',{ textShadow: '1px 1px #fff'});
			Cufon.replace('h3',{ textShadow: '1px 1px #000'});
			Cufon.replace('.back');
		</script>
<style type="text/css">
#s{
background-image: url(images/pp.PNG);
background-repeat: no-repeat;
}
#bn{
width: 130px;
height: 45px;
margin-top:5px;
margin-left: 35px;
}

</style>
  </head>
  
  <body>
 <div class="wrapper">
			<h1>同福客栈管理系统</h1>
			<h2>TongFuHotelMS</h2>
			<div class="content">
				<div id="form_wrapper" class="form_wrapper" >
					<form class="login active" method="post" id="fr">
						<h3>同福系统欢迎您的使用</h3>
						<div>
							<label>用户名:</label>
							<input type="text" id="name" name="names"  placeholder="请输入名字"/>
						</div>
						<div>
							<label>密码: </label>
							<input type="password" id="pwd"  name="pwd"  placeholder="请输入密码" />
						</div>
						<div class="bottom">
							<div class="remember"><input type="checkbox" /><span>记住选择</span></div>
							<input type="button" value="登录" id="bn"></input>
							<div class="clear"></div>
						</div>
					</form>
					
				</div>
			</div>
		</div>
</body>
<script type="text/javascript">
  $("#bn").click(function(){
      //alert("sdfs");
 $.post('login',$("#fr").serialize(),function(data){
	if(data=="true"){
		window.location="view/main.jsp";
	}else {
	alert("抱歉，亲。您输入的账户有误！");
	$("#pwd").val("");
	$("#name").val("").focus();//获取焦点
	}
   });
  });
  </script>
</html>
