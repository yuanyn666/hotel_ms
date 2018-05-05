<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Bad.jsp' starting page</title>
    <style>
body {
	width:1050px;
	height:auto;
	color: #fff;
	background-image: url(img/bg2.jpg);
	background-size: cover;
	background-position: 50% 0;
}
</style>
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
	<link rel="stylesheet" type="text/css" href="css/bootstrap1.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive1.css">
	<link rel="stylesheet" type="text/css" href="css/pace-theme-barber-shop1.css">
	<link rel="stylesheet" type="text/css" href="css/xcConfirm.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/pace.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script><!-- 模态弹窗 -->
	<script type="text/javascript" src=js/jquery.ripples.js></script><!-- 水波背景 -->
  <script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
  </head>
  
  <body>
  <form action="" method="post" id="form" class="form-horizontal" >
  <div style="position: relative; margin-left: 285px;">
  <label for="inputPassword" class="control-label" style="float: left">名称：</label><input type="text"  name="name" id="name" class="form-control" placeholder="输入名称进行模糊查询"  style="width: 200px; float: left"/>
  <input type="button" id="btn2" value=查询 class="btn btn-success" style="margin-left: 50px" />
  </div>
  <div style="margin-left:10px;margin-top: 10px">
    <table id="tt" class="easyui-datagrid" style="width:990px;height:350px;"
			url="SelectBad"
			title="设置损坏"  fitColumns="true" singleSelect="true"
			rownumbers="true"
			>
		<thead>
			<tr>
				<th field="badId" width="400" align="center">标示</th>
				<th field="badName" width="400" align="center">名称</th>
				<th field="money" width="400" align="center">价格</th>
			</tr>
		</thead>
	</table>
	</div>
	<input type="button" value="添加" id="add" class="btn btn-primary" style="margin-left: 285px"/><input type="button" value="修改" id="update" class="btn btn-primary" style="margin-left: 100px"/><input type="button" value="删除" id="delete" class="btn btn-primary" style="margin-left: 100px"/>
	
	<br/>
	
	<div style="position: relative; margin-left: 10px;margin-top: 20px">
	<label for="inputPassword" class="control-label" style="float: left;">标示：</label><input type="text" name="badId" id="badId" readonly="readonly" class="form-control" placeholder="标示"  style="width: 200px;float: left;"/>
	<label for="inputPassword" class="control-label" style="float: left; margin-left: 30px">名称：</label><input type="text" name="badName" id="badName" class="form-control" placeholder="输入名称"  style="width: 200px;float: left;"/>
	<label for="inputPassword" class="control-label" style="float: left; margin-left: 30px">金额：</label><input type="number" name="money" id="money" class="form-control" placeholder="金额"  style="width: 200px;float: left;" min="1" />
	</div>
	<input type="submit" id="btn1" value="进行操作" class="btn btn-success" style="margin-left: 50px" />
	<input type="hidden" value="" id="yin" name="yin"/>
	</form>
  </body>
  <script type="text/javascript">  
  $(document).ready(function() {//水波纹特效
	try {
		$('body').ripples({
			resolution: 512,
			dropRadius: 20, //px
			perturbance: 0.04,
		});
	}
	catch (e) {
		$('.error').show().text(e);
	}
	$('.disable').show().on('click', function() {
		$('body, main').ripples('destroy');
		$(this).hide();
	});
});
  
  
  $("#update").click(function(){
  	var row = $('#tt').datagrid('getSelected');
  	var rows = $('#tt').datagrid('getSelections');
  			if(rows.length<1){
  				$.messager.alert('警告','修改时必须有选中行！');
  				return false;
  			}
			if (row){
			$("#badId").attr("disabled",false);
				$("#badId").val(row.badId);
				$("#badName").val(row.badName);
				$("#money").val(row.money);
				$("#yin").val("update");
			}
  });
    $("#add").click(function(){
				$("#badId").attr("disabled",true);
				$("#badId").val("");
				$("#badName").val("");
				$("#money").val("");
				$("#yin").val("add");
  });
    $("#delete").click(function(){
  	var row = $('#tt').datagrid('getSelected');
  	var rows = $('#tt').datagrid('getSelections');
  	if(rows.length<1){
  				$.messager.alert('警告','删除时必须有选中行！');
  				return false;
  			}
			if (row){
				$("#badId").val(row.badId);
				$("#badName").val(row.badName);
				$("#money").val(row.money);
				$("#yin").val("delete");
				var con;
				con=confirm("确定删除选中项吗?"); //在页面上弹出对话框
				if(con==true){
				$.ajax({
  					type:"post",
  					url:'AddBad',
    				data:$("#form").serialize(),
   					 async:false,//把异步提交关闭，设置为同步提交
   					 success: function(data){//成功之后跳转页面
   					 	layer.msg('删除成功', {icon: 1});
   					 	 location.replace("view/Bad.jsp") 
   					 }
      					 });
				}
				else{
					return;
				}
			}
  });
  $("#btn1").click(function(){
  		var badName=$("#badName").val();
  		var money=$("#money").val();
  		if(badName.length==0||money.length==0){
  		alert("不能为空");
  		return false;
  		}
  	$.ajax({
  	type:"post",
  	url:'AddBad',
    data:$("#form").serialize(),
    async:false,
    success: function(data){
    	layer.msg('执行成功', {icon: 1});
    }
       });
  });
  
  	$("#btn2").click(function(){
  		var name=$("#name").val();
  		$("#tt").datagrid('load',{name:name});
  	  	});
  </script>
</html>
