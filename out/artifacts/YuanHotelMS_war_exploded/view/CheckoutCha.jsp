<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'SerchProductSal.jsp' starting page</title>
      <style type="text/css">
    body {
	width:1024px;
	height:auto;
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
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min1.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive1.css">
	<link rel="stylesheet" type="text/css" href="css/pace-theme-barber-shop1.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/datagrid-detailview.js"></script>
	<script type="text/javascript" src="js/pace.js"></script>
  <script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
  </head>
  <body>
  <div>
  <form method="post" class="form-horizontal" id="aa">
  	<div style="position: relative; margin-left: 10px;margin-top: 20px">
  		<label for="inputPassword" class="control-label" style="float: left;">结算单号：</label><input type="text"  name="checkId" id="spendId" class="form-control" placeholder="输入结算单号"  style="width: 200px;float: left;"/>
  		<label for="inputPassword" class="control-label" style="float: left;margin-left: 30px">入住单号：</label><input type="text"  name="liveId" id="liveId" class="form-control" placeholder="请输入入住单号"  style="width: 200px;float: left;"/>
  		<label for="inputPassword" class="control-label" style="float: left;margin-left: 30px">客人姓名：</label><input type="text"  name="customername" id="customername" class="form-control" placeholder="请输入客人姓名"  style="width: 200px;float: left;"/>
  		<input type="button" value="搜索" id="btn1"  class="btn" style="margin-left: 20px"/>
<div style="clear: both"></div>
  		
  	</div>
  	</form>
  	<div style="clear: both"></div>
  	<div style="margin-left: 10px;margin-top: 20px">
	<table id="dg" style="width:990px;height:500px"
			url=checkSelect
			 sortName="spendName" sortOrder="desc"
			title="查看结算账单"
			pagination="true"
			pageList="[5,10,20,30,40]"
			pageSize="10"
			singleSelect="true" fitColumns="true">
		<thead>
			<tr>
				<th field="checkId" align="center" width="166">结算单号</th>
				<th field="liveId" align="center" width="166">入住单号</th>
				<th field="realDays" align="center" width="166">实际天数</th>
				<th field="money" align="center" width="166">实收</th>
				<th field="checkTime" align="center" width="166">离店日期</th>
				<th field="names" width="166" align="center">操作人</th>
				<th field="roomId" width="166" align="center">房间号</th>
				<th field="customername" width="166" align="center">用户名称</th>
				<th field="phone" width="166" align="center">联系电话</th>
			</tr>
		</thead>
	</table>
	</div>
	</div>
	
	<script type="text/javascript">
	$('#dg').datagrid({//显示数据
	view: detailview,
	detailFormatter:function(index,row){
		return '<div style="padding:2px"><table class="ddv"></table></div>';
	},
	onExpandRow: function(index,row){
		var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
		
		$('#dg').datagrid('fixDetailRowHeight',index);
	}
});

	$("#btn1").click(function(){//条件搜索
			var spendId=$("#spendId").val();
			var liveId=$("#liveId").val();
			var customername=$("#customername").val();
			var grid = $('#dg');  
			var options = grid.datagrid('getPager').data("pagination").options;
			var page = options.pageNumber;//当前页数  
		 	var rows = options.pageSize;//每页的记录数（行数）  
			$("#dg").datagrid('load',{spendId:spendId,liveId:liveId,customername:customername,page:page,rows:rows});
			});
			
	
	</script>
  </body>
</html>
