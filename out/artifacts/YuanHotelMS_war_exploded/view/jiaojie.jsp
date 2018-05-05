<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'jiaojie.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="themes2/icon.css">
	<link rel="stylesheet" type="text/css" href="themes2/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap1.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min1.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive1.css">
	<link rel="stylesheet" type="text/css" href="css/pace-theme-barber-shop1.css"><!--进度条
	-->
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min1.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/datagrid-detailview.js"></script>
	<script type="text/javascript" src="js/pace.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script><!-- 模态弹窗 -->
	<script type="text/javascript" src=js/jquery.ripples.js></script><!-- 水波背景 -->
  </head>
  
  <body>
  <form method="post" id="ff">
    <div style="width: 400px; height: 270px;margin-top: 20px">
    	<label for="inputPassword" class="control-label" style="display:inline;margin-left: 10px">操作人：</label><input type="text" value="${myNames}" readonly="readonly" class="form-control" style="width: 100px;display:inline;"/><input type="hidden" name="userId" value="${myUsers.userId }"/>
    	<br/>
    	<div style="margin-left: 10px;margin-top: 20px">
    	<label for="name">未完成：</label>
    <textarea class="form-control" rows="3"  name="mark"  id="vv"  maxlength="150" placeholder="最大值为150"></textarea>
    <input type="button" value="进行交班" class="btn btn-success" style="margin-left: 310px;margin-top: 20px" id="btnn"/>
    </div>
    </div>
    </form>
    <script type="text/javascript">
    $("#btnn").click(function(){
    var con;
				con=confirm("确定进行交班吗?"); //在页面上弹出对话框
				if(con==true){
    	$.ajax({
  					type:"post",
  					url:'insertjioajie',
    				data:$("#ff").serialize(),
   					 async:false,//把异步提交关闭，设置为同步提交
   					 success: function(data){
   					 }
      					 });
      					 layer.msg('交班成功', {icon: 1});
      					 }else{
      					 setTimeout("dfg()",1);//否则关闭窗口
      					 }
    });
    function dfg(){
    	var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
         parent.layer.close(index);//关闭窗口
    }
    </script>
  </body>
</html>
