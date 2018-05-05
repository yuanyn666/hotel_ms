<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'SelectBreak2.jsp' starting page</title>
    
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
    <ul id="myTab" class="nav nav-tabs">
	<li class="active">
		<a href="#home" data-toggle="tab">
			 查看该入住的消费
		</a>
	</li>
	<li><a href="#ios" data-toggle="tab">查看全部入住的消费</a></li>
	
</ul>
<div id="myTabContent" class="tab-content">
	<div class="tab-pane fade in active" id="home">
	
	<div style="margin-left: 10px;margin-top: 20px">
	<table id="dg" style="width:950px;height:500px"
			url=SerchProductSalById
		 sortName="spendName" sortOrder="desc"
			title="查看历史消费"
			singleSelect="true" fitColumns="true">
		<thead>
			<tr>
				<th field="spendId" align="center" width="166">消费单号</th>
				<th field="liveId" align="center" width="166">入住单号</th>
				<th field="mark" align="center" width="166">备注</th>
				<th field="spendTime" align="center" width="166">消费时间</th>
				<th field="customerName" align="center" width="166">消费所用姓名</th>
				<th field="names" width="166" align="center">操作人</th>
			</tr>
		</thead>
	</table>
	</div>
	
	
	</div>
	<div class="tab-pane fade" id="ios">
		<div>
  	
  		<form method="post" class="form-horizontal" id="aa">
  	<div style="position: relative; margin-left: 10px;margin-top: 20px">
  		<label for="inputPassword" class="control-label" style="float: left;">消费单号：</label><input type="text"  name="spendId" id="spendId" class="form-control" placeholder="输入消费单号"  style="width: 200px;float: left;"/>
  		<label for="inputPassword" class="control-label" style="float: left;margin-left: 30px">入住单号：</label><input type="text"  name="liveId" id="liveId" class="form-control" placeholder="请输入入住单号"  style="width: 200px;float: left;"/>
  		<label for="inputPassword" class="control-label" style="float: left;margin-left: 30px">客人姓名：</label><input type="text"  name="spendName" id="spendName" class="form-control" placeholder="请输入客人姓名"  style="width: 200px;float: left;"/>
  		<div style="clear: both"></div>
  		<div style="margin-top: 20px">
  		<label for="inputPassword" >开始日期：</label><input type="text"  id="begin" name="begin" class="easyui-datebox"  style="width: 200px;" data-options="formatter:myformatter,parser:myparser" />
  		<label for="inputPassword" style="margin-left: 30px">结束日期：</label><input type="text"  id="end" name="end"  class="easyui-datebox"  style="width: 200px;" data-options="formatter:myformatter,parser:myparser"/>
  		<input type="button" value="搜索" id="btng"  class="btn" style="margin-left: 20px"/>
  		</div>
  	</div>
  	</form>
  	<div style="clear: both"></div>
  	<div style="margin-left: 10px;margin-top: 20px">
	<table id="gg" style="width:990px;height:500px"
			url=SerchProductSalByChar
			 sortName="spendName" sortOrder="desc"
			title="查看消费账单"
			pagination="true"
			pageList="[5,10,20,30,40]"
			pageSize="10"
			singleSelect="true" fitColumns="true">
		<thead>
			<tr>
				<th field="spendId" align="center" width="166">消费单号</th>
				<th field="liveId" align="center" width="166">入住单号</th>
				<th field="mark" align="center" width="166">备注</th>
				<th field="spendTime" align="center" width="166">消费时间</th>
				<th field="customerName" align="center" width="166">消费所用姓名</th>
				<th field="names" width="166" align="center">操作人</th>
			</tr>
		</thead>
	</table>
	</div>
  	
	</div>
	</div>
	
</div>

<script type="text/javascript">
$('#dg').datagrid({//查看历史记录
	view: detailview,
	detailFormatter:function(index,row){
		return '<div style="padding:2px"><table class="ddv"></table></div>';
	},
	onExpandRow: function(index,row){
		var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
		ddv.datagrid({
			url:'SerchProductSalInfo?spendId='+row.spendId,
			fitColumns:true,
			singleSelect:true,
			rownumbers:true,
			loadMsg:'',
			height:'auto',
			columns:[[
				{field:'productname',title:'商品的名称',width:100},
				{field:'gcodnum',title:'商品的数量',width:100},
				{field:'spendMoney',title:'付款数',width:100},
				{field:'spendTime',title:'时间',width:100}
			]],
			onResize:function(){
				$('#dg').datagrid('fixDetailRowHeight',index);//显示明细
			},
			onLoadSuccess:function(){
				setTimeout(function(){
					$('#dg').datagrid('fixDetailRowHeight',index);
				},0);
			}
		});
		$('#dg').datagrid('fixDetailRowHeight',index);
	}
});


$('#gg').datagrid({//显示数据
	view: detailview,
	detailFormatter:function(index,row){
		return '<div style="padding:2px"><table class="ddv"></table></div>';
	},
	onExpandRow: function(index,row){
		var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
		ddv.datagrid({
			url:'SerchProductSalInfo?spendId='+row.spendId,
			fitColumns:true,
			singleSelect:true,
			rownumbers:true,
			loadMsg:'',
			height:'auto',
			columns:[[
				{field:'productname',title:'商品的名称',width:100},
				{field:'gcodnum',title:'商品的数量',width:100},
				{field:'spendMoney',title:'付款数',width:100},
				{field:'spendTime',title:'时间',width:100}
			]],
			onResize:function(){
				$('#dg').datagrid('fixDetailRowHeight',index);//明细的显示
			},
			onLoadSuccess:function(){
				setTimeout(function(){
					$('#dg').datagrid('fixDetailRowHeight',index);
				},0);
			}
		});
		$('#dg').datagrid('fixDetailRowHeight',index);
	}
});

	$("#btng").click(function(){//条件搜索
			jiazai()
			});
			
		function myformatter(date){//修改时间格式
			var y = date.getFullYear();
			var m = date.getMonth()+1;
			var d = date.getDate();
			return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
		}
		function myparser(s){//修改时间格式
			if (!s) return new Date();
			var ss = (s.split('-'));
			var y = parseInt(ss[0],10);
			var m = parseInt(ss[1],10);
			var d = parseInt(ss[2],10);
			if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
				return new Date(y,m-1,d);
			} else {
				return new Date();
			}
		}
	
	function jiazai(){
		var spendId=$("#spendId").val();
			var liveId=$("#liveId").val();
			var spendName=$("#spendName").val();
			var begin=$('#begin').textbox('getValue');
			var end=$('#end').textbox('getValue');;//附加条件进行数据加载
			var grid = $('#gg');  
			var options = grid.datagrid('getPager').data("pagination").options;
			var page = options.pageNumber;//当前页数  
		 	var rows = options.pageSize;//每页的记录数（行数）  
			if(begin>end&&end!=""){
				$.messager.alert('警告','开始日期不能大于结束日期');//设置开始的日期不鞥大于结束日期
				return;
			}
			$("#gg").datagrid('load',{spendId:spendId,liveId:liveId,spendName:spendName,begin:begin,end:end,page:page,rows:rows});
	}
	
	 $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		 	jiazai();//点击的时候加载第二个页面
		 });
</script>
  </body>
</html>
